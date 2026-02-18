# Website Setup Instructions

## Form Setup with Formspree

Your contact and newsletter forms are ready to work with [Formspree](https://formspree.io/), a free service that handles form submissions without needing a backend.

### Steps to Set Up:

1. **Go to Formspree**: Visit https://formspree.io/ and create a free account

2. **Create a New Form**:
   - Click "New Form" in your dashboard
   - Name it "Contact Form"
   - Copy the form endpoint URL (looks like: `https://formspree.io/f/xyzabc123`)

3. **Update Your HTML**:
   - Open `index.html`
   - Find line with: `action="https://formspree.io/f/YOUR_FORM_ID"`
   - Replace `YOUR_FORM_ID` with your actual form ID (2 places: contact form and newsletter form)

4. **Test Your Forms**:
   - Open your website
   - Fill out and submit the contact form
   - Check your Formspree dashboard for the submission
   - Emails will be sent to your registered email address

### Alternative: Direct Email (Quick & Easy)

If you don't want to set up Formspree immediately, you can use a simple mailto fallback:

Replace the contact form action with:
```html
<form action="mailto:snippetandsplotch@gmail.com" method="post" enctype="text/plain">
```

**Note**: This will open the user's email client. Formspree is recommended for a better user experience.

## Replacing Placeholder Images

Currently, the site uses placeholder images from `http://static.photos/*`. To use your actual artwork:

1. **Add Your Images**:
   - Place high-resolution images in the `image/` folder
   - Use descriptive filenames: `abstract-harmony.jpg`, `urban-dreams.jpg`, etc.

2. **Update HTML**:
   - Find all `src="http://static.photos/..."` references
   - Replace with `src="image/your-artwork.jpg"`

3. **Optimize Images**:
   - Resize portfolio thumbnails to 640x360px
   - Keep full-size versions at 1200x800px or larger for the lightbox
   - Use JPG for photos, PNG for graphics with transparency
   - Compress images using [TinyPNG](https://tinypng.com/) or similar

## Testing Locally

Open `index.html` in your browser, or use a local server:

```bash
cd my-website
python3 -m http.server 8000
```

Then visit: http://localhost:8000

## Deploying to GitHub Pages

1. Make sure your repository is named: `SnippetAndSploch.github.io`
2. Push your changes to GitHub
3. In repository Settings > Pages, set source to "main branch"
4. Your site will be live at: https://snippetandsploch.github.io

## New Features Added

✅ **SEO Meta Tags** - Better visibility in search results and social media
✅ **Image Lightbox** - Click any portfolio image to view full-size
✅ **Form Validation** - Required fields and proper email format checking
✅ **Lazy Loading** - Images load as you scroll for better performance
✅ **Accessible Alt Text** - Descriptive text for all images
✅ **Mobile Menu Improvements** - Better accessibility and auto-close on navigation
✅ **404 Page** - Custom error page for missing pages

## Recommended Next Steps

1. Set up Formspree for form handling
2. Replace all placeholder images with your actual artwork
3. Add a favicon (place `favicon.ico` in the root directory)
4. Consider adding Google Analytics to track visitors
5. Test the site on mobile devices
6. Add more portfolio pieces and shop items as your collection grows

## Need Help?

If you have questions or run into issues, feel free to ask!
