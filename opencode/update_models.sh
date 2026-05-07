#!/bin/bash

set -euo pipefail

CONFIG_FILE="$HOME/Code/dotfiles/opencode/opencode.json"
BACKUP_FILE="$HOME/.config/opencode/opencode.json.bak"
MODELS_URL="http://mac.willard.gay:8080/models"

if ! command -v jq &> /dev/null; then
    echo "Error: jq is not installed."
    exit 1
fi

if [ ! -f "$CONFIG_FILE" ]; then
    echo "Error: Config file $CONFIG_FILE not found."
    exit 1
fi

echo "Fetching models from $MODELS_URL..."
MODELS_DATA=$(curl -s "$MODELS_URL")

if [ -z "$MODELS_DATA" ]; then
    echo "Error: Failed to fetch models or received empty response."
    exit 1
fi

echo "Creating backup at $BACKUP_FILE..."
cp "$CONFIG_FILE" "$BACKUP_FILE"

echo "Updating models in $CONFIG_FILE..."

# Construct the new models object from the API response
# The API returns {"data": [{"id": "...", ...}, ...]}
# We want to transform this into {"model_id": {"name": "model_id"}, ...}
NEW_MODELS=$(echo "$MODELS_DATA" | jq -c '.data | reduce .[] as $item ({}; . + {($item.id): {"name": $item.id}})')

if [ $? -ne 0 ]; then
    echo "Error: Failed to parse models JSON."
    exit 1
fi

# Use jq to update the provider.willard.models field in the config file
TEMP_FILE=$(mktemp)
jq --argjson new_models "$NEW_MODELS" '.provider.willard.models = $new_models' "$CONFIG_FILE" > "$TEMP_FILE"

if [ $? -eq 0 ]; then
    mv "$TEMP_FILE" "$CONFIG_FILE"
    echo "Successfully updated models."
else
    echo "Error: Failed to update the config file."
    rm "$TEMP_FILE"
    exit 1
fi
