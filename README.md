## Getting Started

### Run Development flavour
```
flutter run -t lib/main_dev.dart
```

### Building Web
```
CHROME_EXECUTABLE=/home/stalin/.nix-profile/bin/google-chrome-stable flutter build web -t lib/main_dev.dart
```

### Running Web
```
CHROME_EXECUTABLE=/home/stalin/.nix-profile/bin/google-chrome-stable flutter run -d chrome -t lib/main_dev.dart
```