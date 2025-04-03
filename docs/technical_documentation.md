# Documentation Technique - Camping Game Show

## Table des matières
1. [Architecture de l'application](#architecture-de-lapplication)
2. [Structure du projet](#structure-du-projet)
3. [Modèles de données](#modèles-de-données)
4. [Services principaux](#services-principaux)
5. [Gestion de l'état](#gestion-de-létat)
6. [Fonctionnement hors ligne](#fonctionnement-hors-ligne)
7. [Sécurité](#sécurité)
8. [Performance](#performance)
9. [API et intégrations](#api-et-intégrations)
10. [Déploiement](#déploiement)
11. [Maintenance](#maintenance)

## Architecture de l'application

### Vue d'ensemble
Camping Game Show est une application Flutter cross-platform utilisant une architecture MVVM (Model-View-ViewModel) avec une gestion d'état réactive. L'application est conçue pour fonctionner en mode hors ligne avec synchronisation automatique lorsque la connectivité est rétablie.

### Diagramme d'architecture
```
┌─────────────────────────────────────────────────────────────┐
│                         Présentation                         │
│  ┌─────────────┐    ┌─────────────┐    ┌─────────────────┐  │
│  │    Vues     │◄──►│  ViewModels │◄──►│    Providers    │  │
│  └─────────────┘    └─────────────┘    └─────────────────┘  │
└───────────────────────────┬─────────────────────────────────┘
                            │
┌───────────────────────────▼─────────────────────────────────┐
│                          Domaine                            │
│  ┌─────────────┐    ┌─────────────┐    ┌─────────────────┐  │
│  │  Services   │◄──►│ Repositories │◄──►│     Modèles     │  │
│  └─────────────┘    └─────────────┘    └─────────────────┘  │
└───────────────────────────┬─────────────────────────────────┘
                            │
┌───────────────────────────▼─────────────────────────────────┐
│                           Données                           │
│  ┌─────────────┐    ┌─────────────┐    ┌─────────────────┐  │
│  │   Firebase  │    │    Hive     │    │  Secure Storage │  │
│  └─────────────┘    └─────────────┘    └─────────────────┘  │
└─────────────────────────────────────────────────────────────┘
```

### Principes architecturaux
- **Séparation des préoccupations** : Chaque couche a une responsabilité spécifique
- **Dépendance unidirectionnelle** : Les couches supérieures dépendent des couches inférieures, jamais l'inverse
- **Inversion de dépendance** : Utilisation d'interfaces pour découpler les implémentations
- **Réactivité** : Utilisation de streams et de providers pour la propagation des changements d'état
- **Modularité** : Organisation par fonctionnalités pour faciliter la maintenance et les tests

## Structure du projet

### Organisation des dossiers
```
lib/
├── app.dart                  # Point d'entrée de l'application
├── main.dart                 # Configuration et initialisation
├── core/                     # Fonctionnalités transversales
│   ├── config/               # Configuration de l'environnement
│   ├── navigation/           # Système de routage
│   ├── services/             # Services partagés
│   ├── theme/                # Thème de l'application
│   └── utils/                # Utilitaires communs
├── features/                 # Modules fonctionnels
│   ├── admin/                # Interface administrateur
│   │   ├── screens/          # Écrans de l'interface admin
│   │   ├── widgets/          # Widgets spécifiques à l'admin
│   │   └── providers/        # Gestion d'état pour l'admin
│   ├── player/               # Interface joueur
│   │   ├── screens/          # Écrans de l'interface joueur
│   │   ├── widgets/          # Widgets spécifiques au joueur
│   │   └── providers/        # Gestion d'état pour le joueur
│   ├── game_engine/          # Logique du jeu
│   │   ├── models/           # Modèles de données du jeu
│   │   ├── repositories/     # Accès aux données du jeu
│   │   └── services/         # Services spécifiques au jeu
│   └── shared/               # Éléments partagés entre modules
│       ├── models/           # Modèles communs
│       ├── widgets/          # Widgets réutilisables
│       └── utils/            # Utilitaires partagés
└── generated/                # Fichiers générés automatiquement
```

### Conventions de nommage
- **Fichiers** : snake_case (ex: game_session.dart)
- **Classes** : PascalCase (ex: GameSession)
- **Variables et fonctions** : camelCase (ex: createSession())
- **Constantes** : SCREAMING_SNAKE_CASE (ex: MAX_PLAYERS)
- **Extensions de fichiers** :
  - `.dart` pour le code source
  - `.g.dart` pour le code généré
  - `.freezed.dart` pour les classes Freezed

## Modèles de données

### Principaux modèles
Tous les modèles sont implémentés avec Freezed pour l'immutabilité et la génération de code.

#### UserModel
```dart
@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String name,
    required String email,
    required UserRole role,
    String? avatarUrl,
    @Default(false) bool isAnonymous,
    DateTime? lastLoginAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => 
      _$UserModelFromJson(json);
}

enum UserRole { admin, player }
```

#### GameSession
```dart
@freezed
class GameSession with _$GameSession {
  const factory GameSession({
    required String id,
    required String name,
    required String adminId,
    required DateTime createdAt,
    DateTime? startedAt,
    DateTime? endedAt,
    @Default([]) List<String> teamIds,
    @Default([]) List<GameRound> rounds,
    @Default(GameSessionStatus.created) GameSessionStatus status,
    String? joinCode,
    String? description,
  }) = _GameSession;

  factory GameSession.fromJson(Map<String, dynamic> json) => 
      _$GameSessionFromJson(json);
}

enum GameSessionStatus { created, active, paused, completed }
```

#### Team
```dart
@freezed
class Team with _$Team {
  const factory Team({
    required String id,
    required String name,
    required String sessionId,
    required Color color,
    @Default([]) List<String> playerIds,
    @Default(0) int score,
  }) = _Team;

  factory Team.fromJson(Map<String, dynamic> json) => 
      _$TeamFromJson(json);
}
```

#### Player
```dart
@freezed
class Player with _$Player {
  const factory Player({
    required String id,
    required String name,
    String? userId,
    String? teamId,
    String? sessionId,
    String? avatarUrl,
    @Default(0) int personalScore,
    @Default(PlayerStatus.waiting) PlayerStatus status,
  }) = _Player;

  factory Player.fromJson(Map<String, dynamic> json) => 
      _$PlayerFromJson(json);
}

enum PlayerStatus { waiting, ready, playing, inactive }
```

### Relations entre modèles
- Un **UserModel** peut être associé à plusieurs **Player**
- Une **GameSession** contient plusieurs **Team** et **GameRound**
- Une **Team** contient plusieurs **Player**
- Un **GameRound** contient plusieurs **WheelSegment**

## Services principaux

### AuthService
Gère l'authentification des utilisateurs avec support pour le mode hors ligne.

```dart
abstract class AuthService {
  Stream<UserModel?> get authStateChanges;
  Future<UserModel?> getCurrentUser();
  Future<UserModel> signInWithEmailAndPassword(String email, String password);
  Future<UserModel> createUserWithEmailAndPassword(String email, String password, String name);
  Future<UserModel> signInAnonymously();
  Future<void> signOut();
  Future<bool> isOfflineAuthAvailable();
}
```

### ConnectivityService
Surveille l'état de la connexion réseau et notifie les changements.

```dart
class ConnectivityService {
  Stream<bool> get connectivityStream;
  Future<bool> isConnected();
  Future<void> checkConnectivity();
}
```

### LocalStorageService
Gère le stockage local des données avec Hive.

```dart
class LocalStorageService {
  Future<void> initialize();
  Future<void> saveData<T>(String key, T value);
  Future<T?> getData<T>(String key);
  Future<void> removeData(String key);
  Future<void> clearAll();
}
```

### SyncService
Synchronise les données entre le stockage local et Firebase.

```dart
class SyncService {
  Future<void> initialize();
  Future<void> syncAll();
  Future<void> syncEntity(String entityType, String id);
  Stream<SyncStatus> get syncStatusStream;
}

enum SyncStatus { idle, syncing, completed, error }
```

### FirebaseConfig
Configure Firebase pour l'application.

```dart
class FirebaseConfig {
  static Future<void> initialize();
  static FirebaseAnalytics get analytics;
  static FirebaseAnalyticsObserver get observer;
}
```

## Gestion de l'état

### Providers
L'application utilise Riverpod pour la gestion d'état.

```dart
// Exemple de provider pour la session de jeu active
final activeSessionProvider = StateNotifierProvider<ActiveSessionNotifier, AsyncValue<GameSession?>>((ref) {
  final sessionRepository = ref.watch(sessionRepositoryProvider);
  return ActiveSessionNotifier(sessionRepository);
});

class ActiveSessionNotifier extends StateNotifier<AsyncValue<GameSession?>> {
  final SessionRepository _sessionRepository;
  
  ActiveSessionNotifier(this._sessionRepository) : super(const AsyncValue.loading()) {
    _loadActiveSession();
  }
  
  Future<void> _loadActiveSession() async {
    state = const AsyncValue.loading();
    try {
      final session = await _sessionRepository.getActiveSession();
      state = AsyncValue.data(session);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
  
  // Méthodes pour manipuler la session...
}
```

### Flux de données
Diagramme simplifié du flux de données dans l'application :

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│    Vue      │◄──►│  Provider   │◄──►│ Repository  │
└─────────────┘    └─────────────┘    └──────┬──────┘
                                            │
                                     ┌──────▼──────┐
                                     │   Service   │
                                     └──────┬──────┘
                                            │
                                  ┌─────────▼─────────┐
                                  │ Source de données │
                                  └───────────────────┘
```

## Fonctionnement hors ligne

### Stratégie de mise en cache
L'application utilise une stratégie "offline-first" :
1. Toutes les données sont d'abord enregistrées localement
2. Les opérations sont mises en file d'attente lorsque l'appareil est hors ligne
3. La synchronisation est effectuée automatiquement lorsque la connexion est rétablie

### Implémentation
- **Hive** est utilisé pour le stockage local des données
- **WorkManager** gère les tâches de synchronisation en arrière-plan
- **ConnectivityService** détecte les changements de connectivité

### Gestion des conflits
En cas de conflit lors de la synchronisation :
1. Les données sont comparées par horodatage
2. La version la plus récente est conservée par défaut
3. Pour certaines entités, une stratégie de fusion est appliquée

## Sécurité

### Authentification
- Support pour l'authentification par email/mot de passe
- Authentification anonyme pour les joueurs
- Stockage sécurisé des identifiants pour le mode hors ligne

### Règles Firestore
```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Fonction pour vérifier si l'utilisateur est authentifié
    function isAuthenticated() {
      return request.auth != null;
    }
    
    // Fonction pour vérifier si l'utilisateur est administrateur
    function isAdmin() {
      return isAuthenticated() && 
             get(/databases/$(database)/documents/users/$(request.auth.uid)).data.role == 'admin';
    }
    
    // Fonction pour vérifier si l'utilisateur est membre d'une équipe
    function isTeamMember(teamId) {
      return isAuthenticated() && 
             exists(/databases/$(database)/documents/teams/$(teamId)/players/$(request.auth.uid));
    }
    
    // Règles pour les sessions
    match /sessions/{sessionId} {
      allow read: if isAuthenticated();
      allow create, update, delete: if isAdmin();
      
      // Sous-collection des rounds
      match /rounds/{roundId} {
        allow read: if isAuthenticated();
        allow write: if isAdmin();
      }
    }
    
    // Règles pour les équipes
    match /teams/{teamId} {
      allow read: if isAuthenticated();
      allow create, update, delete: if isAdmin();
      
      // Sous-collection des joueurs
      match /players/{playerId} {
        allow read: if isAuthenticated();
        allow create: if isAuthenticated();
        allow update, delete: if isAdmin() || request.auth.uid == playerId;
      }
    }
    
    // Règles pour les utilisateurs
    match /users/{userId} {
      allow read: if isAuthenticated() && (request.auth.uid == userId || isAdmin());
      allow create: if isAuthenticated() && request.auth.uid == userId;
      allow update: if isAuthenticated() && request.auth.uid == userId;
      allow delete: if isAdmin();
    }
  }
}
```

### Stockage sécurisé
- Utilisation de `flutter_secure_storage` pour les données sensibles
- Chiffrement des données locales avec des clés spécifiques à l'appareil

## Performance

### Optimisations
- **Chargement différé** des ressources lourdes
- **Mise en cache** des données fréquemment utilisées
- **Pagination** pour les listes longues
- **Compression** des images et médias

### Métriques clés
- **Temps de démarrage** : < 2 secondes sur les appareils de référence
- **Utilisation mémoire** : < 100 MB en utilisation normale
- **Consommation batterie** : < 5% par heure d'utilisation active
- **Taille de l'application** : < 30 MB (APK), < 50 MB (IPA)

## API et intégrations

### Firebase
- **Authentication** : Gestion des utilisateurs
- **Firestore** : Base de données NoSQL
- **Storage** : Stockage des médias
- **Analytics** : Suivi de l'utilisation
- **Crashlytics** : Rapports de crash

### Autres intégrations
- **QR Code** : Génération et lecture de codes QR pour rejoindre les sessions
- **Partage** : Intégration avec les API de partage natives
- **Caméra** : Accès à la caméra pour scanner les codes QR et capturer des médias

## Déploiement

### Android
- **Version minimale** : Android 6.0 (API 23)
- **Version cible** : Android 13 (API 33)
- **Architectures** : arm64-v8a, armeabi-v7a, x86_64
- **Signature** : Utilisation de la signature App Bundle

### iOS
- **Version minimale** : iOS 12.0
- **Architectures** : arm64
- **Capabilities** : Camera, Push Notifications

### Scripts de déploiement
Des scripts automatisés sont disponibles dans le dossier `scripts/` :
- `build.sh` : Compile l'application pour Android et iOS
- `firebase_config.sh` : Configure Firebase pour l'application
- `distribution_server.sh` : Configure un serveur de distribution
- `auto_update.sh` : Gère les mises à jour automatiques

## Maintenance

### Mises à jour
- **Fréquence recommandée** : Mensuelle pour les corrections de bugs, trimestrielle pour les nouvelles fonctionnalités
- **Stratégie de versionnement** : Semantic Versioning (MAJOR.MINOR.PATCH)
- **Mécanisme de mise à jour** : Mise à jour automatique via le service intégré

### Surveillance
- **Firebase Crashlytics** : Surveillance des crashs en temps réel
- **Firebase Performance** : Suivi des métriques de performance
- **Service de monitoring** : Heartbeat et rapports d'état

### Sauvegarde
- **Données Firestore** : Sauvegarde quotidienne automatique
- **Contenu utilisateur** : Sauvegarde hebdomadaire du Storage Firebase
- **Configuration** : Sauvegarde après chaque modification importante

---

© 2025 Camping Game Show. Tous droits réservés.
