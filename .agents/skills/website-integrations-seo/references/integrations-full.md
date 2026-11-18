# External Services & Integrations

## Overview
This document outlines the external services that need to be integrated into the website. All implementations should be completed before launch and verified during testing.

---

## Analytics & Tracking

### Google Analytics 4 (GA4)

**Purpose:** Track website traffic, user behavior, and conversion metrics

**Implementation Requirements:**
- **Measurement ID:** G-XXXXXXXXXX (replace with actual ID)
- **Installation Location:** partials/header.php before closing head tag
- **Pages to Track:** All pages (automatic once installed)

**Events to Track:**

1. Automatic Events:
   - Page views (automatic)
   - Scrolls (automatic)
   - Outbound clicks (automatic)
   - Site search (if implemented)
   - File downloads (automatic)

2. Custom Events to Implement:
   - Form submissions (contact form)
   - Button clicks on CTAs
   - Service page views
   - Phone number clicks
   - Email link clicks

**Installation Code:**

Place this code in partials/header.php before the closing head tag:

    <!-- Google tag (gtag.js) -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());
      gtag('config', 'G-XXXXXXXXXX');
    </script>

**Custom Event Example (Contact Form):**

Place in handlers/contact-handler.php after successful form submission:

    <script>
      gtag('event', 'form_submit', {
        'event_category': 'Contact',
        'event_label': 'Contact Form Submission'
      });
    </script>

**Post-Installation Steps:**
1. Create GA4 property in Google Analytics
2. Copy Measurement ID
3. Replace G-XXXXXXXXXX with actual ID
4. Test using GA4 DebugView
5. Set up conversion goals in GA4 interface
6. Configure data retention settings
7. Link to Google Search Console (recommended)

**Testing Checklist:**
- [ ] GA4 tag fires on all pages
- [ ] Real-time reports showing activity
- [ ] Contact form submissions tracked
- [ ] CTA button clicks tracked
- [ ] No console errors related to gtag.js

---

## SEO & Discovery

### XML Sitemap

**Purpose:** Help search engines discover, crawl, and index all website pages

**File Location:** /sitemap.xml (root directory)

**Pages to Include:**
1. Home page (/)
2. About page (/about.php)
3. Services overview (/services.php)
4. All service subpages (e.g., /services/service-name.php)
5. Contact page (/contact.php)

**Priority & Update Frequency:**

| Page Type | Priority | Change Frequency |
|-----------|----------|------------------|
| Home | 1.0 | Weekly |
| About | 0.8 | Monthly |
| Services (main) | 0.9 | Weekly |
| Service Subpages | 0.7 | Monthly |
| Contact | 0.6 | Monthly |

**Sitemap XML Structure:**

    <?xml version="1.0" encoding="UTF-8"?>
    <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
      
      <!-- Home Page -->
      <url>
        <loc>https://yourdomain.com/</loc>
        <lastmod>2024-01-20</lastmod>
        <changefreq>weekly</changefreq>
        <priority>1.0</priority>
      </url>
      
      <!-- About Page -->
      <url>
        <loc>https://yourdomain.com/about.php</loc>
        <lastmod>2024-01-20</lastmod>
        <changefreq>monthly</changefreq>
        <priority>0.8</priority>
      </url>
      
      <!-- Services Main Page -->
      <url>
        <loc>https://yourdomain.com/services.php</loc>
        <lastmod>2024-01-20</lastmod>
        <changefreq>weekly</changefreq>
        <priority>0.9</priority>
      </url>
      
      <!-- Service Subpage Example -->
      <url>
        <loc>https://yourdomain.com/services/custom-development.php</loc>
        <lastmod>2024-01-20</lastmod>
        <changefreq>monthly</changefreq>
        <priority>0.7</priority>
      </url>
      
      <!-- Contact Page -->
      <url>
        <loc>https://yourdomain.com/contact.php</loc>
        <lastmod>2024-01-20</lastmod>
        <changefreq>monthly</changefreq>
        <priority>0.6</priority>
      </url>
      
      <!-- Add additional service subpages here -->
      
    </urlset>

**Generation Options:**

**Option 1: Manual Creation**
- Create sitemap.xml in root directory
- Update manually when adding/removing pages
- Update lastmod dates when content changes

**Option 2: PHP Dynamic Generation**

Create sitemap.php that generates XML dynamically:

    <?php
    header("Content-Type: application/xml; charset=utf-8");
    echo '<?xml version="1.0" encoding="UTF-8"?>';
    ?>
    <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
      <url>
        <loc><?php echo 'https://' . $_SERVER['HTTP_HOST'] . '/'; ?></loc>
        <lastmod><?php echo date('Y-m-d'); ?></lastmod>
        <changefreq>weekly</changefreq>
        <priority>1.0</priority>
      </url>
      <!-- Add other URLs programmatically -->
    </urlset>

Then use .htaccess to rewrite:

    RewriteRule ^sitemap\.xml$ sitemap.php [L]

**robots.txt Reference:**

Create /robots.txt in root directory:

    User-agent: *
    Allow: /
    
    # Disallow handlers directory
    Disallow: /handlers/
    
    # Sitemap location
    Sitemap: https://yourdomain.com/sitemap.xml

**Maintenance:**
- Update sitemap when adding new pages
- Update lastmod when page content changes significantly
- Resubmit to Google Search Console after major updates
- Validate XML syntax using online validators

---

### Google Search Console

**Purpose:** Monitor search performance, indexing status, and identify SEO issues

**Setup Steps:**

**Step 1: Verification Method - HTML Meta Tag**

Location: partials/header.php in head section

Code Format:

    <meta name="google-site-verification" content="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" />

**How to Get Verification Code:**
1. Go to https://search.google.com/search-console
2. Click "Add Property"
3. Enter website URL (https://yourdomain.com)
4. Select "HTML tag" verification method
5. Copy the content value
6. Add meta tag to partials/header.php
7. Return to Search Console and click "Verify"

**Step 2: Submit Sitemap**

After verification:
1. In Google Search Console, go to "Sitemaps" section
2. Enter: sitemap.xml
3. Click "Submit"
4. Monitor for indexing status

**Step 3: Configure Settings**
- Set preferred domain (www vs non-www)
- Configure geographical targeting (if applicable)
- Set up email notifications for critical issues
- Request indexing for new pages

**Ongoing Monitoring:**

Weekly checks for:
- [ ] Coverage errors (pages not indexed)
- [ ] Mobile usability issues
- [ ] Core Web Vitals performance
- [ ] Security issues
- [ ] Manual actions (penalties)

Monthly reviews:
- [ ] Search query performance
- [ ] Page performance reports
- [ ] Linking domains
- [ ] Sitemaps processing status

**Key Reports to Monitor:**

1. Performance Report:
   - Total clicks
   - Total impressions
   - Average CTR
   - Average position
   - Top performing pages
   - Top search queries

2. Coverage Report:
   - Valid pages indexed
   - Pages with errors
   - Pages with warnings
   - Excluded pages

3. Enhancements:
   - Mobile usability
   - Core Web Vitals
   - Breadcrumbs (if implemented)

---

## Schema Markup (Structured Data)

**Purpose:** Help search engines understand website content and display rich results in search

**Implementation Location:** Add JSON-LD scripts to relevant pages, typically in partials/header.php or partials/footer.php before closing body tag

### 1. Organization Schema

**Where to Implement:** All pages (site-wide)

**Location:** partials/header.php or partials/footer.php

**Benefits:**
- Company knowledge panel in search results
- Rich snippets with logo and social profiles
- Enhanced brand visibility

**Code:**

    <script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "Organization",
      "name": "Your Company Name",
      "url": "https://yourdomain.com",
      "logo": "https://yourdomain.com/assets/images/logo.png",
      "description": "Brief description of your company and what you do",
      "telephone": "+1-555-123-4567",
      "email": "contact@yourdomain.com",
      "address": {
        "@type": "PostalAddress",
        "streetAddress": "123 Business Street, Suite 456",
        "addressLocality": "City Name",
        "addressRegion": "State",
        "postalCode": "12345",
        "addressCountry": "US"
      },
      "sameAs": [
        "https://www.facebook.com/yourcompany",
        "https://www.twitter.com/yourcompany",
        "https://www.linkedin.com/company/yourcompany",
        "https://www.instagram.com/yourcompany"
      ],
      "contactPoint": {
        "@type": "ContactPoint",
        "telephone": "+1-555-123-4567",
        "contactType": "customer service",
        "email": "contact@yourdomain.com",
        "availableLanguage": ["English"],
        "areaServed": "US"
      }
    }
    </script>

**Customization Required:**
- Replace all placeholder text with actual company information
- Update logo URL to actual logo path
- Add all active social media profiles
- Update address with actual business location
- Modify contact information
- Adjust areaServed based on service area

---

### 2. LocalBusiness Schema (If Applicable)

**When to Use:** If your company has a physical location customers visit

**Where to Implement:** Home page and Contact page

**Location:** Page-specific, in main content area or footer

**Benefits:**
- Local pack inclusion
- Google Maps integration
- Enhanced local search visibility
- Business hours display

**Code:**

    <script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "LocalBusiness",
      "name": "Your Company Name",
      "image": "https://yourdomain.com/assets/images/storefront.jpg",
      "url": "https://yourdomain.com",
      "telephone": "+1-555-123-4567",
      "priceRange": "$$",
      "address": {
        "@type": "PostalAddress",
        "streetAddress": "123 Business Street, Suite 456",
        "addressLocality": "City Name",
        "addressRegion": "State",
        "postalCode": "12345",
        "addressCountry": "US"
      },
      "geo": {
        "@type": "GeoCoordinates",
        "latitude": "40.7128",
        "longitude": "-74.0060"
      },
      "openingHoursSpecification": [
        {
          "@type": "OpeningHoursSpecification",
          "dayOfWeek": [
            "Monday",
            "Tuesday",
            "Wednesday",
            "Thursday",
            "Friday"
          ],
          "opens": "09:00",
          "closes": "17:00"
        }
      ],
      "sameAs": [
        "https://www.facebook.com/yourcompany",
        "https://www.twitter.com/yourcompany",
        "https://www.linkedin.com/company/yourcompany"
      ]
    }
    </script>

**Customization Required:**
- Add accurate business coordinates (use Google Maps)
- Set correct business hours
- Update price range ($, $$, $$$, $$$$)
- Add business category if applicable
- Include actual storefront/location image

---

### 3. WebSite Schema with Site Search

**Where to Implement:** Home page only

**Location:** index.php in footer or head

**Benefits:**
- Google search box in results
- Enhanced brand presence
- Direct site search from Google

**Code:**

    <script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "WebSite",
      "name": "Your Company Name",
      "url": "https://yourdomain.com",
      "description": "Professional [industry] services including [key services]",
      "potentialAction": {
        "@type": "SearchAction",
        "target": {
          "@type": "EntryPoint",
          "urlTemplate": "https://yourdomain.com/search.php?q={search_term_string}"
        },
        "query-input": "required name=search_term_string"
      }
    }
    </script>

**Note:** Only include potentialAction if you have a working site search feature. Remove this section if no search functionality exists.

---

### 4. Service Schema

**Where to Implement:** Each service subpage

**Location:** Individual service pages (e.g., /services/custom-development.php)

**Benefits:**
- Service details in search results
- Provider information display
- Enhanced service visibility

**Code Template:**

    <script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "Service",
      "serviceType": "Custom Web Development",
      "provider": {
        "@type": "Organization",
        "name": "Your Company Name",
        "url": "https://yourdomain.com"
      },
      "areaServed": {
        "@type": "Country",
        "name": "United States"
      },
      "description": "Professional custom web development services including responsive design, custom functionality, and ongoing support.",
      "offers": {
        "@type": "Offer",
        "availability": "https://schema.org/InStock",
        "priceSpecification": {
          "@type": "PriceSpecification",
          "priceCurrency": "USD",
          "price": "Contact for pricing"
        }
      }
    }
    </script>

**Implementation Strategy:**
- Create a reusable schema template
- Dynamically populate serviceType and description per page
- Update areaServed based on service coverage
- Modify pricing structure if you display prices

---

### 5. BreadcrumbList Schema

**Where to Implement:** All non-home pages

**Location:** Each page with breadcrumb navigation

**Benefits:**
- Breadcrumb display in search results
- Improved site navigation understanding
- Better page hierarchy representation

**Code Example (Service Subpage):**

    <script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "BreadcrumbList",
      "itemListElement": [
        {
          "@type": "ListItem",
          "position": 1,
          "name": "Home",
          "item": "https://yourdomain.com/"
        },
        {
          "@type": "ListItem",
          "position": 2,
          "name": "Services",
          "item": "https://yourdomain.com/services.php"
        },
        {
          "@type": "ListItem",
          "position": 3,
          "name": "Custom Development",
          "item": "https://yourdomain.com/services/custom-development.php"
        }
      ]
    }
    </script>

**Dynamic Implementation:**

Create a PHP function to generate breadcrumbs based on current page:

    <?php
    function generateBreadcrumbSchema($items) {
        $schema = [
            "@context" => "https://schema.org",
            "@type" => "BreadcrumbList",
            "itemListElement" => []
        ];
        
        foreach ($items as $position => $item) {
            $schema['itemListElement'][] = [
                "@type" => "ListItem",
                "position" => $position + 1,
                "name" => $item['name'],
                "item" => $item['url']
            ];
        }
        
        return json_encode($schema, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT);
    }
    
    // Usage in service subpage:
    $breadcrumbs = [
        ['name' => 'Home', 'url' => 'https://yourdomain.com/'],
        ['name' => 'Services', 'url' => 'https://yourdomain.com/services.php'],
        ['name' => 'Custom Development', 'url' => 'https://yourdomain.com/services/custom-development.php']
    ];
    ?>
    
    <script type="application/ld+json">
    <?php echo generateBreadcrumbSchema($breadcrumbs); ?>
    </script>

---

### 6. ContactPage Schema

**Where to Implement:** Contact page only

**Location:** contact.php

**Benefits:**
- Contact information in search results
- Enhanced local presence
- Direct contact options display

**Code:**

    <script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "ContactPage",
      "mainEntity": {
        "@type": "Organization",
        "name": "Your Company Name",
        "url": "https://yourdomain.com",
        "contactPoint": [
          {
            "@type": "ContactPoint",
            "telephone": "+1-555-123-4567",
            "contactType": "customer service",
            "email": "contact@yourdomain.com",
            "availableLanguage": ["English"],
            "areaServed": "US"
          },
          {
            "@type": "ContactPoint",
            "telephone": "+1-555-123-4568",
            "contactType": "sales",
            "email": "sales@yourdomain.com",
            "availableLanguage": ["English"],
            "areaServed": "US"
          }
        ]
      }
    }
    </script>

---

## Schema Validation & Testing

**Required Tools:**

1. Google Rich Results Test
   - URL: https://search.google.com/test/rich-results
   - Test each page with schema markup
   - Verify no errors or warnings
   - Check preview of rich results

2. Schema Markup Validator
   - URL: https://validator.schema.org/
   - Paste schema JSON or enter URL
   - Validate structure and syntax
   - Check for missing required properties

**Testing Checklist:**
- [ ] Organization schema validates without errors
- [ ] LocalBusiness schema (if used) validates
- [ ] WebSite schema validates
- [ ] Service schema on each subpage validates
- [ ] BreadcrumbList schema on all pages validates
- [ ] ContactPage schema validates
- [ ] No warnings in Rich Results Test
- [ ] Preview displays expected information

**Common Schema Errors to Avoid:**
- Missing required properties
- Incorrect date formats (use ISO 8601)
- Invalid URLs (must be absolute, including https://)
- Incorrect @type values
- Duplicate schemas with conflicting information
- Missing closing braces in JSON

---

## Implementation Priority & Timeline

### Phase 1: Pre-Launch (Week 1)
- [ ] Install Google Analytics 4 code
- [ ] Create and upload sitemap.xml
- [ ] Create robots.txt
- [ ] Implement Organization schema (site-wide)
- [ ] Implement BreadcrumbList schema
- [ ] Set up Google Search Console property

### Phase 2: Launch Week
- [ ] Verify Google Analytics is tracking
- [ ] Submit sitemap to Google Search Console
- [ ] Complete Google Search Console verification
- [ ] Test all schema markup with validation tools
- [ ] Verify no console errors on any page

### Phase 3: Post-Launch (Week 2-3)
- [ ] Implement Service schema on all service pages
- [ ] Implement ContactPage schema
- [ ] Add LocalBusiness schema (if applicable)
- [ ] Set up GA4 custom events for forms
- [ ] Configure GA4 conversion goals
- [ ] Monitor Search Console for indexing

### Phase 4: Ongoing Maintenance
- [ ] Weekly: Check GA4 for traffic and conversions
- [ ] Weekly: Review Search Console coverage reports
- [ ] Monthly: Update sitemap if pages added/removed
- [ ] Monthly: Review schema markup for accuracy
- [ ] Quarterly: Audit all tracking and integrations

---

## Troubleshooting Guide

### Google Analytics Not Tracking

**Check:**
- Measurement ID is correct (starts with G-)
- Script is in head before closing tag
- No ad blockers preventing tracking
- Check browser console for errors
- Use GA4 DebugView for real-time testing

**Solution:**
- Clear browser cache
- Test in incognito mode
- Verify script loads in network tab
- Check for JavaScript errors blocking execution

---

### Sitemap Not Being Indexed

**Check:**
- Sitemap is accessible at https://yourdomain.com/sitemap.xml
- XML syntax is valid (no errors)
- All URLs use https:// and full domain
- Sitemap submitted in Search Console
- robots.txt not blocking sitemap

**Solution:**
- Validate XML with online validator
- Ensure proper UTF-8 encoding
- Check server headers (should be application/xml)
- Resubmit in Search Console
- Wait 24-48 hours for processing

---

### Schema Markup Errors

**Check:**
- JSON syntax is correct (use validator)
- All required properties included
- URLs are absolute with https://
- No duplicate schemas on same page
- Matching properties across different schemas

**Solution:**
- Use Schema.org validator
- Test with Google Rich Results Test
- Review documentation for required properties
- Ensure valid JSON formatting
- Check for typos in property names

---

### Search Console Verification Failed

**Check:**
- Meta tag is in head section
- Meta tag is on all pages (in header partial)
- No typos in verification code
- Changes deployed to live server
- Browser cache cleared

**Solution:**
- Re-copy verification code from Search Console
- Verify code appears in page source (view source)
- Check partials/header.php is included on all pages
- Wait a few minutes and retry verification
- Try alternative verification method (HTML file upload)

---

## Documentation & Resources

### Google Analytics 4
- Setup Guide: https://support.google.com/analytics/answer/9304153
- Event Tracking: https://support.google.com/analytics/answer/9267735
- Measurement Protocol: https://developers.google.com/analytics/devguides/collection/protocol/ga4

### Google Search Console
- Getting Started: https://support.google.com/webmasters/answer/9128668
- Sitemap Guide: https://support.google.com/webmasters/answer/183668
- Verification Methods: https://support.google.com/webmasters/answer/9008080

### Schema Markup
- Schema.org Documentation: https://schema.org/
- Google Structured Data: https://developers.google.com/search/docs/appearance/structured-data/intro-structured-data
- Rich Results Test: https://search.google.com/test/rich-results
- Schema Validator: https://validator.schema.org/

### XML Sitemaps
- Sitemap Protocol: https://www.sitemaps.org/protocol.html
- Best Practices: https://developers.google.com/search/docs/crawling-indexing/sitemaps/build-sitemap

---

## Compliance & Privacy

### GDPR Considerations

If serving users in the EU:
- Implement cookie consent banner
- Allow users to opt-out of analytics
- Update privacy policy to mention Google Analytics
- Anonymize IP addresses in GA4 (enabled by default in GA4)

### Privacy Policy Requirements

Must include information about:
- Google Analytics data collection
- What data is collected (pages viewed, duration, device info)
- How data is used (improving user experience)
- Third-party service (Google)
- User rights (opt-out options)

### Cookie Consent

If implementing cookie consent:
- Load GA4 only after user consent
- Store consent preference
- Provide easy opt-out mechanism
- Update consent banner text

---

## Contact & Support

### Who to Contact for Issues

**Google Analytics:**
- Internal point of contact: [Marketing Manager/Developer]
- Google Analytics Support: https://support.google.com/analytics

**Google Search Console:**
- Internal point of contact: [SEO Manager/Developer]
- Search Console Help: https://support.google.com/webmasters

**Schema Markup:**
- Internal point of contact: [Developer/Technical SEO]
- Community Forum: https://groups.google.com/g/structured-data

**Technical Implementation:**
- Primary Developer: [Name/Email]
- Backup Contact: [Name/Email]

---

**Last Updated:** [Date]

**Document Version:** 1.0

**Next Review Date:** [Date + 3 months]