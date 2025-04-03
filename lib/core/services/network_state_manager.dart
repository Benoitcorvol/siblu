import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class NetworkStateManager {
  static final NetworkStateManager _instance = NetworkStateManager._internal();
  factory NetworkStateManager() => _instance;

  final _connectivity = Connectivity();
  final _networkStateController = BehaviorSubject<NetworkState>();
  StreamSubscription? _connectivitySubscription;

  NetworkStateManager._internal() {
    _initializeNetworkMonitoring();
  }

  void _initializeNetworkMonitoring() {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
      _updateNetworkState(result);
    });

    // Check initial state
    _connectivity.checkConnectivity().then(_updateNetworkState);
  }

  void _updateNetworkState(ConnectivityResult result) {
    final state = NetworkState(
      isConnected: result != ConnectivityResult.none,
      connectionType: result,
      lastChecked: DateTime.now(),
    );
    _networkStateController.add(state);
  }

  Stream<NetworkState> get networkStateStream => _networkStateController.stream;
  NetworkState get currentState => _networkStateController.value;

  Future<bool> isOnline() async {
    final result = await _connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }

  void dispose() {
    _connectivitySubscription?.cancel();
    _networkStateController.close();
  }
}

class NetworkState {
  final bool isConnected;
  final ConnectivityResult connectionType;
  final DateTime lastChecked;

  NetworkState({
    required this.isConnected,
    required this.connectionType,
    required this.lastChecked,
  });
}