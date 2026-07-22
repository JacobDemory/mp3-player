#!/usr/bin/env bash
set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "$0")" && pwd)"
JAR_PATH="$PROJECT_ROOT/dist/music-playlist-manager.jar"

if [[ ! -f "$JAR_PATH" ]]; then
  "$PROJECT_ROOT/build.sh"
fi

java -jar "$JAR_PATH"
