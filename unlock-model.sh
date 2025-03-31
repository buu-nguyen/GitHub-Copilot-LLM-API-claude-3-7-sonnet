#!/bin/bash
#
# VS Code Copilot Unlock Script
# This script removes authentication restrictions from the GitHub Copilot Chat extension
#

set -e  # Exit on any error

TARGET_STRING=',"x-onbehalf-extension-id":`${A}/${c}`'
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Detect OS for proper sed syntax
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS requires an empty string after -i
    SED_COMMAND="sed -i ''"
else
    # Linux and others
    SED_COMMAND="sed -i"
fi

# Find the GitHub Copilot Chat extension directory
VSCODE_EXT_DIR="$HOME/.vscode/extensions"
COPILOT_DIR=$(find "$VSCODE_EXT_DIR" -maxdepth 1 -type d -name "github.copilot-chat*" 2>/dev/null | head -n 1)

# Check if Copilot extension exists
if [ -z "$COPILOT_DIR" ]; then
    echo "Error: GitHub Copilot Chat extension not found in $VSCODE_EXT_DIR"
    exit 1
fi

EXTENSION_FILE="$COPILOT_DIR/dist/extension.js"

# Verify extension.js exists
if [ ! -f "$EXTENSION_FILE" ]; then
    echo "Error: extension.js not found in $COPILOT_DIR/dist/"
    exit 1
fi

# Create timestamped backup
BACKUP_FILE="$EXTENSION_FILE.backup.$TIMESTAMP"
echo "Creating backup at: $BACKUP_FILE"
cp "$EXTENSION_FILE" "$BACKUP_FILE"

# Escape the string for sed
ESCAPED_STRING=$(echo "$TARGET_STRING" | sed 's/[\/&]/\\&/g')

# Apply the modification
echo "Removing authentication restriction from extension.js..."
$SED_COMMAND "s/$ESCAPED_STRING//g" "$EXTENSION_FILE"

# Verify the change was made
if grep -q "$TARGET_STRING" "$EXTENSION_FILE"; then
    echo "Warning: Modification may not have been successful."
    echo "The target string is still present in the file."
    exit 1
else
    echo "✓ Modification successful!"
    echo "✓ Original file backed up as $BACKUP_FILE"
    
    # Check if VS Code is running
    if pgrep -x "code" > /dev/null; then
        echo "Note: VS Code is currently running. Please restart it for changes to take effect."
    else
        echo "✓ Changes will take effect when you start VS Code."
    fi
fi
