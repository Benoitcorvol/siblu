import 'dart:async';
import 'package:camping_game_show/core/services/analytics_service.dart';
import 'package:camping_game_show/core/services/connectivity_service.dart';

class OfflineAnalyticsManager {
  final ConnectivityService _connectivity;
  Timer? _metricsTimer;
  DateTime? _offlineModeStartTime;

  OfflineAnalyticsManager({
    required ConnectivityService connectivity,
  }) : _connectivity = connectivity {
    _setupConnectivityListener();
    _startPeriodicMetricsCollection();
  }

  void _setupConnectivityListener() {
    _connectivity.onConnectivityChanged.listen((isConnected) {
      if (!isConnected) {
        _handleOfflineModeEntered();
      } else {
        _handleOfflineModeExited();
      }
    });
  }

  void _startPeriodicMetricsCollection() {
    _metricsTimer?.cancel();
    _metricsTimer = Timer.periodic(
      const Duration(minutes: 15),
      (_) => _collectOfflineMetrics(),
    );
  }

  Future<void> _handleOfflineModeEntered() async {
    _offlineModeStartTime = DateTime.now();
    await AnalyticsService.logOfflineModeEntered(
      reason: 'connectivity_lost',
      lastOnlineTimestamp: _offlineModeStartTime!.toIso8601String(),
    );
  }

  Future<void> _handleOfflineModeExited() async {
    if (_offlineModeStartTime != null) {
      final durationMinutes = DateTime.now().difference(_offlineModeStartTime!).inMinutes;
      final pendingOps = await _getPendingOperationsCount();
      
      await AnalyticsService.logOfflineModeExited(
        durationMinutes: durationMinutes,
        pendingOperationsCount: pendingOps,
      );
      
      _offlineModeStartTime = null;
      
      // Try to sync stored analytics events
      await AnalyticsService.syncOfflineEvents();
    }
  }

  Future<void> _collectOfflineMetrics() async {
    if (!await _connectivity.isConnected()) {
      final storageMetrics = await _getStorageMetrics();
      final pendingChanges = await _getPendingOperationsCount();
      
      await AnalyticsService.logOfflineStorageMetrics(
        usedStorageKb: storageMetrics.used,
        availableStorageKb: storageMetrics.available,
        pendingChangesCount: pendingChanges,
      );
    }
  }

  Future<StorageMetrics> _getStorageMetrics() async {
    // Implementation to get actual storage metrics
    return StorageMetrics(used: 0, available: 0);
  }

  Future<int> _getPendingOperationsCount() async {
    // Implementation to get actual pending operations count
    return 0;
  }

  void dispose() {
    _metricsTimer?.cancel();
  }
}

class StorageMetrics {
  final int used;
  final int available;

  StorageMetrics({required this.used, required this.available});
}