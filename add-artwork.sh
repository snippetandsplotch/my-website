#!/bin/bash
# ─────────────────────────────────────────────────────────────────────────────
# add-artwork.sh  —  Add a new artwork to the Snippet and Splotch website
#
# Usage:
#   ./add-artwork.sh "<image_path>" "<Artwork Title>" <collection>
#
# Collections:
#   portraits   →  Portraits & Figures
#   nature      →  Nature & Fauna
#   artisan     →  Artisan Works
#
# Examples:
#   ./add-artwork.sh ~/Desktop/tiger.jpg "Sunset Tiger" nature
#   ./add-artwork.sh "/Users/me/art/portrait.jpeg" "The Dreamer" portraits
#   ./add-artwork.sh ~/Desktop/vase.png "Clay Vase" artisan
# ─────────────────────────────────────────────────────────────────────────────

set -e

BOLD='\033[1m'; GREEN='\033[0;32m'; RED='\033[0;31m'; YELLOW='\033[1;33m'; BLUE='\033[0;34m'; NC='\033[0m'
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# ── Print usage ───────────────────────────────────────────────────────────────
usage() {
    echo ""
    echo -e "${BOLD}Usage:${NC}  ./add-artwork.sh \"<image_path>\" \"<Artwork Title>\" <collection>"
    echo ""
    echo -e "${BOLD}Collections:${NC}"
    echo "  portraits   →  Portraits & Figures"
    echo "  nature      →  Nature & Fauna"
    echo "  artisan     →  Artisan Works"
    echo ""
    echo -e "${BOLD}Examples:${NC}"
    echo "  ./add-artwork.sh ~/Desktop/tiger.jpg \"Sunset Tiger\" nature"
    echo "  ./add-artwork.sh \"/Users/me/art/face.jpeg\" \"The Dreamer\" portraits"
    echo "  ./add-artwork.sh ~/Downloads/vase.png \"Clay Vase\" artisan"
    echo ""
    exit 1
}

# ── Validate arguments ────────────────────────────────────────────────────────
if [ "$#" -ne 3 ]; then
    echo -e "${RED}Error: Expected 3 arguments, got $#${NC}"
    usage
fi

IMAGE_PATH="$1"
TITLE="$2"
COLLECTION="$3"

if [ ! -f "$IMAGE_PATH" ]; then
    echo -e "${RED}Error: Image not found: $IMAGE_PATH${NC}"
    exit 1
fi

# ── Map collection name to folder / HTML file ─────────────────────────────────
case "$COLLECTION" in
    portraits) FOLDER="portraits-figures"; COLLECTION_KEY="portraits" ;;
    nature)    FOLDER="nature-fauna";      COLLECTION_KEY="nature"    ;;
    artisan)   FOLDER="artisan-works";     COLLECTION_KEY="artisan"   ;;
    *)
        echo -e "${RED}Error: Unknown collection '${COLLECTION}'${NC}"
        echo "Valid options: portraits, nature, artisan"
        exit 1
        ;;
esac

HTML_FILE="collections/${FOLDER}.html"

# ── Build safe filename from title ───────────────────────────────────────────
ORIGINAL="$(basename "$IMAGE_PATH")"
EXT="${ORIGINAL##*.}"
EXT="$(echo "$EXT" | tr '[:upper:]' '[:lower:]')"
SAFE_NAME="$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g' | sed 's/[^a-z0-9-]//g')"
SAFE_FILENAME="${SAFE_NAME}.${EXT}"
DEST_PATH="${SCRIPT_DIR}/${FOLDER}/${SAFE_FILENAME}"

# ── Validate image extension ──────────────────────────────────────────────────
case "$EXT" in
    jpg|jpeg|png|webp|gif) ;;
    heic|heif)
        echo -e "${RED}Error: HEIC/HEIF files are not supported by browsers.${NC}"
        echo "Convert first:  sips -s format jpeg \"$IMAGE_PATH\" --out ~/Desktop/${SAFE_NAME}.jpg"
        exit 1
        ;;
    *)
        echo -e "${YELLOW}Warning: Extension '.${EXT}' may not be supported in browsers.${NC}"
        read -rp "Continue anyway? (y/n): " CONFIRM
        [ "$CONFIRM" != "y" ] && exit 0
        ;;
esac

# ── Confirm if destination already exists ────────────────────────────────────
if [ -f "$DEST_PATH" ]; then
    echo -e "${YELLOW}Warning: ${FOLDER}/${SAFE_FILENAME} already exists.${NC}"
    read -rp "Overwrite? (y/n): " CONFIRM
    [ "$CONFIRM" != "y" ] && { echo "Aborted."; exit 0; }
fi

# ── Summary ───────────────────────────────────────────────────────────────────
echo ""
echo -e "${BOLD}Adding artwork:${NC}"
echo -e "  Title       : ${BLUE}${TITLE}${NC}"
echo -e "  Collection  : ${BLUE}${FOLDER}${NC}"
echo -e "  Saved as    : ${BLUE}${SAFE_FILENAME}${NC}"
echo ""

# ── Copy image ────────────────────────────────────────────────────────────────
cp "$IMAGE_PATH" "$DEST_PATH"
echo -e "${GREEN}✓ Image copied${NC}  →  ${FOLDER}/${SAFE_FILENAME}"

# ── Update HTML files via Python ──────────────────────────────────────────────
python3 - "$SCRIPT_DIR" "$HTML_FILE" "$FOLDER" "$SAFE_FILENAME" "$TITLE" "$COLLECTION_KEY" <<'PYEOF'
import sys, re

script_dir, html_rel, folder, filename, title, collection_key = sys.argv[1:]

def read_file(path):
    with open(path, 'r', encoding='utf-8') as f:
        return f.read()

def write_file(path, content):
    with open(path, 'w', encoding='utf-8') as f:
        f.write(content)

# ══════════════════════════════════════════════════════════════════════════
# 1. Collection page  (e.g. collections/nature-fauna.html)
# ══════════════════════════════════════════════════════════════════════════
html_path = f"{script_dir}/{html_rel}"
html = read_file(html_path)

# Read current count from page header
m = re.search(r'>(\d+) Artworks</p>', html)
if not m:
    print("ERROR: Could not find artwork count in collection HTML")
    sys.exit(1)

old_count = int(m.group(1))
new_count = old_count + 1

# Build new card
image_ref = f"../{folder}/{filename}"
new_card = f"""            <div class="product-card">
                <div class="product-image-wrapper aspect-square">
                    <a href="{image_ref}" class="glightbox" data-title="{title}" data-gallery="collection">
                        <img src="{image_ref}" alt="{title}" class="product-image" loading="lazy">
                    </a>
                </div>
                <div class="product-info">
                    <h3 class="product-title">{title}</h3>
                    <p class="product-medium">Original artwork</p>
                </div>
            </div>"""

# Insert card before Back to Collections section
marker = '    <!-- Back to Collections -->'
if marker not in html:
    print("ERROR: Could not find insertion point in collection HTML")
    sys.exit(1)
html = html.replace(marker, new_card + '\n\n' + marker, 1)

# Update count in <title> tag
html = html.replace(f'| {old_count} Original Artworks |', f'| {new_count} Original Artworks |')
# Update count in page header
html = re.sub(rf'>({old_count}) Artworks</p>', f'>{new_count} Artworks</p>', html, count=1)

write_file(html_path, html)
print(f"✓ Added card to {html_rel}  ({old_count} → {new_count} artworks)")

# ══════════════════════════════════════════════════════════════════════════
# 2. collections/index.html
# ══════════════════════════════════════════════════════════════════════════
idx_path = f"{script_dir}/collections/index.html"
idx = read_file(idx_path)

# Get current total
m_total = re.search(r'(\d+) Original Artworks', idx)
old_total = int(m_total.group(1)) if m_total else None
new_total = old_total + 1 if old_total else None

# Update count for this specific collection card
# Find the <a href="folder.html"> block and increment the "N Artworks" inside it
idx = re.sub(
    rf'(href="{re.escape(folder)}\.html"(?:(?!href=).)*?)(\d+) Artworks',
    lambda m_: m_.group(1) + str(int(m_.group(2)) + 1) + ' Artworks',
    idx, count=1, flags=re.DOTALL
)

# Update total count
if old_total:
    idx = idx.replace(f'{old_total} Original Artworks', f'{new_total} Original Artworks')
    idx = idx.replace(f'{old_total} original pieces', f'{new_total} original pieces')

write_file(idx_path, idx)
print(f"✓ Updated collections/index.html  (total: {old_total} → {new_total})")

# ══════════════════════════════════════════════════════════════════════════
# 3. index.html  (homepage)
# ══════════════════════════════════════════════════════════════════════════
home_path = f"{script_dir}/index.html"
home = read_file(home_path)

# Update count for this collection's card (find by data-category)
home = re.sub(
    rf'(data-category="{re.escape(collection_key)}"(?:(?!data-category).)*?)(\d+) Artworks',
    lambda m_: m_.group(1) + str(int(m_.group(2)) + 1) + ' Artworks',
    home, count=1, flags=re.DOTALL
)

# Update total subtitle, button, and meta tags
if old_total:
    home = home.replace(f'{old_total} Original Artworks', f'{new_total} Original Artworks')
    home = home.replace(f'EXPLORE ALL {old_total} ARTWORKS', f'EXPLORE ALL {new_total} ARTWORKS')
    home = home.replace(f'{old_total} unique pieces', f'{new_total} unique pieces')
    home = re.sub(
        rf'{old_total} original artworks',
        f'{new_total} original artworks',
        home, flags=re.IGNORECASE
    )

write_file(home_path, home)
print(f"✓ Updated index.html  (total: {old_total} → {new_total})")
print("")
PYEOF

# ── Done ──────────────────────────────────────────────────────────────────────
echo ""
echo -e "${GREEN}${BOLD}All done!${NC} '${TITLE}' has been added to the ${FOLDER} collection."
echo ""
echo -e "${BOLD}Next steps:${NC}"
echo -e "  Preview :  ${BLUE}python3 -m http.server 8000${NC}  →  http://localhost:8000"
echo -e "  Push    :  ${BLUE}git add . && git commit -m \"Add artwork: ${TITLE}\" && git push${NC}"
echo ""
