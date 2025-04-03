import 'package:camping_game_show/core/services/connectivity_service.dart';
import 'package:camping_game_show/core/services/hive_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class SyncService {
  final FirebaseFirestore _firestore;
  final HiveService _hiveService;
  final ConnectivityService _connectivity;
  
  SyncService({
    required HiveService hiveService,
    required ConnectivityService connectivity,
    FirebaseFirestore? firestore,
  })  : _hiveService = hiveService,
        _connectivity = connectivity,
        _firestore = firestore ?? FirebaseFirestore.instance;
  
  // Synchroniser les données au démarrage de l'application
  Future<void> performInitialSync() async {
    if (await _connectivity.isConnected()) {
      await _syncPendingChanges();
    }
  }
  
  // Écouter les changements de connectivité
  void startSyncListener() {
    _connectivity.onConnectivityChanged.listen((isConnected) {
      if (isConnected) {
        _syncPendingChanges();
      }
    });
  }
  
  // Synchroniser les changements en attente
  Future<void> _syncPendingChanges() async {
    try {
      final pendingChanges = _hiveService.getAllPendingChanges();
      
      // Trier les changements par timestamp
      pendingChanges.sort((a, b) => a.timestamp.compareTo(b.timestamp));
      
      for (final change in pendingChanges) {
        await _applyChangeToFirestore(change);
        await _hiveService.removePendingChange(change.id);
      }
    } catch (e) {
      debugPrint('Erreur lors de la synchronisation: $e');
    }
  }
  
  // Appliquer un changement à Firestore
  Future<void> _applyChangeToFirestore(PendingChange change) async {
    try {
      switch (change.entityType) {
        case 'session':
          await _applySessionChange(change);
          break;
        case 'team':
          await _applyTeamChange(change);
          break;
        case 'player':
          await _applyPlayerChange(change);
          break;
        case 'round':
          await _applyRoundChange(change);
          break;
        default:
          debugPrint('Type d\'entité inconnu: ${change.entityType}');
      }
    } catch (e) {
      debugPrint('Erreur lors de l\'application du changement ${change.id}: $e');
      // Ne pas supprimer le changement en cas d'erreur
      // Il sera réessayé lors de la prochaine synchronisation
    }
  }
  
  // Appliquer un changement de session
  Future<void> _applySessionChange(PendingChange change) async {
    final sessionId = change.entityId;
    
    switch (change.operation) {
      case 'create':
        await _firestore.collection('sessions').doc(sessionId).set(change.data);
        break;
      case 'update':
        await _firestore.collection('sessions').doc(sessionId).update(change.data);
        break;
      case 'delete':
        await _firestore.collection('sessions').doc(sessionId).delete();
        break;
      default:
        debugPrint('Opération inconnue: ${change.operation}');
    }
  }
  
  // Appliquer un changement d'équipe
  Future<void> _applyTeamChange(PendingChange change) async {
    final teamId = change.entityId;
    final sessionId = change.data['sessionId'] as String?;
    
    if (sessionId == null) {
      debugPrint('SessionId manquant pour l\'équipe $teamId');
      return;
    }
    
    switch (change.operation) {
      case 'create':
        await _firestore.collection('sessions').doc(sessionId)
            .collection('teams').doc(teamId).set(change.data);
        break;
      case 'update':
        await _firestore.collection('sessions').doc(sessionId)
            .collection('teams').doc(teamId).update(change.data);
        break;
      case 'delete':
        await _firestore.collection('sessions').doc(sessionId)
            .collection('teams').doc(teamId).delete();
        break;
      default:
        debugPrint('Opération inconnue: ${change.operation}');
    }
  }
  
  // Appliquer un changement de joueur
  Future<void> _applyPlayerChange(PendingChange change) async {
    final playerId = change.entityId;
    final sessionId = change.data['sessionId'] as String?;
    
    if (sessionId == null) {
      debugPrint('SessionId manquant pour le joueur $playerId');
      return;
    }
    
    switch (change.operation) {
      case 'create':
        await _firestore.collection('sessions').doc(sessionId)
            .collection('participants').doc(playerId).set(change.data);
        break;
      case 'update':
        await _firestore.collection('sessions').doc(sessionId)
            .collection('participants').doc(playerId).update(change.data);
        break;
      case 'delete':
        await _firestore.collection('sessions').doc(sessionId)
            .collection('participants').doc(playerId).delete();
        break;
      default:
        debugPrint('Opération inconnue: ${change.operation}');
    }
  }
  
  // Appliquer un changement de round
  Future<void> _applyRoundChange(PendingChange change) async {
    final roundId = change.entityId;
    final sessionId = change.data['sessionId'] as String?;
    
    if (sessionId == null) {
      debugPrint('SessionId manquant pour le round $roundId');
      return;
    }
    
    switch (change.operation) {
      case 'create':
        await _firestore.collection('sessions').doc(sessionId)
            .collection('rounds').doc(roundId).set(change.data);
        break;
      case 'update':
        await _firestore.collection('sessions').doc(sessionId)
            .collection('rounds').doc(roundId).update(change.data);
        break;
      case 'delete':
        await _firestore.collection('sessions').doc(sessionId)
            .collection('rounds').doc(roundId).delete();
        break;
      default:
        debugPrint('Opération inconnue: ${change.operation}');
    }
  }
}
