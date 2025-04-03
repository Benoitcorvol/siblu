class OfflineManager {
  final Box<dynamic> _dataBox;
  final Box<dynamic> _pendingActionsBox;
  final ConnectivityService _connectivity;
  final HiveService _hiveService;
  final SyncManager _syncManager;

  OfflineManager({
    required Box<dynamic> dataBox,
    required Box<dynamic> pendingActionsBox,
    required ConnectivityService connectivity,
    required HiveService hiveService,
    required SyncManager syncManager,
  }) : 
    _dataBox = dataBox,
    _pendingActionsBox = pendingActionsBox,
    _connectivity = connectivity,
    _hiveService = hiveService,
    _syncManager = syncManager;

  Future<void> initializeOfflineData() async {
    // Pre-download essential game assets
    await _downloadGameAssets();
    
    // Initialize local database
    await _initializeLocalDB();
    
    // Setup sync listeners
    _setupSyncListeners();
    
    // Initial data sync if online
    if (await _connectivity.isConnected()) {
      await _syncManager.performInitialSync();
    }
  }

  Future<void> _downloadGameAssets() async {
    final assets = [
      'assets/games/',
      'assets/sounds/',
      'assets/images/',
      'assets/animations/'
    ];
    
    for (final asset in assets) {
      await _hiveService.cacheAsset(asset);
    }
  }

  Future<void> _initializeLocalDB() async {
    // Ensure all Hive boxes are initialized
    await _hiveService.init();
  }

  void _setupSyncListeners() {
    _connectivity.onConnectivityChanged.listen((isConnected) {
      if (isConnected) {
        _syncManager.startSync();
      }
    });
  }

  Future<void> queueOfflineAction(PendingChange change) async {
    await _pendingActionsBox.put(change.id, change.toJson());
  }

  Future<bool> isDataAvailableOffline(String entityType, String entityId) async {
    switch (entityType) {
      case 'session':
        return _hiveService.getSession(entityId) != null;
      case 'team':
        return _hiveService.getTeam(entityId) != null;
      case 'round':
        return _hiveService.getRound(entityId) != null;
      default:
        return false;
    }
  }

  Future<void> ensureOfflineAvailability(String sessionId) async {
    // Cache session data
    final session = await _hiveService.getSession(sessionId);
    if (session != null) {
      // Cache related teams
      final teams = await _hiveService.getTeamsBySession(sessionId);
      // Cache related rounds
      final rounds = await _hiveService.getRoundsBySession(sessionId);
      // Cache related wheel segments
      for (final round in rounds) {
        if (round.wheelSegmentId != null) {
          await _hiveService.getWheelSegment(round.wheelSegmentId!);
        }
      }
    }
  }
}
