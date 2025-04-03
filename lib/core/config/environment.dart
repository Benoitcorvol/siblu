enum Environment { dev, staging, prod }

class EnvironmentConfig {
  static Environment _environment = Environment.dev;
  
  static void setEnvironment(Environment env) {
    _environment = env;
  }
  
  static bool get isDev => _environment == Environment.dev;
  static bool get isStaging => _environment == Environment.staging;
  static bool get isProd => _environment == Environment.prod;
  
  static String get firebaseUrl {
    switch (_environment) {
      case Environment.dev:
        return 'https://camping-game-show-dev.firebaseio.com';
      case Environment.staging:
        return 'https://camping-game-show-staging.firebaseio.com';
      case Environment.prod:
        return 'https://camping-game-show-prod.firebaseio.com';
    }
  }
  
  static String get appName {
    switch (_environment) {
      case Environment.dev:
        return 'Camping Game Show - Dev';
      case Environment.staging:
        return 'Camping Game Show - Staging';
      case Environment.prod:
        return 'Camping Game Show';
    }
  }
  
  static bool get enableAnalytics {
    switch (_environment) {
      case Environment.dev:
        return false;
      case Environment.staging:
        return true;
      case Environment.prod:
        return true;
    }
  }
  
  static bool get enableCrashlytics {
    switch (_environment) {
      case Environment.dev:
        return false;
      case Environment.staging:
        return true;
      case Environment.prod:
        return true;
    }
  }
}
