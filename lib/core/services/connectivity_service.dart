import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  final StreamController<bool> _connectionStatusController =
      StreamController<bool>.broadcast();
  
  ConnectivityService() {
    // Initialiser
    _init();
  }
  
  Stream<bool> get onConnectivityChanged => _connectionStatusController.stream;
  
  Future<bool> isConnected() async {
    final result = await _connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }
  
  Future<void> _init() async {
    // Vérifier le statut de connexion initial
    _checkConnectionStatus();
    
    // Écouter les changements de connectivité
    _connectivity.onConnectivityChanged.listen((_) {
      _checkConnectionStatus();
    });
  }
  
  Future<void> _checkConnectionStatus() async {
    final isConnected = await this.isConnected();
    _connectionStatusController.add(isConnected);
  }
  
  void dispose() {
    _connectionStatusController.close();
  }
}
