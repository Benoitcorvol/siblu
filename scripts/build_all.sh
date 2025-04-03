#!/bin/bash
set -e

# Configuration
VERSION=$(cat pubspec.yaml | grep version: | cut -d ' ' -f 2)
BUILD_DIR="build/distributions/$VERSION"
PLATFORMS=("android" "ios" "windows" "macos" "linux" "web")

# Prepare build directory
mkdir -p "$BUILD_DIR"

# Build for all platforms
for platform in "${PLATFORMS[@]}"; do
  echo "Building for $platform..."
  
  case $platform in
    "android")
      flutter build apk --release --obfuscate --split-debug-info="$BUILD_DIR/android-debug"
      cp build/app/outputs/flutter-apk/app-release.apk "$BUILD_DIR/camping_game_show-$VERSION.apk"
      ;;
    "ios")
      flutter build ips --release --obfuscate --split-debug-info="$BUILD_DIR/ios-debug"
      cp build/ios/ipa/camping_game_show.ipa "$BUILD_DIR/camping_game_show-$VERSION.ipa"
      ;;
    "web")
      flutter build web --release --web-renderer canvaskit
      zip -r "$BUILD_DIR/camping_game_show-$VERSION-web.zip" build/web/
      ;;
    *)
      flutter build $platform --release
      ;;
  esac
done

# Generate checksums
cd "$BUILD_DIR"
for file in *; do
  sha256sum "$file" >> checksums.txt
done

# Upload to distribution server
gsutil -m cp -r "$BUILD_DIR/*" gs://camping-game-show-dist/releases/$VERSION/