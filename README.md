# Camping Game Show

A Flutter-based interactive game show application designed for camping entertainment. This application provides an engaging platform for campers to participate in various games and activities, with both admin and player interfaces.

## Features

### Admin Interface
- Dashboard for game session management
- Team management and scoring system
- Real-time game control interface
- Session scheduling and planning
- Analytics and performance tracking

### Player Interface
- Interactive game participation
- Real-time score updates
- Team-based gameplay
- QR code-based session joining
- Mobile-responsive design

## Tech Stack

- **Framework**: Flutter 3.16.4
- **Language**: Dart 3.1.0
- **State Management**: 
  - flutter_bloc
  - riverpod
- **Navigation**: go_router
- **Backend**: Firebase
  - Authentication
  - Firestore
  - Storage
  - Crashlytics
- **Local Storage**: 
  - Hive
  - SharedPreferences
  - flutter_secure_storage

## Getting Started

### Prerequisites

- Flutter SDK (>=3.16.4)
- Dart SDK (>=3.1.0)
- Firebase CLI
- Git

### Installation

1. Clone the repository:
```bash
git clone https://github.com/Benoitcorvol/siblu.git
cd siblu
```

2. Install dependencies:
```bash
flutter pub get
```

3. Set up Firebase:
```bash
flutterfire configure
```

4. Run the app:
```bash
flutter run
```

### Environment Setup

1. Create a `.env` file in the root directory with the following variables:
```
FIREBASE_API_KEY=your_api_key
FIREBASE_APP_ID=your_app_id
FIREBASE_MESSAGING_SENDER_ID=your_sender_id
FIREBASE_PROJECT_ID=your_project_id
```

## Project Structure

```
lib/
├── core/
│   ├── config/         # App configuration
│   ├── data/          # Demo and static data
│   ├── navigation/    # Routing configuration
│   ├── services/      # Core services
│   └── theme/         # App theming
├── features/
│   ├── admin/         # Admin interface
│   ├── auth/          # Authentication
│   ├── game_engine/   # Game logic
│   ├── player/        # Player interface
│   └── shared/        # Shared components
└── main.dart          # App entry point
```

## Development

### Code Generation

Run the following commands to generate code:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Testing

Run tests with:
```bash
flutter test
```

### Building for Release

1. Android:
```bash
flutter build apk --release
```

2. iOS:
```bash
flutter build ios --release
```

3. Web:
```bash
flutter build web --release
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Design assets provided by Figma
- Icons from Material Design
- Fonts: Futura, Horatio D

## Support

For support, please contact the development team or create an issue in the repository.
