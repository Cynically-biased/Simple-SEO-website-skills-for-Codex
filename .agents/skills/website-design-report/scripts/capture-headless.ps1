# Capture one viewport PNG with installed Microsoft Edge or Google Chrome.
# Run via Codex CLI in Windows PowerShell. No package install or desktop control.
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][string]$Url,
    [Parameter(Mandatory = $true)][string]$OutputPath,
    [ValidateRange(240, 4096)][int]$Width = 1440,
    [ValidateRange(240, 4096)][int]$Height = 900
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$parsed = $null
if (-not [Uri]::TryCreate($Url, [UriKind]::Absolute, [ref]$parsed) -or
    $parsed.Scheme -notin @('http', 'https')) {
    throw 'Url must be an absolute http:// or https:// URL.'
}

$paths = @(
    (Join-Path $env:ProgramFiles 'Microsoft\Edge\Application\msedge.exe'),
    (Join-Path ${env:ProgramFiles(x86)} 'Microsoft\Edge\Application\msedge.exe'),
    (Join-Path $env:ProgramFiles 'Google\Chrome\Application\chrome.exe'),
    (Join-Path ${env:ProgramFiles(x86)} 'Google\Chrome\Application\chrome.exe'),
    (Join-Path $env:LOCALAPPDATA 'Google\Chrome\Application\chrome.exe')
) | Where-Object { $_ -and (Test-Path -LiteralPath $_ -PathType Leaf) }
if (-not $paths) {
    foreach ($app in @('msedge.exe', 'chrome.exe')) {
        $candidate = Get-Command $app -ErrorAction SilentlyContinue
        if ($candidate) { $paths += $candidate.Source; break }
    }
}
if (-not $paths) { throw 'No installed Edge/Chrome executable was found.' }
$browser = $paths[0]

$destination = [IO.Path]::GetFullPath($OutputPath)
$parent = Split-Path -Parent $destination
if (-not (Test-Path -LiteralPath $parent -PathType Container)) {
    New-Item -ItemType Directory -Path $parent -Force | Out-Null
}
# Use a unique temporary browser profile, so user's browser sessions are untouched.
$profile = Join-Path ([IO.Path]::GetTempPath()) `
    ('codex-visual-qa-profile-' + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $profile -Force | Out-Null
try {
    $args = @(
        '--headless=new', '--disable-gpu', '--hide-scrollbars',
        '--no-first-run', '--no-default-browser-check',
        ('--user-data-dir=' + $profile),
        ('--window-size=' + $Width + ',' + $Height),
        ('--screenshot=' + $destination), $Url
    )
    # Chromium may emit harmless diagnostic messages to stderr; do not fail
    # merely because of them. Screenshot existence remains the success check.
    $previousPreference = $ErrorActionPreference
    try {
        $ErrorActionPreference = 'Continue'
        & $browser @args 2>$null | Out-Null
    }
    finally { $ErrorActionPreference = $previousPreference }
    if (-not (Test-Path -LiteralPath $destination -PathType Leaf)) {
        throw "Screenshot not produced by installed browser: $browser"
    }
    Write-Output $destination
}
finally {
    # Browser profile is isolated and disposable. Avoid touching user profiles.
    Remove-Item -LiteralPath $profile -Recurse -Force -ErrorAction SilentlyContinue
}
