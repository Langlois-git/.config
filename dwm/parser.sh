#!/bin/bash

# Extract enabled patches from patches.h
enabled_patches=$(grep -o '#define PATCH_[A-Z_]*' /home/david/.config/dwm/patches.h | awk '{print $2}')

# Write enabled patches to patchlist.txt
echo "$enabled_patches" > patchlist.txt

# Extract keybinds from config.h based on enabled patches
keybinds=$(grep -E "^\s*{(MODKEY|{MODKEY, ?.}),(Key|{Key, ?.}),(.*?)}" /home/david/.config/dwm/config.h | awk '{print $3}')

# Write keybinds to keybinds.txt
echo "$keybinds" > keybinds.txt

echo "Enabled patches written to patchlist.txt"
echo "Enabled keybinds written to keybinds.txt"

