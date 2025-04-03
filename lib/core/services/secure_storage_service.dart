import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage _secureStorage;
  
  SecureStorageService({FlutterSecureStorage? secureStorage})
      : _secureStorage = secureStorage ?? const FlutterSecureStorage(
          aOptions: AndroidOptions(
            encryptedSharedPreferences: true,
            resetOnError: true,
          ),
          iOptions: IOSOptions(
            accessibility: KeychainAccessibility.first_unlock,
          ),
        );
  
  // Stocker des données sensibles de manière sécurisée
  Future<void> storeSecureData(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }
  
  // Récupérer des données sensibles
  Future<String?> getSecureData(String key) async {
    return await _secureStorage.read(key: key);
  }
  
  // Supprimer des données sensibles
  Future<void> deleteSecureData(String key) async {
    await _secureStorage.delete(key: key);
  }
  
  // Effacer toutes les données sensibles
  Future<void> clearAllSecureData() async {
    await _secureStorage.deleteAll();
  }
  
  // Stocker un token d'authentification
  Future<void> storeAuthToken(String token) async {
    await storeSecureData('auth_token', token);
  }
  
  // Récupérer un token d'authentification
  Future<String?> getAuthToken() async {
    return await getSecureData('auth_token');
  }
  
  // Supprimer un token d'authentification (déconnexion)
  Future<void> deleteAuthToken() async {
    await deleteSecureData('auth_token');
  }
  
  // Stocker les informations d'utilisateur
  Future<void> storeUserCredentials(String email, String password) async {
    await storeSecureData('user_email', email);
    await storeSecureData('user_password', password);
  }
  
  // Récupérer l'email de l'utilisateur
  Future<String?> getUserEmail() async {
    return await getSecureData('user_email');
  }
  
  // Stocker l'ID de session actuel
  Future<void> storeCurrentSessionId(String sessionId) async {
    await storeSecureData('current_session_id', sessionId);
  }
  
  // Récupérer l'ID de session actuel
  Future<String?> getCurrentSessionId() async {
    return await getSecureData('current_session_id');
  }
  
  // Stocker l'ID d'équipe actuel
  Future<void> storeCurrentTeamId(String teamId) async {
    await storeSecureData('current_team_id', teamId);
  }
  
  // Récupérer l'ID d'équipe actuel
  Future<String?> getCurrentTeamId() async {
    return await getSecureData('current_team_id');
  }
}
