#!/usr/bin/env bash
set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "$0")" && pwd)"
CLASS_DIR="$PROJECT_ROOT/build/classes"
DIST_DIR="$PROJECT_ROOT/dist"

rm -rf "$PROJECT_ROOT/build" "$DIST_DIR"
mkdir -p "$CLASS_DIR" "$DIST_DIR"

javac -encoding UTF-8 \
  -cp "$PROJECT_ROOT/lib/*" \
  -d "$CLASS_DIR" \
  "$PROJECT_ROOT"/src/*.java

cp -R "$PROJECT_ROOT/src/images" "$CLASS_DIR/images"

for dependency in "$PROJECT_ROOT"/lib/*.jar; do
  unzip -q -o "$dependency" -d "$CLASS_DIR"
done

rm -f "$CLASS_DIR/META-INF/MANIFEST.MF" "$CLASS_DIR"/META-INF/*.SF "$CLASS_DIR"/META-INF/*.RSA "$CLASS_DIR"/META-INF/*.DSA

jar --create \
  --file "$DIST_DIR/music-playlist-manager.jar" \
  --main-class MusicPlaylistManager \
  -C "$CLASS_DIR" .

echo "Built $DIST_DIR/music-playlist-manager.jar"
