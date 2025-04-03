import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  late SharedPreferences _prefs;
  
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }
  
  // Méthodes pour les chaînes de caractères
  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }
  
  String getString(String key, {String defaultValue = ''}) {
    return _prefs.getString(key) ?? defaultValue;
  }
  
  // Méthodes pour les entiers
  Future<bool> setInt(String key, int value) async {
    return await _prefs.setInt(key, value);
  }
  
  int getInt(String key, {int defaultValue = 0}) {
    return _prefs.getInt(key) ?? defaultValue;
  }
  
  // Méthodes pour les booléens
  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }
  
  bool getBool(String key, {bool defaultValue = false}) {
    return _prefs.getBool(key) ?? defaultValue;
  }
  
  // Méthodes pour les listes de chaînes
  Future<bool> setStringList(String key, List<String> value) async {
    return await _prefs.setStringList(key, value);
  }
  
  List<String> getStringList(String key, {List<String> defaultValue = const []}) {
    return _prefs.getStringList(key) ?? defaultValue;
  }
  
  // Vérifier si une clé existe
  bool containsKey(String key) {
    return _prefs.containsKey(key);
  }
  
  // Supprimer une valeur
  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }
  
  // Effacer toutes les valeurs
  Future<bool> clear() async {
    return await _prefs.clear();
  }
  
  // Obtenir toutes les clés
  Set<String> getKeys() {
    return _prefs.getKeys();
  }
  
  // Méthodes spécifiques à l'application
  Future<bool> setLastSyncTime(DateTime time) async {
    return await setInt('last_sync_time', time.millisecondsSinceEpoch);
  }
  
  DateTime getLastSyncTime() {
    final timestamp = getInt('last_sync_time');
    return timestamp > 0 
        ? DateTime.fromMillisecondsSinceEpoch(timestamp) 
        : DateTime.now().subtract(const Duration(days: 7));
  }
}
