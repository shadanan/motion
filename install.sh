#!/bin/bash

# Installation script for Apple Motion 5 Templates
# This script copies all templates to the Motion Templates directory
# Usage: ./install.sh [category_name]
# Example: ./install.sh "My Templates"

set -e

# Get category name from argument or use default
CATEGORY_NAME="${1:-Friendly TL}"

# Define paths
MOTION_TEMPLATES_DIR="$HOME/Movies/Motion Templates.localized"
TITLES_DIR="$MOTION_TEMPLATES_DIR/Titles.localized/$CATEGORY_NAME"
EFFECTS_DIR="$MOTION_TEMPLATES_DIR/Effects.localized/$CATEGORY_NAME"

# Get the script directory (where the templates are located)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing Apple Motion 5 Templates..."

# Create directories if they don't exist
mkdir -p "$TITLES_DIR"
mkdir -p "$EFFECTS_DIR"

# Copy titles
for template in "$SCRIPT_DIR/titles/"*; do
    if [ -d "$template" ]; then
        template_name=$(basename "$template")
        cp -r "$template" "$TITLES_DIR/"
        echo "  ✓ $template_name installed to $TITLES_DIR"
    fi
done

# Copy effects
for template in "$SCRIPT_DIR/effects/"*; do
    if [ -d "$template" ]; then
        template_name=$(basename "$template")
        cp -r "$template" "$EFFECTS_DIR/"
        echo "  ✓ $template_name  installed to $EFFECTS_DIR"
    fi
done

echo "Installation complete!"
