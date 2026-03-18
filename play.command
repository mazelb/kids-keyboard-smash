#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
GAME_PATH="$SCRIPT_DIR/index.html"

# Find browser
BROWSER=""
if [ -d "/Applications/Google Chrome.app" ]; then
    BROWSER="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
elif [ -d "/Applications/Microsoft Edge.app" ]; then
    BROWSER="/Applications/Microsoft Edge.app/Contents/MacOS/Microsoft Edge"
elif [ -d "/Applications/Chromium.app" ]; then
    BROWSER="/Applications/Chromium.app/Contents/MacOS/Chromium"
else
    echo "ERROR: Chrome, Edge, or Chromium not found."
    read -p "Press Enter to exit..."
    exit 1
fi

# Disable Command and Option keys via hidutil (built-in, no install needed)
# Key codes: LCmd=0xE3, RCmd=0xE4, LOpt=0xE2, ROpt=0xE6
echo "Blocking Command and Option keys..."
hidutil property --set '{"UserKeyMapping":[
    {"HIDKeyboardModifierMappingSrc":0x7000000E3,"HIDKeyboardModifierMappingDst":0x0},
    {"HIDKeyboardModifierMappingSrc":0x7000000E4,"HIDKeyboardModifierMappingDst":0x0},
    {"HIDKeyboardModifierMappingSrc":0x7000000E2,"HIDKeyboardModifierMappingDst":0x0},
    {"HIDKeyboardModifierMappingSrc":0x7000000E6,"HIDKeyboardModifierMappingDst":0x0}
]}' > /dev/null 2>&1

echo "Keys blocked. Launching game..."

# Launch browser in kiosk mode with separate profile
"$BROWSER" --kiosk --disable-pinch --overscroll-history-navigation=0 \
    --no-first-run --disable-translate \
    --user-data-dir="$SCRIPT_DIR/kiosk_profile" \
    "file://$GAME_PATH" 2>/dev/null

# Restore all keys when browser closes
echo "Restoring keys..."
hidutil property --set '{"UserKeyMapping":[]}' > /dev/null 2>&1

echo "Game closed. Keys restored."
