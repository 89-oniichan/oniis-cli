#!/data/data/com.termux/files/usr/bin/bash
# Oniis CLI installer for Termux

set -e

# --- Colors ---
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
RED='\033[1;31m'
RESET='\033[0m'

echo -e "${CYAN}"
echo "=========================================="
echo "          Oniis CLI Installer"
echo "=========================================="
echo -e "${RESET}"

# --- Check if Termux environment ---
if [ ! -d "$PREFIX" ] || [ ! -d "/data/data/com.termux" ]; then
  echo -e "${RED}❌ This installer must be run inside Termux.${RESET}"
  exit 1
fi

# --- Create repo source file ---
REPO_URL="https://onii-cli.oniisama.com/repo/"
LIST_FILE="$PREFIX/etc/apt/sources.list.d/oniis-cli.list"

echo -e "${YELLOW}🔧 Adding Oniis CLI repository...${RESET}"
mkdir -p "$(dirname "$LIST_FILE")"
echo "deb [trusted=yes] $REPO_URL ./" > "$LIST_FILE"

# --- Update package lists ---
echo -e "${YELLOW}📦 Updating package lists...${RESET}"
apt update -y || true

# --- Install Oniis CLI ---
echo -e "${YELLOW}🚀 Installing Oniis CLI...${RESET}"
pkg install oniis-cli -y || {
    echo -e "${RED}❌ Installation failed. Check your internet or repo link.${RESET}"
    exit 1
}

echo ""
echo -e "${GREEN}✅ Oniis CLI installed successfully!${RESET}"
echo ""
echo -e "${CYAN}You can now run:${RESET}"
echo ""
echo -e "   ${GREEN}oniis${RESET}        → Search and stream anime"
echo -e "   ${GREEN}bulk-link${RESET}     → Bulk generate episode links"
echo -e "   ${GREEN}oniis-install${RESET}   → To download requirements"
echo ""
echo -e "📂 Output files will appear in your ${YELLOW}Downloads${RESET} folder."
echo ""
echo "=========================================="
echo "        Made with by Oniisama"
echo "=========================================="
echo ""
