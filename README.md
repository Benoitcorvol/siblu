# Camping Game Show

A Flutter-based interactive game show application designed for camping entertainment. This application provides an engaging platform for campers to participate in various games and activities, with both admin and player interfaces.

## Table of Contents
- [Overview](#overview)
- [Architecture](#architecture)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Getting Started](#getting-started)
- [Project Structure](#project-structure)
- [Development Workflow](#development-workflow)
- [Testing](#testing)
- [Deployment](#deployment)
- [Contributing](#contributing)
- [Support](#support)

## Overview

The Camping Game Show is a real-time interactive game platform designed for camping entertainment. It consists of two main interfaces:

1. **Admin Interface**: For game hosts to manage sessions, teams, and control the game flow
2. **Player Interface**: For participants to join games and interact with challenges

### Key Concepts

- **Game Session**: A single game event with multiple rounds
- **Team**: A group of players competing together
- **Round**: A specific game challenge or activity
- **Score**: Points earned by teams during gameplay
- **Joker**: Special power-ups that teams can use during the game

## Architecture

### Design Patterns

The project follows these architectural patterns:

1. **Clean Architecture**
   - Separation of concerns
   - Domain-driven design
   - Repository pattern

2. **BLoC Pattern**
   - Business Logic Components
   - State management
   - Event-driven architecture

3. **Dependency Injection**
   - Service locator pattern
   - Repository providers
   - Environment configuration

### State Management

The app uses a combination of state management solutions:

1. **flutter_bloc**
   - For complex state management
   - Game session state
   - Authentication state
   - Team management

2. **riverpod**
   - For simpler state management
   - UI state
   - Theme state
   - Local preferences

### Data Flow

1. **Data Sources**
   - Firebase (Remote)
   - Hive (Local)
   - SharedPreferences (Settings)
   - Secure Storage (Credentials)

2. **Data Flow Pattern**
   ```
   UI -> BLoC -> Repository -> Data Source
   ```

## Features

### Admin Interface
- Dashboard for game session management
- Team management and scoring system
- Real-time game control interface
- Session scheduling and planning
- Analytics and performance tracking
- QR code generation for session joining
- Team color customization
- Game template selection
- Real-time score updates
- Emergency controls (pause, reset, etc.)

### Player Interface
- Interactive game participation
- Real-time score updates
- Team-based gameplay
- QR code-based session joining
- Mobile-responsive design
- Player profile management
- Team chat/communication
- Achievement tracking
- Game history
- Offline mode support

## Tech Stack

### Core Technologies
- **Framework**: Flutter 3.16.4
- **Language**: Dart 3.1.0
- **State Management**: 
  - flutter_bloc
  - riverpod
- **Navigation**: go_router
- **Code Generation**:
  - build_runner
  - freezed
  - json_serializable

### Backend Services
- **Firebase**
  - Authentication
  - Firestore
  - Storage
  - Crashlytics
  - Analytics

### Local Storage
- **Hive**: For complex data structures
- **SharedPreferences**: For simple settings
- **flutter_secure_storage**: For sensitive data

### Development Tools
- **VS Code / Android Studio**
- **Flutter DevTools**
- **Firebase Console**
- **Git**

## Getting Started

### Prerequisites

1. **Development Environment**
   - Flutter SDK (>=3.16.4)
   - Dart SDK (>=3.1.0)
   - Firebase CLI
   - Git
   - VS Code / Android Studio
   - Flutter and Dart plugins

2. **Firebase Setup**
   - Firebase account
   - Firebase project created
   - Firebase CLI installed
   - FlutterFire CLI installed

3. **Design Assets**
   - Figma access
   - Font files
   - Image assets

### Installation

1. **Clone the Repository**
```bash
git clone https://github.com/Benoitcorvol/siblu.git
cd siblu
```

2. **Install Dependencies**
```bash
flutter pub get
```

3. **Set up Firebase**
```bash
flutterfire configure
```

4. **Environment Setup**
Create a `.env` file in the root directory:
```
FIREBASE_API_KEY=your_api_key
FIREBASE_APP_ID=your_app_id
FIREBASE_MESSAGING_SENDER_ID=your_sender_id
FIREBASE_PROJECT_ID=your_project_id
```

5. **Generate Code**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

6. **Run the App**
```bash
flutter run
```

## Project Structure

```
lib/
├── core/
│   ├── config/         # App configuration
│   │   ├── constants.dart
│   │   └── environment.dart
│   ├── data/          # Demo and static data
│   ├── navigation/    # Routing configuration
│   ├── services/      # Core services
│   │   ├── analytics_service.dart
│   │   ├── auth_service.dart
│   │   └── storage_service.dart
│   └── theme/         # App theming
│       ├── app_colors.dart
│       ├── app_text_styles.dart
│       └── app_theme.dart
├── features/
│   ├── admin/         # Admin interface
│   │   ├── blocs/
│   │   ├── screens/
│   │   └── widgets/
│   ├── auth/          # Authentication
│   │   ├── blocs/
│   │   └── models/
│   ├── game_engine/   # Game logic
│   │   ├── models/
│   │   └── repositories/
│   ├── player/        # Player interface
│   │   ├── screens/
│   │   └── widgets/
│   └── shared/        # Shared components
│       ├── models/
│       └── widgets/
└── main.dart          # App entry point
```

## Development Workflow

### Code Style

1. **Naming Conventions**
   - Files: snake_case.dart
   - Classes: PascalCase
   - Variables: camelCase
   - Constants: SCREAMING_SNAKE_CASE

2. **File Organization**
   - One class per file
   - Related files in same directory
   - Clear directory structure

3. **Documentation**
   - Class documentation
   - Method documentation
   - Complex logic comments

### Git Workflow

1. **Branch Naming**
   - feature/feature-name
   - bugfix/bug-description
   - hotfix/issue-description

2. **Commit Messages**
   - feat: new feature
   - fix: bug fix
   - docs: documentation
   - style: formatting
   - refactor: code restructuring
   - test: adding tests
   - chore: maintenance

3. **Pull Requests**
   - Clear description
   - Screenshots if UI changes
   - Test coverage
   - Code review required

### Development Process

1. **Feature Development**
   - Create feature branch
   - Implement feature
   - Write tests
   - Create PR
   - Code review
   - Merge to main

2. **Bug Fixing**
   - Create bugfix branch
   - Fix issue
   - Add test
   - Create PR
   - Code review
   - Merge to main

## Testing

### Test Types

1. **Unit Tests**
```bash
flutter test test/unit/
```

2. **Widget Tests**
```bash
flutter test test/widgets/
```

3. **Integration Tests**
```bash
flutter test integration_test/
```

### Test Coverage
```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
```

## Deployment

### Android

1. **Build APK**
```bash
flutter build apk --release
```

2. **Build App Bundle**
```bash
flutter build appbundle --release
```

3. **Deploy to Play Store**
- Use Play Console
- Follow release checklist
- Test on multiple devices

### iOS

1. **Build IPA**
```bash
flutter build ios --release
```

2. **Archive and Upload**
- Use Xcode
- Archive the app
- Upload to App Store Connect

### Web

1. **Build Web**
```bash
flutter build web --release
```

2. **Deploy**
- Use Firebase Hosting
- Configure custom domain
- Set up SSL

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Code Review Guidelines

1. **Before Review**
   - Run tests
   - Check formatting
   - Update documentation
   - Add screenshots if UI changes

2. **During Review**
   - Check code style
   - Verify functionality
   - Ensure test coverage
   - Review documentation

3. **After Review**
   - Address comments
   - Update PR
   - Get final approval
   - Merge changes

## Support

### Getting Help

1. **Documentation**
   - Check README
   - Review code comments
   - Check inline documentation

2. **Issues**
   - Create detailed issue
   - Include steps to reproduce
   - Add screenshots/logs
   - Tag relevant team members

3. **Contact**
   - Development team
   - Project maintainers
   - Technical support

### Maintenance

1. **Regular Tasks**
   - Update dependencies
   - Run security audits
   - Update documentation
   - Monitor performance

2. **Emergency Procedures**
   - Critical bug fixes
   - Security patches
   - Service outages
   - Data recovery

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Design assets provided by Figma
- Icons from Material Design
- Fonts: Futura, Horatio D
- Firebase for backend services
- Flutter team for the framework
