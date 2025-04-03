import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:camping_game_show/core/services/firebase_config.dart';

class AnalyticsService {
  static FirebaseAnalytics get _analytics => FirebaseConfig.analytics;
  
  // Événements généraux
  static Future<void> logAppOpen() async {
    await _analytics.logAppOpen();
  }
  
  static Future<void> logScreenView({required String screenName}) async {
    await _analytics.logScreenView(screenName: screenName);
  }
  
  // Événements d'authentification
  static Future<void> logLogin({required String loginMethod}) async {
    await _analytics.logLogin(loginMethod: loginMethod);
  }
  
  static Future<void> logSignUp({required String signUpMethod}) async {
    await _analytics.logSignUp(signUpMethod: signUpMethod);
  }
  
  // Événements spécifiques à l'application
  static Future<void> logSessionCreated({required String sessionId}) async {
    await _analytics.logEvent(
      name: 'session_created',
      parameters: {
        'session_id': sessionId,
      },
    );
  }
  
  static Future<void> logSessionJoined({required String sessionId, required String teamId}) async {
    await _analytics.logEvent(
      name: 'session_joined',
      parameters: {
        'session_id': sessionId,
        'team_id': teamId,
      },
    );
  }
  
  static Future<void> logGameRoundStarted({
    required String sessionId,
    required int roundNumber,
  }) async {
    await _analytics.logEvent(
      name: 'game_round_started',
      parameters: {
        'session_id': sessionId,
        'round_number': roundNumber,
      },
    );
  }
  
  static Future<void> logGameRoundCompleted({
    required String sessionId,
    required int roundNumber,
    required int durationSeconds,
  }) async {
    await _analytics.logEvent(
      name: 'game_round_completed',
      parameters: {
        'session_id': sessionId,
        'round_number': roundNumber,
        'duration_seconds': durationSeconds,
      },
    );
  }
  
  static Future<void> logWheelSpin({
    required String sessionId,
    required String segmentResult,
  }) async {
    await _analytics.logEvent(
      name: 'wheel_spin',
      parameters: {
        'session_id': sessionId,
        'segment_result': segmentResult,
      },
    );
  }
  
  static Future<void> logPointsAwarded({
    required String sessionId,
    required String teamId,
    required int points,
  }) async {
    await _analytics.logEvent(
      name: 'points_awarded',
      parameters: {
        'session_id': sessionId,
        'team_id': teamId,
        'points': points,
      },
    );
  }
  
  static Future<void> logOfflineMode({required bool enabled}) async {
    await _analytics.logEvent(
      name: 'offline_mode',
      parameters: {
        'enabled': enabled,
      },
    );
  }
  
  static Future<void> logSyncCompleted({
    required int itemsSynced,
    required int durationMs,
  }) async {
    await _analytics.logEvent(
      name: 'sync_completed',
      parameters: {
        'items_synced': itemsSynced,
        'duration_ms': durationMs,
      },
    );
  }
  
  static Future<void> logError({
    required String errorCode,
    required String errorMessage,
  }) async {
    await _analytics.logEvent(
      name: 'app_error',
      parameters: {
        'error_code': errorCode,
        'error_message': errorMessage,
      },
    );
  }
  
  // Paramètres utilisateur
  static Future<void> setUserProperties({
    String? userId,
    String? userRole,
    String? deviceType,
  }) async {
    if (userId != null) {
      await _analytics.setUserId(id: userId);
    }
    
    if (userRole != null) {
      await _analytics.setUserProperty(name: 'user_role', value: userRole);
    }
    
    if (deviceType != null) {
      await _analytics.setUserProperty(name: 'device_type', value: deviceType);
    }
  }
  
  // Activer/désactiver la collecte d'analytique
  static Future<void> setAnalyticsCollectionEnabled(bool enabled) async {
    await _analytics.setAnalyticsCollectionEnabled(enabled);
  }
}
