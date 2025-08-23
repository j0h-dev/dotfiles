#!/usr/bin/sh

# Optional delay if argument is passed
if [ -n "$1" ]; then
    sleep "$1"
fi

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
INDEX_FILE="$HOME/.config/hyprpaper_index"
WALLPAPER_LIST=($(find "$WALLPAPER_DIR" -type f | sort))  # Sorted list for consistent order
TOTAL_WALLPAPERS=${#WALLPAPER_LIST[@]}

# Initialize index file if it doesn't exist
if [ ! -f "$INDEX_FILE" ]; then
    echo 0 > "$INDEX_FILE"
fi

# Read current index
INDEX=$(cat "$INDEX_FILE")

# Use current index to select wallpaper
WALLPAPER="${WALLPAPER_LIST[$INDEX]}"

# Apply the selected wallpaper
hyprctl hyprpaper reload ,"$WALLPAPER"

# Calculate next index and write it to file
NEXT_INDEX=$(( (INDEX + 1) % TOTAL_WALLPAPERS ))
echo "$NEXT_INDEX" > "$INDEX_FILE"
