#!/usr/bin/env python3
"""
Add watermarks to artwork images
Creates watermarked copies in a new directory, preserving originals
"""

from PIL import Image, ImageDraw, ImageFont
import os
from pathlib import Path

# Configuration
INPUT_DIR = "instagram-art"
OUTPUT_DIR = "instagram-art-watermarked"
WATERMARK_TEXT = "© Snippet and Splotch"
WATERMARK_POSITION = "bottom-right"  # Options: bottom-right, bottom-left, center, diagonal
OPACITY = 128  # 0-255 (0=transparent, 255=opaque)
FONT_SIZE = 30  # Adjust based on your image sizes

def add_watermark(input_path, output_path, text, position="bottom-right", opacity=128):
    """Add watermark to a single image"""
    try:
        # Open image
        img = Image.open(input_path)

        # Convert to RGBA if needed
        if img.mode != 'RGBA':
            img = img.convert('RGBA')

        # Create transparent overlay
        txt_layer = Image.new('RGBA', img.size, (255, 255, 255, 0))
        draw = ImageDraw.Draw(txt_layer)

        # Try to use a nice font, fallback to default
        try:
            font = ImageFont.truetype("/System/Library/Fonts/Supplemental/Georgia.ttf", FONT_SIZE)
        except:
            font = ImageFont.load_default()

        # Get text bounding box
        bbox = draw.textbbox((0, 0), text, font=font)
        text_width = bbox[2] - bbox[0]
        text_height = bbox[3] - bbox[1]

        # Calculate position
        margin = 20
        if position == "bottom-right":
            x = img.width - text_width - margin
            y = img.height - text_height - margin
        elif position == "bottom-left":
            x = margin
            y = img.height - text_height - margin
        elif position == "center":
            x = (img.width - text_width) // 2
            y = (img.height - text_height) // 2
        elif position == "diagonal":
            # Diagonal across center
            x = img.width // 2
            y = img.height // 2
            # Create rotated text overlay (more complex)
            txt_layer = Image.new('RGBA', img.size, (255, 255, 255, 0))
            draw = ImageDraw.Draw(txt_layer)

        # Draw text with background
        padding = 10
        draw.rectangle([
            x - padding,
            y - padding,
            x + text_width + padding,
            y + text_height + padding
        ], fill=(0, 0, 0, opacity // 2))

        # Draw text
        draw.text((x, y), text, fill=(255, 255, 255, opacity), font=font)

        # Composite watermark onto image
        watermarked = Image.alpha_composite(img, txt_layer)

        # Convert back to RGB for saving as JPEG
        if output_path.lower().endswith('.jpg') or output_path.lower().endswith('.jpeg'):
            watermarked = watermarked.convert('RGB')

        # Save
        watermarked.save(output_path, quality=95)
        print(f"✓ Watermarked: {os.path.basename(output_path)}")

    except Exception as e:
        print(f"✗ Error processing {input_path}: {e}")

def main():
    """Process all images in the input directory"""
    # Create output directory
    Path(OUTPUT_DIR).mkdir(exist_ok=True)

    # Get all image files
    image_extensions = {'.jpg', '.jpeg', '.png', '.gif'}
    input_path = Path(INPUT_DIR)

    if not input_path.exists():
        print(f"Error: Directory '{INPUT_DIR}' not found!")
        return

    images = [f for f in input_path.iterdir()
              if f.suffix.lower() in image_extensions]

    if not images:
        print(f"No images found in '{INPUT_DIR}'")
        return

    print(f"\nAdding watermarks to {len(images)} images...")
    print(f"Watermark: '{WATERMARK_TEXT}'")
    print(f"Position: {WATERMARK_POSITION}")
    print(f"Output: {OUTPUT_DIR}/\n")

    # Process each image
    for img_path in images:
        output_path = Path(OUTPUT_DIR) / img_path.name
        add_watermark(str(img_path), str(output_path), WATERMARK_TEXT,
                     WATERMARK_POSITION, OPACITY)

    print(f"\n✓ Done! Watermarked images saved to '{OUTPUT_DIR}/'")
    print(f"Original images in '{INPUT_DIR}/' are unchanged.")

if __name__ == "__main__":
    main()
