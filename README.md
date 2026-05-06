# Grama-Niladari-Online-Service-GNOS-
GNOS is a Flutter app for NIC verification, registration, and certificate issuance, with an AI-powered RAG chatbot.

## Prerequisites
- Flutter SDK (stable)
- Dart SDK (comes with Flutter)
- Git
- Android Studio (for emulator) and Android SDK
- Java 17 (required by Android Gradle)

## Getting Started
1. Clone the repo.
2. Open the project folder.
3. Install dependencies.

```bash
flutter pub get
```

## Firebase Setup
This project expects Firebase files to be present in the repo:
- android/app/google-services.json
- lib/firebase_options.dart

If you replace Firebase with your own project, re-run FlutterFire configure to regenerate these files.

## Run on Android Emulator
1. Start an Android emulator from Android Studio (AVD Manager).
2. Confirm the device is visible.

```bash
flutter devices
```

3. Run the app.

```bash
flutter run -d emulator-5554
```

## Run on Web (Chrome)
```bash
flutter run -d chrome
```

## Terminal Commands (Quick Reference)
```bash
# Clone
git clone https://github.com/thisasg-dev/Grama-Niladari-Online-Service-GNOS-.git

# Install dependencies
flutter pub get

# List devices
flutter devices

# Run on Android emulator
flutter run -d emulator-5554

# Run on Chrome
flutter run -d chrome

# Git update
git status
git add .
git commit -m "Update project"
git push
```

## Common Issues
- If the emulator is not detected, wait until it finishes booting, then re-run flutter devices.
- If Gradle errors mention Java version, ensure Java 17 is installed and selected.

## Project Structure
- lib/ contains Flutter UI and logic
- android/ contains Android platform code
- ios/, macos/, windows/ contain platform integrations
