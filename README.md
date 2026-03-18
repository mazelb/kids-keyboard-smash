# 🎹 Keyboard Smash!

**The game your infant didn't ask for, but absolutely deserves.**

Hand your keyboard to a baby. Watch chaos unfold in glorious technicolor. Every keypress spawns giant letters, exploding particles, and pleasant pentatonic tones that won't make you want to leave the room.

Built because babies love buttons, and your sanity has a price.

## Features

- 🎨 **Colorful explosions** — Every key spawns a giant character with particles and a random shape backdrop
- 🎵 **Pentatonic sounds** — Musically pleasant no matter how aggressively your infant performs
- 🔒 **Key blocking** — Ctrl, Alt, F-keys, and other dangerous combos are neutered
- 🖥️ **Fullscreen kiosk mode** — No address bar, no tabs, no escape (except ESC)
- 🪟 **Windows key blocking** — Via AutoHotkey, because infants find the Start menu faster than IT professionals

## Quick Start

### Windows
1. Install **[AutoHotkey v2](https://www.autohotkey.com/)** *(optional but recommended)*
2. Double-click `play.bat`
3. Hand keyboard to infant
4. **Ctrl+Q** to exit

### macOS
1. Double-click `play.command` (you may need to right-click → Open the first time)
2. Hand keyboard to infant
3. Close the browser window to exit — keys are automatically restored

## Requirements

### Windows
- **Windows 10/11** with Chrome or Edge
- **[AutoHotkey v2](https://www.autohotkey.com/)** *(optional but recommended)* — blocks Windows key, Alt+Tab, and other OS-level shortcuts that babies are magnetically attracted to

Without AutoHotkey, the game still works — you just might find your infant has opened 14 instances of Cortana.

### macOS
- **macOS** with Chrome or Edge
- No extra installs needed — uses the built-in `hidutil` to disable Command and Option keys

## How It Works

- `index.html` — The entire game. Single file. Zero dependencies. Open it in any browser.
- `play.bat` — Windows launcher. Starts AutoHotkey key blocker, opens the browser in kiosk mode, cleans up when you close it.
- `block_keys.ahk` — AutoHotkey script that disables the keys your baby will 100% find within 3 seconds.
- `play.command` — macOS launcher. Disables Command/Option keys via `hidutil`, opens kiosk mode, restores keys on exit.

## Exiting

### Windows
**Ctrl+Q** closes the game and restores all keys. If somehow locked out: **Ctrl+Alt+Del** still works (thanks, Windows security).

### macOS
Close the browser window. Keys are automatically restored. If something goes wrong, run `hidutil property --set '{"UserKeyMapping":[]}'` in Terminal to restore keys.

## Tech Stack

- HTML/CSS/JS (no frameworks, no build tools, no npm, no webpack, no tears)
- Canvas API for rendering
- Web Audio API for sound
- AutoHotkey for OS-level key blocking
- Parental desperation for motivation

## License

MIT — Do whatever you want. Your baby already does.
