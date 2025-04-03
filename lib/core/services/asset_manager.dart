class AssetManager {
  final CacheManager _cache;
  final Storage _storage;
  
  Future<void> prepareOfflineAssets() async {
    final manifest = await _loadAssetManifest();
    
    // Download and cache all required assets
    for (final asset in manifest.requiredAssets) {
      await _cache.downloadAndCache(
        asset.url,
        maxAge: const Duration(days: 30),
        key: asset.key,
      );
    }
    
    // Pre-cache optional assets if space allows
    if (await _hasAvailableStorage()) {
      for (final asset in manifest.optionalAssets) {
        await _cache.downloadAndCache(
          asset.url,
          maxAge: const Duration(days: 7),
          key: asset.key,
        );
      }
    }
  }

  Future<bool> _hasAvailableStorage() async {
    final info = await PathProvider.getStorageInfo();
    return info.free > 500 * 1024 * 1024; // 500MB minimum
  }
}