import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:camping_game_show/core/services/firebase_config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class MonitoringService {
  static const String _monitoringEndpoint = 'https://monitoring.campinggameshow.example.com/api/status';
  static Timer? _heartbeatTimer;
  static bool _isInitialized = false;
  
  // Initialiser le service de surveillance
  static Future<void> initialize() async {
    if (_isInitialized) return;
    
    // Configurer la capture des erreurs non gérées
    FlutterError.onError = (FlutterErrorDetails details) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(details);
      _reportError('flutter_error', details.exception.toString(), details.stack.toString());
    };
    
    // Démarrer le heartbeat
    _startHeartbeat();
    
    // Envoyer un événement d'initialisation
    await _sendStatusUpdate('app_initialized', {
      'app_version': '1.0.0',
      'device_info': await _getDeviceInfo(),
    });
    
    _isInitialized = true;
    debugPrint('Monitoring service initialized');
  }
  
  // Démarrer le heartbeat périodique
  static void _startHeartbeat() {
    _heartbeatTimer?.cancel();
    _heartbeatTimer = Timer.periodic(const Duration(minutes: 15), (timer) {
      _sendHeartbeat();
    });
  }
  
  // Envoyer un heartbeat au serveur de surveillance
  static Future<void> _sendHeartbeat() async {
    try {
      await _sendStatusUpdate('heartbeat', {
        'timestamp': DateTime.now().toIso8601String(),
        'memory_usage': await _getMemoryUsage(),
        'battery_level': await _getBatteryLevel(),
        'network_status': await _getNetworkStatus(),
      });
    } catch (e) {
      debugPrint('Failed to send heartbeat: $e');
    }
  }
  
  // Signaler une erreur au système de surveillance
  static Future<void> _reportError(String errorType, String errorMessage, String stackTrace) async {
    try {
      await _sendStatusUpdate('error', {
        'error_type': errorType,
        'error_message': errorMessage,
        'stack_trace': stackTrace,
        'timestamp': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      debugPrint('Failed to report error: $e');
    }
  }
  
  // Envoyer une mise à jour de statut au serveur de surveillance
  static Future<void> _sendStatusUpdate(String eventType, Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse(_monitoringEndpoint),
        headers: {
          'Content-Type': 'application/json',
          'X-API-Key': 'monitoring-api-key-placeholder',
        },
        body: jsonEncode({
          'event_type': eventType,
          'app_id': 'com.campingappshow.camping_game_show',
          'data': data,
        }),
      );
      
      if (response.statusCode != 200) {
        debugPrint('Monitoring server returned status code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Failed to send status update: $e');
      // Stocker localement pour envoi ultérieur
      _storeFailedUpdate(eventType, data);
    }
  }
  
  // Stocker les mises à jour qui ont échoué pour les réessayer plus tard
  static void _storeFailedUpdate(String eventType, Map<String, dynamic> data) {
    // Dans une implémentation réelle, cela stockerait les données dans une base de données locale
    debugPrint('Storing failed update for later retry: $eventType');
  }
  
  // Obtenir des informations sur l'appareil
  static Future<Map<String, dynamic>> _getDeviceInfo() async {
    // Dans une implémentation réelle, cela utiliserait le package device_info_plus
    return {
      'platform': 'android', // ou 'ios'
      'model': 'unknown',
      'os_version': 'unknown',
    };
  }
  
  // Obtenir l'utilisation de la mémoire
  static Future<int> _getMemoryUsage() async {
    // Dans une implémentation réelle, cela utiliserait des méthodes natives
    return 0; // En MB
  }
  
  // Obtenir le niveau de batterie
  static Future<int> _getBatteryLevel() async {
    // Dans une implémentation réelle, cela utiliserait le package battery_plus
    return 100; // En pourcentage
  }
  
  // Obtenir le statut du réseau
  static Future<String> _getNetworkStatus() async {
    // Dans une implémentation réelle, cela utiliserait le package connectivity_plus
    return 'connected'; // 'connected', 'disconnected', 'cellular', 'wifi'
  }
  
  // Surveiller une opération critique
  static Future<T> monitorOperation<T>({
    required String operationName,
    required Future<T> Function() operation,
  }) async {
    final stopwatch = Stopwatch()..start();
    try {
      final result = await operation();
      stopwatch.stop();
      
      // Enregistrer les métriques de l'opération
      await _sendStatusUpdate('operation_completed', {
        'operation_name': operationName,
        'duration_ms': stopwatch.elapsedMilliseconds,
        'success': true,
      });
      
      return result;
    } catch (e, stack) {
      stopwatch.stop();
      
      // Enregistrer l'échec de l'opération
      await _sendStatusUpdate('operation_failed', {
        'operation_name': operationName,
        'duration_ms': stopwatch.elapsedMilliseconds,
        'error_message': e.toString(),
        'stack_trace': stack.toString(),
      });
      
      rethrow;
    }
  }
  
  // Arrêter le service de surveillance
  static void dispose() {
    _heartbeatTimer?.cancel();
    _heartbeatTimer = null;
    _isInitialized = false;
    debugPrint('Monitoring service disposed');
  }
}
