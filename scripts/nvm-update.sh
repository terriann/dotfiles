#!/bin/bash

# This script updates the Node.js version to the latest LTS version and
# provides a list of globally installed npm packages that need to be reinstalled.
#
# Preferred Usage:
#   Run `nodeup` in a terminal - which is an alias for this script.
#
# ManualUsage:
#   nvm-update.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

NODEV=$(node -v)
NVMLATEST=$(nvm ls-remote --lts --no-colors | tail -1 | sed -E 's/.*(v([0-9]+\.){2,}[0-9]+).*/\1/')

if [[ "$NODEV" == "$NVMLATEST" ]]; then
    echo -e "👾 Node is at the latest LTS (${NVMLATEST}). No update to do."
    echo -e "Bye"
    exit;
fi

# Collect the list of globally installed npm packages (excluding 'npm' and 'corepack')
PACKAGE_LIST=$(npm list -g --depth=0 --json | jq -r '.dependencies | to_entries | .[] | select(.key != "npm" and .key != "corepack") | "\(.key) | (\(.value.version))"')
# Run npm outdated to check for updates
OUTDATED_LIST=$(npm outdated -g --json)

# Collect the current globally installed package names.
# Ignores node defaults corepack and npm
PACKAGE_NAMES=$(npm list -g --depth=0 --json | jq -r '.dependencies | keys[]' | grep -vE '^(corepack|npm)$')

# Update NVM
echo -e "🤖 Updating to LTS."
nvm install --lts
nvm use --lts

NODEV=$(node -v)
echo -e ""
echo -e "✅ nvm updated to ${NODEV}"
echo -e ""

# Output the list of globally installed packages and their versions
echo -e "The following npm packages were previously installed globally, use the provided command to reinstall them."
echo -e ""

# Loop through each package and check for updates
while IFS= read -r line; do
    PACKAGE_NAME=$(echo "$line" | sed 's/ (\(.*\))/\1/; s/ .*//')  # Extract package name
    CURRENT_VERSION=$(echo "$line" | sed 's/.* (\(.*\))/\1/')  # Extract version

    # Check if the package is outdated
    OUTDATED_VERSION=$(echo "$OUTDATED_LIST" | jq -r --arg pkg "$PACKAGE_NAME" '.[$pkg].current // empty')

    if [[ -n "$OUTDATED_VERSION" && "$OUTDATED_VERSION" != "$CURRENT_VERSION" ]]; then
        # If the version is outdated, add a * next to it
        echo "$PACKAGE_NAME ($CURRENT_VERSION) *has update"
    else
        # If not outdated, just display the package name and version
        echo "$PACKAGE_NAME ($CURRENT_VERSION)"
    fi
done <<< "$PACKAGE_LIST"

# Output the reinstall command
echo -e ""
echo -e "To reinstall the packages, use the following command:"

# Remove newlines from PACKAGE_NAMES (convert newlines to spaces)
PACKAGE_LIST=$(echo "$PACKAGE_NAMES" | tr '\n' ' ')
echo -e "npm i -g ${PACKAGE_LIST}"

