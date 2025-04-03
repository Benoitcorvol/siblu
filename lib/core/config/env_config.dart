import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static String get firebaseApiKey => _getEnvVar('FIREBASE_API_KEY');
  static String get firebaseAppId => _getEnvVar('FIREBASE_APP_ID');
  static String get firebaseProjectId => _getEnvVar('FIREBASE_PROJECT_ID');
  static String get firebaseMessagingSenderId => 
      _getEnvVar('FIREBASE_MESSAGING_SENDER_ID');
  static String get monitoringApiKey => _getEnvVar('MONITORING_API_KEY');
  
  static String _getEnvVar(String key) {
    final value = dotenv.env[key];
    if (value == null || value.isEmpty) {
      throw Exception('Environment variable $key not found');
    }
    return value;
  }
  
  static Future<void> initialize() async {
    await dotenv.load(fileName: '.env');
    _validateRequiredVars();
  }
  
  static void _validateRequiredVars() {
    final requiredVars = [
      'FIREBASE_API_KEY',
      'FIREBASE_APP_ID',
      'FIREBASE_PROJECT_ID',
      'FIREBASE_MESSAGING_SENDER_ID',
      'MONITORING_API_KEY',
    ];
    
    for (final key in requiredVars) {
      _getEnvVar(key); // Will throw if not found
    }
  }
}