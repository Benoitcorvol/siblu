class AppConstants {
  // Application
  static const String appName = 'Camping Game Show';
  static const String appVersion = '1.0.0';
  
  // API Endpoints
  static const int apiTimeoutSeconds = 30;
  
  // Storage Keys
  static const String authTokenKey = 'auth_token';
  static const String userIdKey = 'user_id';
  static const String userRoleKey = 'user_role';
  
  // Session
  static const int sessionCodeLength = 6;
  static const int qrCodeExpirationMinutes = 10;
  
  // Game
  static const int defaultRoundDurationSeconds = 60;
  static const int minTeamSize = 2;
  static const int maxTeamSize = 10;
  
  // Animation
  static const int wheelSpinDurationSeconds = 5;
  
  // Assets
  static const String defaultAvatarPath = 'assets/images/default_avatar.png';
  static const String logoPath = 'assets/images/logo.png';
  static const String introVideoPath = 'assets/videos/intro.mp4';
  
  // Error Messages
  static const String networkErrorMessage = 'Vérifiez votre connexion internet et réessayez.';
  static const String sessionExpiredMessage = 'Votre session a expiré. Veuillez vous reconnecter.';
  static const String genericErrorMessage = 'Une erreur est survenue. Veuillez réessayer.';
}
