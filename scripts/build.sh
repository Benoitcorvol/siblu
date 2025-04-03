#!/bin/bash

# Validate environment variables first
./scripts/validate_env.sh
if [ $? -ne 0 ]; then
  echo "Environment validation failed"
  exit 1
fi

# Proceed with build
flutter clean
flutter pub get
flutter build apk --release
flutter build appbundle --release

# Validate build outputs exist
if [ ! -f "build/app/outputs/flutter-apk/app-release.apk" ]; then
  echo "APK build failed"
  exit 1
fi

if [ ! -f "build/app/outputs/bundle/release/app-release.aab" ]; then
  echo "App Bundle build failed"
  exit 1
fi

# Create dist directory if it doesn't exist
mkdir -p dist

# Copy build artifacts with proper permissions
cp -p build/app/outputs/flutter-apk/app-release.apk dist/camping_game_show.apk
cp -p build/app/outputs/bundle/release/app-release.aab dist/camping_game_show.aab

echo "Build completed successfully"
