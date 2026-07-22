#!/usr/bin/env bash
set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "$0")" && pwd)"
TEST_DIR="$PROJECT_ROOT/build/test-classes"

rm -rf "$TEST_DIR"
mkdir -p "$TEST_DIR"

javac -encoding UTF-8 \
  -cp "$PROJECT_ROOT/lib/*" \
  -d "$TEST_DIR" \
  "$PROJECT_ROOT"/src/*.java \
  "$PROJECT_ROOT"/src/test/java/*.java

cp -R "$PROJECT_ROOT/src/images" "$TEST_DIR/images"
java -ea -cp "$TEST_DIR:$PROJECT_ROOT/lib/*" DataStructureSmokeTest
