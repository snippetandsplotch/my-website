# Watermark & Copyright Protection Guide

## ✅ What's Already Done

1. **COPYRIGHT NOTICE** - Added to all pages
   - Homepage footer has enhanced copyright notice
   - All 8 collection pages updated with copyright text
   - LICENSE file created in repository root

2. **FILES CREATED**
   - `LICENSE` - Legal copyright protection statement
   - `watermark-overlay.css` - CSS-based watermark overlay (Option A)
   - `add-watermarks.py` - Python script for permanent watermarks (Option B)

---

## 🎨 Watermark Options

### Option A: CSS Overlay Watermark ⭐ RECOMMENDED

**Pros:**
- ✅ Non-destructive (doesn't modify original images)
- ✅ Easy to enable/disable/customize
- ✅ No image processing needed
- ✅ Works immediately on all current and future images
- ✅ Can be toggled off for high-res downloads if you sell prints

**Cons:**
- ⚠️ Can be removed by tech-savvy users (but most won't bother)
- ⚠️ Doesn't protect against right-click save (use `disable-right-click.js` for that)

**How to Enable:**

1. Link the CSS file in your HTML files:

```html
<!-- Add this in the <head> section of index.html -->
<link rel="stylesheet" href="watermark-overlay.css">
```

2. For collection pages, use:

```html
<!-- Add this in the <head> section -->
<link rel="stylesheet" href="../watermark-overlay.css">
```

**Customization Options in `watermark-overlay.css`:**

- **Small corner watermark** - Default (bottom-right corner)
- **Diagonal watermark** - Add class `diagonal-watermark` to image wrapper
- **Custom text** - Edit `content: '© Snippet and Splotch';`
- **Opacity** - Adjust `rgba(255, 255, 255, 0.7)` (last number is opacity)
- **Position** - Change `bottom/right/top/left` values

---

### Option B: Permanent Image Watermarks

**Pros:**
- ✅ Permanent protection (embedded in image file)
- ✅ Can't be easily removed
- ✅ Works everywhere (downloads, shares, etc.)

**Cons:**
- ⚠️ Modifies image files (make sure you have backups!)
- ⚠️ Requires Python installed
- ⚠️ More visible/obtrusive

**How to Use:**

1. **Install Python Pillow library:**
   ```bash
   pip3 install Pillow
   ```

2. **Run the watermark script:**
   ```bash
   cd my-website
   python3 add-watermarks.py
   ```

3. **Review watermarked images:**
   - Output directory: `instagram-art-watermarked/`
   - Originals remain unchanged in `instagram-art/`

4. **If satisfied, replace originals:**
   ```bash
   # Backup originals first!
   mv instagram-art instagram-art-backup
   mv instagram-art-watermarked instagram-art
   ```

**Customization in `add-watermarks.py`:**
- `WATERMARK_TEXT` - Change the text
- `WATERMARK_POSITION` - Options: `bottom-right`, `bottom-left`, `center`, `diagonal`
- `OPACITY` - 0-255 (higher = more visible)
- `FONT_SIZE` - Larger number = bigger text

---

## 🛡️ Additional Protection Options

### 1. Disable Right-Click (Optional)

Create `disable-right-click.js`:

```javascript
// Disable right-click on images
document.addEventListener('contextmenu', (e) => {
    if (e.target.tagName === 'IMG') {
        e.preventDefault();
        return false;
    }
});

// Disable dragging images
document.addEventListener('dragstart', (e) => {
    if (e.target.tagName === 'IMG') {
        e.preventDefault();
        return false;
    }
});
```

Add to HTML: `<script src="disable-right-click.js"></script>`

⚠️ **Note:** This only stops casual users. Tech-savvy people can still bypass it.

### 2. Use Lower Resolution Images

Already recommended! Your current images are web-optimized, which is perfect.

### 3. Add Metadata to Images

You can embed copyright info directly in image EXIF data (requires separate tool).

---

## 💡 My Recommendation

**For your portfolio website:**

Use **Option A (CSS Overlay)** because:
1. Your images are already on Instagram (public anyway)
2. Non-destructive and easy to customize
3. Professional looking
4. Doesn't degrade image quality
5. Can disable for legitimate buyers

**Then add:**
- Enhanced copyright notice (✅ Already done!)
- LICENSE file (✅ Already done!)
- Optional: Disable right-click for extra deterrence

---

## 📋 Implementation Checklist

- [x] Add LICENSE file
- [x] Add copyright notice to footer (all pages)
- [ ] Choose watermark option (A or B)
- [ ] If Option A: Add CSS link to HTML files
- [ ] If Option B: Run Python script and review results
- [ ] Optional: Add right-click protection
- [ ] Test website locally
- [ ] Push changes to GitHub

---

## 🚀 Quick Start - Option A (Recommended)

I can implement the CSS watermark for you right now! It will:
- Add subtle "© Snippet and Splotch" watermark to bottom-right of all artwork images
- Be visible but not obtrusive
- Protect your work from casual copying

Would you like me to implement Option A now?
