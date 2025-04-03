abstract class BaseRepository<T> {
  final Box<T> _localBox;
  final FirebaseFirestore _firestore;
  final ConnectivityService _connectivity;
  final SyncManager _syncManager;

  BaseRepository({
    required Box<T> localBox,
    required FirebaseFirestore firestore,
    required ConnectivityService connectivity,
    required SyncManager syncManager,
  }) : 
    _localBox = localBox,
    _firestore = firestore,
    _connectivity = connectivity,
    _syncManager = syncManager;

  Future<void> create(T item, {bool syncImmediately = true}) async {
    await _localBox.add(item);
    if (syncImmediately && await _connectivity.isConnected()) {
      await _syncManager.sync();
    }
  }

  Stream<List<T>> watchAll() {
    return _localBox.listenable().map((event) => event.values.toList());
  }
}