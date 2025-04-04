# Shell Scripts Collection

A collection of utility shell scripts for various tasks.

## Scripts

### yai.sh
A script that processes input strings through a fabric raw query and displays the output in cyan color. Features:
- Dynamic home directory detection
- Loading animation during execution
- Colored output formatting
- Error handling

### shloader.sh
A loading animation library for shell scripts. Features:
- Multiple animation styles (dots, emojis, ASCII art)
- Customizable messages
- Clean exit handling
- Various loader patterns

## Requirements
- Bash shell
- ncurses (for terminal control)
- fabric (for yai.sh)

## Installation
1. Clone this repository
2. Ensure the scripts are executable:
```bash
chmod +x *.sh
```

# Usage
## yai.sh
```bash
./yai.sh "Your input string"
```
## shloader.sh
```bash
# As standalone
./shloader.sh

# When sourcing in other scripts
source shloader.sh
shloader -l dots2 -m "Loading..." -e "Done!"
```