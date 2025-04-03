#!/bin/bash

# Script de configuration Firebase pour l'application Camping Game Show
# Ce script configure Firebase Analytics et Crashlytics

# Définir les couleurs pour les messages
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${YELLOW}=== Configuration de Firebase pour Camping Game Show ===${NC}"

# Vérifier que Flutter est installé
if ! command -v flutter &> /dev/null; then
    echo -e "${RED}Flutter n'est pas installé ou n'est pas dans le PATH${NC}"
    exit 1
fi

# Vérifier que Firebase CLI est installé
if ! command -v firebase &> /dev/null; then
    echo -e "${YELLOW}Firebase CLI n'est pas installé. Installation en cours...${NC}"
    npm install -g firebase-tools
    if [ $? -ne 0 ]; then
        echo -e "${RED}Erreur lors de l'installation de Firebase CLI${NC}"
        exit 1
    fi
    echo -e "${GREEN}Firebase CLI installé avec succès${NC}"
fi

# Configurer Firebase Analytics
echo -e "${YELLOW}Configuration de Firebase Analytics...${NC}"
flutter pub add firebase_analytics
if [ $? -ne 0 ]; then
    echo -e "${RED}Erreur lors de l'ajout de firebase_analytics${NC}"
    exit 1
fi

# Configurer Firebase Crashlytics
echo -e "${YELLOW}Configuration de Firebase Crashlytics...${NC}"
flutter pub add firebase_crashlytics
if [ $? -ne 0 ]; then
    echo -e "${RED}Erreur lors de l'ajout de firebase_crashlytics${NC}"
    exit 1
fi

# Mettre à jour le fichier main.dart pour initialiser Firebase
echo -e "${YELLOW}Mise à jour du fichier main.dart pour initialiser Firebase...${NC}"

# Créer le fichier de configuration Firebase
echo -e "${YELLOW}Création du fichier de configuration Firebase...${NC}"
cat > lib/core/services/firebase_config.dart << EOL
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FirebaseConfig {
  static FirebaseAnalytics? _analytics;
  static FirebaseAnalyticsObserver? _observer;

  static Future<void> initialize() async {
    await Firebase.initializeApp();
    
    // Initialiser Analytics
    _analytics = FirebaseAnalytics.instance;
    _observer = FirebaseAnalyticsObserver(analytics: _analytics!);
    
    // Initialiser Crashlytics
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    
    // Capture des erreurs asynchrones
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
    
    print('Firebase initialisé avec succès');
  }
  
  static FirebaseAnalytics get analytics => _analytics!;
  static FirebaseAnalyticsObserver get observer => _observer!;
  
  // Méthodes utilitaires pour Analytics
  static Future<void> logEvent({required String name, Map<String, dynamic>? parameters}) async {
    await _analytics?.logEvent(name: name, parameters: parameters);
  }
  
  static Future<void> logScreenView({required String screenName}) async {
    await _analytics?.logScreenView(screenName: screenName);
  }
  
  static Future<void> logLogin({required String loginMethod}) async {
    await _analytics?.logLogin(loginMethod: loginMethod);
  }
  
  // Méthodes utilitaires pour Crashlytics
  static Future<void> recordError(dynamic exception, StackTrace stack, {bool fatal = false}) async {
    await FirebaseCrashlytics.instance.recordError(exception, stack, fatal: fatal);
  }
  
  static Future<void> log(String message) async {
    await FirebaseCrashlytics.instance.log(message);
  }
  
  static Future<void> setUserIdentifier(String identifier) async {
    await FirebaseCrashlytics.instance.setUserIdentifier(identifier);
  }
}
EOL

echo -e "${GREEN}Fichier de configuration Firebase créé avec succès${NC}"

# Mettre à jour le fichier main.dart
echo -e "${YELLOW}Mise à jour du fichier main.dart...${NC}"
cat > lib/main.dart.new << EOL
import 'package:flutter/material.dart';
import 'package:camping_game_show/app.dart';
import 'package:camping_game_show/core/config/environment.dart';
import 'package:camping_game_show/core/services/firebase_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialiser Firebase
  await FirebaseConfig.initialize();
  
  // Initialiser l'environnement
  await Environment.initialize(Environment.production);
  
  runApp(const CampingGameShowApp());
}
EOL

# Remplacer le fichier main.dart
mv lib/main.dart.new lib/main.dart
echo -e "${GREEN}Fichier main.dart mis à jour avec succès${NC}"

# Créer le fichier de configuration pour le rapport de crash
echo -e "${YELLOW}Création du fichier de configuration pour le rapport de crash...${NC}"
cat > lib/core/services/crash_reporting_service.dart << EOL
import 'package:camping_game_show/core/services/firebase_config.dart';
import 'package:flutter/foundation.dart';

class CrashReportingService {
  // Initialiser le service
  static Future<void> initialize() async {
    // Déjà initialisé dans FirebaseConfig
  }
  
  // Enregistrer une exception non fatale
  static Future<void> recordError(dynamic exception, StackTrace stack) async {
    if (kReleaseMode) {
      await FirebaseConfig.recordError(exception, stack, fatal: false);
    } else {
      debugPrint('ERROR: \$exception');
      debugPrint('STACK: \$stack');
    }
  }
  
  // Enregistrer une exception fatale
  static Future<void> recordFatalError(dynamic exception, StackTrace stack) async {
    if (kReleaseMode) {
      await FirebaseConfig.recordError(exception, stack, fatal: true);
    } else {
      debugPrint('FATAL ERROR: \$exception');
      debugPrint('STACK: \$stack');
    }
  }
  
  // Ajouter un message au rapport de crash
  static Future<void> log(String message) async {
    if (kReleaseMode) {
      await FirebaseConfig.log(message);
    } else {
      debugPrint('CRASH LOG: \$message');
    }
  }
  
  // Définir l'identifiant utilisateur pour les rapports de crash
  static Future<void> setUserIdentifier(String identifier) async {
    if (kReleaseMode) {
      await FirebaseConfig.setUserIdentifier(identifier);
    }
  }
  
  // Activer/désactiver la collecte de rapports de crash
  static Future<void> setCollectionEnabled(bool enabled) async {
    if (kReleaseMode) {
      await FirebaseConfig.analytics.setAnalyticsCollectionEnabled(enabled);
    }
  }
}
EOL

echo -e "${GREEN}Fichier de configuration pour le rapport de crash créé avec succès${NC}"

# Récupérer les dépendances
echo -e "${YELLOW}Récupération des dépendances...${NC}"
flutter pub get
if [ $? -ne 0 ]; then
    echo -e "${RED}Erreur lors de la récupération des dépendances${NC}"
    exit 1
fi

echo -e "${GREEN}=== Configuration de Firebase terminée avec succès ===${NC}"
echo -e "${YELLOW}Firebase Analytics et Crashlytics sont maintenant configurés pour l'application Camping Game Show.${NC}"
echo -e "${YELLOW}Pour finaliser la configuration, vous devez:${NC}"
echo -e "  1. Connecter l'application à votre projet Firebase dans la console Firebase"
echo -e "  2. Télécharger et ajouter les fichiers de configuration google-services.json (Android) et GoogleService-Info.plist (iOS)"
echo -e "  3. Tester le fonctionnement d'Analytics et Crashlytics en générant des événements et des crashs de test"

echo -e "${GREEN}=== Fin de la configuration Firebase ===${NC}"
