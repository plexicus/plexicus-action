#!/bin/bash
set -e

# Set configuration path
CONFIG_PATH="/app/config/default_config.yaml"
REPO_NAME="${GITHUB_REPOSITORY##*/}"
REPO_NAME="${REPO_NAME##*-}"

# Generate configuration file for Plexalyzer
mkdir -p "$(dirname "$CONFIG_PATH")"
echo "plexalyzer_token: \"$PLEXALYZER_TOKEN\"" > "$CONFIG_PATH"
echo "message_url: \"$MESSAGE_URL\"" >> "$CONFIG_PATH"
echo "default_owner: \"$DEFAULT_OWNER\"" >> "$CONFIG_PATH"

# Prepare temporary file for changed files list if needed
TEMP_FILE=$(mktemp)
echo "$FILES" | jq -r '.[]' > "$TEMP_FILE"

# Run Plexalyzer analysis
docker run \
  -v "${GITHUB_WORKSPACE}:/mounted_volumes:rw" \
  -v "$CONFIG_PATH:/app/config/default_config.yaml" \
  -w /mounted_volumes \
  "$ACR_LOGIN_SERVER/plexalyzer" \
  /venvs/plexicus-fastapi/bin/python /app/analyze.py \
  --config "/app/config/default_config.yaml" \
  --name "$REPO_NAME" \
  --repository_id "$REPO_ID" \
  --files /app/files_to_analyze.txt \
  -v "$TEMP_FILE:/app/files_to_analyze.txt"

# Cleanup
rm "$TEMP_FILE"
