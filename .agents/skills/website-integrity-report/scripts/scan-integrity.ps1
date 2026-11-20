param(
    [string] $Root = '.',
    [int] $MaxFindings = 200
)

# Read-only deterministic scan. No files are created, changed, or deleted.
$ErrorActionPreference = 'Stop'
$rootPath = (Resolve-Path -LiteralPath $Root).Path
$utf8Strict = New-Object System.Text.UTF8Encoding($false, $true)
$skipDirs = @('.git','node_modules','vendor','.agents','.vscode','.next',
    'dist','build','coverage','cache','.cache','tmp','temp','graphify-out')
$textExtensions = @('.php','.phtml','.html','.htm','.js','.mjs','.cjs',
    '.ts','.tsx','.jsx','.json','.css','.scss','.md','.txt','.xml','.yml',
    '.yaml','.svg','.ini','.conf','.env','.htaccess','.sql','.sh','.ps1')
$findings = New-Object System.Collections.Generic.List[object]
$scanned = 0; $excluded = 0; $parseChecked = 0
$php = Get-Command php -ErrorAction SilentlyContinue
$node = Get-Command node -ErrorAction SilentlyContinue

function Add-Finding($severity, $kind, $path, $line, $detail) {
    if ($findings.Count -ge $MaxFindings) { return }
    $findings.Add([pscustomobject]@{
        severity=$severity; kind=$kind; file=$path;
        line=$line; detail=$detail
    })
}

$files = Get-ChildItem -LiteralPath $rootPath -Recurse -File -Force -ErrorAction SilentlyContinue |
    Where-Object {
        $relative = $_.FullName.Substring($rootPath.Length).TrimStart('\','/')
        $parts = $relative -split '[\\/]'
        $skip = $false
        foreach ($part in $parts) {
            if ($skipDirs -contains $part -or $part -eq '__pycache__') {
                $skip = $true; break
            }
        }
        -not $skip
    }

foreach ($file in $files) {
    $rel = $file.FullName.Substring($rootPath.Length).TrimStart('\','/')
    $ext = $file.Extension.ToLowerInvariant()
    if (($textExtensions -notcontains $ext) -or
        ($file.Name -match '(\.min\.(js|css)$|\.lock$|^package-lock\.json$)') -or
        $file.Length -gt 2097152) {
        $excluded++; continue
    }
    $scanned++
    $bytes = [System.IO.File]::ReadAllBytes($file.FullName)
    try { $content = $utf8Strict.GetString($bytes) }
    catch {
        Add-Finding 'high' 'invalid-utf8' $rel 0 'Strict UTF-8 decoding failed; verify source encoding.'
        continue
    }
    if ($bytes.Length -ge 3 -and $bytes[0] -eq 239 -and
        $bytes[1] -eq 187 -and $bytes[2] -eq 191) {
        Add-Finding 'low' 'utf8-bom' $rel 1 'UTF-8 BOM present; check if allowed by the project.'
    }
    $crlf = [regex]::Matches($content, "`r`n").Count
    $bareLf = [regex]::Matches($content, '(?<!\r)\n').Count
    if ($crlf -gt 0 -and $bareLf -gt 0) {
        Add-Finding 'low' 'mixed-line-endings' $rel 0 'Both CRLF and LF line endings found.'
    }
    $lines = $content -split "`r`n|`n|`r"
    for ($i=0; $i -lt $lines.Count; $i++) {
        $line = $lines[$i]; $n = $i + 1
        if ($line.Contains([char]0xFFFD)) {
            Add-Finding 'medium' 'replacement-character' $rel $n 'Unicode replacement character U+FFFD found.'
        }
        if ($line -match '[\x00-\x08\x0B\x0C\x0E-\x1F\x7F]') {
            Add-Finding 'medium' 'unexpected-control' $rel $n 'Unexpected control character in text.'
        }
        if ($line -match '(Ã[\x80-\xBF]|Â[\x80-\xBF]|â[€-™])') {
            Add-Finding 'low' 'suspected-mojibake' $rel $n 'Potential double-decoded text; verify intended characters.'
        }
        if ($line -match '^\s*(<<<<<<<\s|=======\s*$|>>>>>>>\s)') {
            Add-Finding 'medium' 'conflict-marker' $rel $n 'Potential unresolved Git merge marker.'
        }
    }
    if ($ext -eq '.json') {
        try {
            $null = ConvertFrom-Json -InputObject $content -ErrorAction Stop
            $parseChecked++
        } catch {
            Add-Finding 'high' 'json-parse-error' $rel 0 'JSON parsing failed.'
        }
    }
    if ($ext -eq '.php' -and $php) {
        $message = & $php.Source -l $file.FullName 2>&1
        $parseChecked++
        if ($LASTEXITCODE -ne 0) {
            Add-Finding 'high' 'php-parse-error' $rel 0 (($message | Out-String).Trim())
        }
    }
    if (($ext -in @('.js','.mjs','.cjs')) -and $node) {
        $message = & $node.Source --check $file.FullName 2>&1
        $parseChecked++
        if ($LASTEXITCODE -ne 0) {
            Add-Finding 'medium' 'js-parse-error' $rel 0 (($message | Out-String).Trim())
        }
    }
}
[pscustomobject]@{
    root=$rootPath
    source_files_scanned=$scanned
    files_excluded_by_type_size_or_generation=$excluded
    parser_checks_completed=$parseChecked
    php_available=[bool]$php
    node_available=[bool]$node
    findings_truncated=($findings.Count -ge $MaxFindings)
    findings=@($findings.ToArray())
} | ConvertTo-Json -Depth 5
