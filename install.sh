#!/bin/bash

# Installation script for Apple Motion 5 Templates
# This script copies all templates to the Motion Templates directory
# Usage: ./install.sh [-l|--link] [category_name]
# Example: ./install.sh "My Templates"
# Example: ./install.sh --link "My Templates"

set -e

# Parse arguments
USE_HARD_LINKS=false
CATEGORY_NAME="Friendly TL"

while [[ $# -gt 0 ]]; do
    case $1 in
        -l|--link)
            USE_HARD_LINKS=true
            shift
            ;;
        *)
            CATEGORY_NAME="$1"
            shift
            ;;
    esac
done

# Define paths
MOTION_TEMPLATES_DIR="$HOME/Movies/Motion Templates.localized"
TITLES_DIR="$MOTION_TEMPLATES_DIR/Titles.localized/$CATEGORY_NAME"
EFFECTS_DIR="$MOTION_TEMPLATES_DIR/Effects.localized/$CATEGORY_NAME"

# Get the script directory (where the templates are located)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Set cp flags based on whether hard links are requested
if [ "$USE_HARD_LINKS" = true ]; then
    CP_FLAGS="-rl"
    INSTALL_METHOD="hard-linked"
else
    CP_FLAGS="-r"
    INSTALL_METHOD="copied"
fi

echo "Installing Apple Motion 5 Templates ($INSTALL_METHOD)..."

# Create directories if they don't exist
mkdir -p "$TITLES_DIR"
mkdir -p "$EFFECTS_DIR"

# Create hard links for titles
for template in "$SCRIPT_DIR/titles/"*; do
    if [ -d "$template" ]; then
        template_name=$(basename "$template")
        cp $CP_FLAGS "$template" "$TITLES_DIR/"
        echo "  ✓ $template_name installed to $TITLES_DIR"
    fi
done

# Create hard links for effects
for template in "$SCRIPT_DIR/effects/"*; do
    if [ -d "$template" ]; then
        template_name=$(basename "$template")
        cp $CP_FLAGS "$template" "$EFFECTS_DIR/"
        echo "  ✓ $template_name  installed to $EFFECTS_DIR"
    fi
done

echo "Installation complete!"
