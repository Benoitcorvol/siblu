import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:camping_game_show/app.dart';
import 'package:camping_game_show/core/config/environment.dart';
import 'package:camping_game_show/core/services/local_storage_service.dart';

void main() async {
  // Assurer que Flutter est initialisé
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialiser Firebase
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDummyApiKey123456789",
      appId: "1:123456789:web:abcdef123456789",
      messagingSenderId: "123456789",
      projectId: "camping-game-show-dev",
    ),
  );
  
  // Initialiser les services
  final localStorageService = LocalStorageService();
  await localStorageService.init();
  
  // Activer Flutter DevTools en mode debug
  assert(() {
    // Ajouter l'initialisation pour DevTools si nécessaire
    return true;
  }());
  
  // Lancer l'application avec l'environnement de développement
  runApp(const App(environment: Environment.dev));
}
