#!/bin/bash

# Set up environment
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd "$SCRIPT_DIR" >/dev/null

CONTENT_FOLDER="${SCRIPT_DIR}/Unreal/CarlaUE4/Content/Carla"
BACKUP_FOLDER="${CONTENT_FOLDER}_$(date +%Y%m%d%H%M%S)"

# Backup existing Content
if [[ -d "$CONTENT_FOLDER" ]]; then
  echo "Backing up existing Content..."
  cp -r "$CONTENT_FOLDER" "$BACKUP_FOLDER"
  tar -czf "${BACKUP_FOLDER}.tar.gz" -C "$(dirname "$BACKUP_FOLDER")" "$(basename "$BACKUP_FOLDER")"
fi

popd >/dev/null
