# Multi-Page Collection Structure

## Overview

The website has been reorganized from a single-page layout to a multi-page structure inspired by professional art gallery websites like pavsarts.com. This provides better organization and user experience for browsing the 85 artworks.

## Structure

### Main Pages

1. **index.html** (Homepage)
   - Hero section with featured artwork
   - Featured collections preview (3 collections shown)
   - Collections preview section with "VIEW ALL COLLECTIONS" button
   - About section
   - Stories Behind the Art section
   - FAQ section
   - Contact section
   - Footer

2. **collections/index.html** (Collections Overview)
   - Shows all 7 art collection categories as cards
   - Each card displays:
     - Representative artwork image
     - Collection title
     - Number of artworks
     - Brief description
   - Clicking a card navigates to that collection's dedicated page

### Individual Collection Pages

Each collection has its own dedicated page in the `collections/` directory:

1. **collections/mixed-media.html** - 37 artworks
2. **collections/drawings-sketches.html** - 22 artworks
3. **collections/paintings-watercolors.html** - 11 artworks
4. **collections/colored-pencil.html** - 6 artworks
5. **collections/marker-illustrations.html** - 4 artworks
6. **collections/paper-art.html** - 4 artworks
7. **collections/sculptures.html** - 1 artwork

Each collection page includes:
- Breadcrumb navigation (Home / Collections / Category Name)
- Collection header with title, artwork count, and description
- 4-column responsive grid of artworks (1 column mobile, 3 tablet, 4 desktop)
- Each artwork displays: image, title, medium/size, and price
- GLightbox integration for fullscreen image viewing
- "BACK TO ALL COLLECTIONS" button
- Full navigation menu and footer

## Navigation

### Main Navigation (Desktop & Mobile)
- HOME - Links to index.html
- COLLECTIONS - Links to collections/index.html
- ABOUT - Links to #about section on homepage
- STORIES - Links to #stories section on homepage (removed from collection pages)
- FAQ - Links to #faq section on homepage (removed from collection pages)
- CONTACT - Links to #contact section on homepage

### Breadcrumbs (Collection Pages)
- Home → Collections → [Category Name]
- Allows easy navigation back to parent pages

## File Organization

```
my-website/
├── index.html                          # Main homepage
├── collections/
│   ├── index.html                      # Collections overview
│   ├── mixed-media.html               # Individual collection pages
│   ├── drawings-sketches.html
│   ├── paintings-watercolors.html
│   ├── colored-pencil.html
│   ├── marker-illustrations.html
│   ├── paper-art.html
│   └── sculptures.html
├── instagram-art/                      # Artwork images (shared by all pages)
├── logo-badge.png                      # Logo files (shared)
├── logo-wordmark.png
└── logo-monogram.png
```

## Benefits of Multi-Page Structure

1. **Better Performance** - Smaller page sizes load faster
2. **Improved Navigation** - Users can browse specific categories
3. **Professional Appearance** - Matches industry-standard art gallery websites
4. **SEO Optimization** - Each collection gets its own URL and metadata
5. **Better Organization** - 85 artworks organized into logical categories
6. **Enhanced User Experience** - Easier to find specific types of artwork

## Category Distribution

- Mixed Media: 37 artworks (43.5%)
- Drawings & Sketches: 22 artworks (25.9%)
- Paintings & Watercolors: 11 artworks (12.9%)
- Colored Pencil Works: 6 artworks (7.1%)
- Marker & Illustrations: 4 artworks (4.7%)
- Paper Art & Cutouts: 4 artworks (4.7%)
- Sculptures & 3D Art: 1 artwork (1.2%)

**Total: 85 unique artworks**
(89 total images - 4 duplicates in Featured Collections: #1, 5, 7, 48)

## Backup Files

- **index-before-multipage-structure.html** - Backup of single-page version with all 85 artworks
- **index-before-category-sections.html** - Earlier backup before category organization

## Technical Notes

- All pages use Tailwind CSS via CDN (no build process)
- Consistent brand colors and typography across all pages
- Relative paths used for navigation between pages
- GLightbox library for image viewing on collection pages
- Responsive design with mobile menu toggle
- All images lazy-loaded for performance

## Next Steps

1. ✓ Homepage with collections preview created
2. ✓ Collections overview page created
3. ✓ All 7 individual collection pages created
4. ✓ Navigation updated across all pages
5. ✓ Breadcrumbs added to collection pages

Optional future enhancements:
- Add individual artwork detail pages
- Implement filtering/sorting on collection pages
- Add "Related Artworks" sections
- Create dedicated Stories and FAQ pages
