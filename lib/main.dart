import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:camping_game_show/app.dart';
import 'package:camping_game_show/core/config/environment.dart';
import 'package:camping_game_show/core/services/local_storage_service.dart';
import 'package:camping_game_show/core/services/network_state_manager.dart';
import 'package:camping_game_show/core/services/sync_manager.dart';
import 'package:camping_game_show/core/services/analytics_service.dart';

void main() async {
  // Assurer que Flutter est initialisé
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize core services
  final networkManager = NetworkStateManager();
  final syncManager = SyncManager(networkManager: networkManager);
  await AnalyticsService.initialize();
  
  // Initialiser Firebase with offline persistence
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDummyApiKey123456789",
      appId: "1:123456789:web:abcdef123456789",
      messagingSenderId: "123456789",
      projectId: "camping-game-show-dev",
    ),
  );
  
  // Initialize local storage
  final localStorageService = LocalStorageService();
  await localStorageService.init();
  
  // Initialize offline analytics
  final offlineAnalyticsManager = OfflineAnalyticsManager(
    connectivity: networkManager,
  );
  
  // Register service worker for web platform
  if (kIsWeb) {
    await _registerServiceWorker();
  }
  
  // Lancer l'application avec l'environnement de développement
  runApp(App(
    environment: Environment.dev,
    networkManager: networkManager,
    syncManager: syncManager,
    analyticsManager: offlineAnalyticsManager,
  ));
}

Future<void> _registerServiceWorker() async {
  if (kIsWeb) {
    try {
      await window.navigator.serviceWorker?.register('/flutter_service_worker.js');
    } catch (e) {
      print('Service worker registration failed: $e');
    }
  }
}
