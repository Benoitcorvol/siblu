import 'package:camping_game_show/core/services/hive_service.dart';
import 'package:camping_game_show/features/game_engine/models/game_session.dart';
import 'package:camping_game_show/features/game_engine/models/game_round.dart';
import 'package:camping_game_show/features/game_engine/models/team.dart';
import 'package:camping_game_show/features/game_engine/repositories/session_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'dart:async';

class FirebaseSessionRepository implements SessionRepository {
  final FirebaseFirestore _firestore;
  final HiveService _hiveService;
  final _uuid = const Uuid();
  
  FirebaseSessionRepository({
    required HiveService hiveService,
    FirebaseFirestore? firestore,
  }) : _hiveService = hiveService,
       _firestore = firestore ?? FirebaseFirestore.instance;
  
  @override
  Future<GameSession?> getCurrentSession() async {
    try {
      final querySnapshot = await _firestore
          .collection('sessions')
          .where('status', isEqualTo: 'active')
          .limit(1)
          .get();
      
      if (querySnapshot.docs.isEmpty) {
        // Essayer de récupérer depuis le stockage local
        final localSessions = _hiveService.getAllSessions()
            .where((session) => session.status == GameSessionStatus.active)
            .toList();
        
        return localSessions.isNotEmpty ? localSessions.first : null;
      }
      
      final session = _sessionFromSnapshot(querySnapshot.docs.first);
      
      // Sauvegarder en local
      await _hiveService.saveSession(session);
      
      return session;
    } catch (e) {
      // En cas d'erreur (probablement hors ligne), essayer de récupérer depuis le stockage local
      final localSessions = _hiveService.getAllSessions()
          .where((session) => session.status == GameSessionStatus.active)
          .toList();
      
      return localSessions.isNotEmpty ? localSessions.first : null;
    }
  }
  
  @override
  Future<GameSession> createSession(SessionCreateParams params) async {
    final now = DateTime.now();
    final sessionId = _uuid.v4();
    
    final session = GameSession(
      id: sessionId,
      name: params.name,
      teams: params.initialTeams ?? [],
      createdAt: now,
      updatedAt: now,
      status: GameSessionStatus.pending,
      gameTemplateType: params.gameTemplateType,
      scheduledDate: params.scheduledDate,
      locationName: params.locationName,
      settings: params.settings,
    );
    
    try {
      // Sauvegarder sur Firestore
      await _firestore.collection('sessions').doc(sessionId).set(session.toJson());
      
      // Sauvegarder en local
      await _hiveService.saveSession(session);
      
      return session;
    } catch (e) {
      // En cas d'erreur (probablement hors ligne), sauvegarder uniquement en local
      // et créer un changement en attente
      await _hiveService.saveSession(session);
      
      await _hiveService.savePendingChange(
        PendingChange(
          id: _uuid.v4(),
          entityType: 'session',
          entityId: sessionId,
          operation: 'create',
          data: session.toJson(),
          timestamp: now,
        ),
      );
      
      return session;
    }
  }
  
  @override
  Future<GameRound> startNewRound(String sessionId) async {
    final now = DateTime.now();
    final roundId = _uuid.v4();
    
    // Récupérer la session
    final session = await _getSession(sessionId);
    if (session == null) {
      throw Exception('Session not found');
    }
    
    // Déterminer le numéro du round
    final roundNumber = session.history.length + 1;
    
    // Créer le nouveau round
    final round = GameRound(
      id: roundId,
      sessionId: sessionId,
      roundNumber: roundNumber,
      timeRemaining: 300, // 5 minutes par défaut
      status: GameRoundStatus.active,
      teamScores: [],
      createdAt: now,
      updatedAt: now,
      startedAt: now,
    );
    
    try {
      // Mettre à jour la session sur Firestore
      await _firestore.collection('sessions').doc(sessionId).update({
        'currentRound': round.toJson(),
        'status': 'active',
        'updatedAt': now.toIso8601String(),
      });
      
      // Sauvegarder le round sur Firestore
      await _firestore.collection('sessions').doc(sessionId)
          .collection('rounds').doc(roundId).set(round.toJson());
      
      // Mettre à jour en local
      final updatedSession = session.copyWith(
        currentRound: round,
        status: GameSessionStatus.active,
        updatedAt: now,
      );
      
      await _hiveService.saveSession(updatedSession);
      await _hiveService.saveRound(round);
      
      return round;
    } catch (e) {
      // En cas d'erreur (probablement hors ligne), sauvegarder uniquement en local
      // et créer un changement en attente
      final updatedSession = session.copyWith(
        currentRound: round,
        status: GameSessionStatus.active,
        updatedAt: now,
      );
      
      await _hiveService.saveSession(updatedSession);
      await _hiveService.saveRound(round);
      
      await _hiveService.savePendingChange(
        PendingChange(
          id: _uuid.v4(),
          entityType: 'round',
          entityId: roundId,
          operation: 'create',
          data: round.toJson(),
          timestamp: now,
        ),
      );
      
      await _hiveService.savePendingChange(
        PendingChange(
          id: _uuid.v4(),
          entityType: 'session',
          entityId: sessionId,
          operation: 'update',
          data: updatedSession.toJson(),
          timestamp: now,
        ),
      );
      
      return round;
    }
  }
  
  @override
  Future<GameSession> endRound(String sessionId, String roundId) async {
    final now = DateTime.now();
    
    // Récupérer la session
    final session = await _getSession(sessionId);
    if (session == null) {
      throw Exception('Session not found');
    }
    
    // Récupérer le round
    final round = await _getRound(roundId);
    if (round == null) {
      throw Exception('Round not found');
    }
    
    // Mettre à jour le round
    final updatedRound = round.copyWith(
      status: GameRoundStatus.completed,
      updatedAt: now,
      endedAt: now,
    );
    
    // Mettre à jour la session
    final updatedHistory = [...session.history, updatedRound];
    final updatedSession = session.copyWith(
      currentRound: null,
      history: updatedHistory,
      updatedAt: now,
    );
    
    try {
      // Mettre à jour le round sur Firestore
      await _firestore.collection('sessions').doc(sessionId)
          .collection('rounds').doc(roundId).update({
        'status': 'completed',
        'updatedAt': now.toIso8601String(),
        'endedAt': now.toIso8601String(),
      });
      
      // Mettre à jour la session sur Firestore
      await _firestore.collection('sessions').doc(sessionId).update({
        'currentRound': null,
        'history': updatedHistory.map((r) => r.toJson()).toList(),
        'updatedAt': now.toIso8601String(),
      });
      
      // Mettre à jour en local
      await _hiveService.saveRound(updatedRound);
      await _hiveService.saveSession(updatedSession);
      
      return updatedSession;
    } catch (e) {
      // En cas d'erreur (probablement hors ligne), sauvegarder uniquement en local
      // et créer un changement en attente
      await _hiveService.saveRound(updatedRound);
      await _hiveService.saveSession(updatedSession);
      
      await _hiveService.savePendingChange(
        PendingChange(
          id: _uuid.v4(),
          entityType: 'round',
          entityId: roundId,
          operation: 'update',
          data: updatedRound.toJson(),
          timestamp: now,
        ),
      );
      
      await _hiveService.savePendingChange(
        PendingChange(
          id: _uuid.v4(),
          entityType: 'session',
          entityId: sessionId,
          operation: 'update',
          data: updatedSession.toJson(),
          timestamp: now,
        ),
      );
      
      return updatedSession;
    }
  }
  
  @override
  Future<GameSession> updateTeamScore(String sessionId, String teamId, int pointsToAdd) async {
    final now = DateTime.now();
    
    // Récupérer la session
    final session = await _getSession(sessionId);
    if (session == null) {
      throw Exception('Session not found');
    }
    
    // Trouver l'équipe
    final teamIndex = session.teams.indexWhere((team) => team.id == teamId);
    if (teamIndex == -1) {
      throw Exception('Team not found');
    }
    
    // Mettre à jour le score de l'équipe
    final team = session.teams[teamIndex];
    final updatedTeam = team.copyWith(score: team.score + pointsToAdd);
    
    // Mettre à jour la liste des équipes
    final updatedTeams = [...session.teams];
    updatedTeams[teamIndex] = updatedTeam;
    
    // Mettre à jour la session
    final updatedSession = session.copyWith(
      teams: updatedTeams,
      updatedAt: now,
    );
    
    try {
      // Mettre à jour l'équipe sur Firestore
      await _firestore.collection('sessions').doc(sessionId)
          .collection('teams').doc(teamId).update({
        'score': updatedTeam.score,
        'updatedAt': now.toIso8601String(),
      });
      
      // Mettre à jour la session sur Firestore
      await _firestore.collection('sessions').doc(sessionId).update({
        'teams': updatedTeams.map((t) => t.toJson()).toList(),
        'updatedAt': now.toIso8601String(),
      });
      
      // Mettre à jour en local
      await _hiveService.saveTeam(updatedTeam);
      await _hiveService.saveSession(updatedSession);
      
      return updatedSession;
    } catch (e) {
      // En cas d'erreur (probablement hors ligne), sauvegarder uniquement en local
      // et créer un changement en attente
      await _hiveService.saveTeam(updatedTeam);
      await _hiveService.saveSession(updatedSession);
      
      await _hiveService.savePendingChange(
        PendingChange(
          id: _uuid.v4(),
          entityType: 'team',
          entityId: teamId,
          operation: 'update',
          data: updatedTeam.toJson(),
          timestamp: now,
        ),
      );
      
      await _hiveService.savePendingChange(
        PendingChange(
          id: _uuid.v4(),
          entityType: 'session',
          entityId: sessionId,
          operation: 'update',
          data: updatedSession.toJson(),
          timestamp: now,
        ),
      );
      
      return updatedSession;
    }
  }
  
  @override
  Stream<GameSession> getSessionStream(String sessionId) {
    final controller = StreamController<GameSession>();
    
    // Écouter les mises à jour de Firestore
    final subscription = _firestore
        .collection('sessions')
        .doc(sessionId)
        .snapshots()
        .listen((snapshot) {
      if (snapshot.exists) {
        final session = _sessionFromSnapshot(snapshot);
        
        // Sauvegarder en local
        _hiveService.saveSession(session);
        
        controller.add(session);
      }
    }, onError: (e) {
      // En cas d'erreur (probablement hors ligne), essayer de récupérer depuis le stockage local
      final localSession = _hiveService.getSession(sessionId);
      if (localSession != null) {
        controller.add(localSession);
      } else {
        controller.addError(e);
      }
    });
    
    // Fermer le stream et l'abonnement lorsque le controller est fermé
    controller.onCancel = () {
      subscription.cancel();
    };
    
    return controller.stream;
  }
  
  @override
  Stream<List<GameSession>> getSessionsStream() {
    final controller = StreamController<List<GameSession>>();
    
    // Écouter les mises à jour de Firestore
    final subscription = _firestore
        .collection('sessions')
        .snapshots()
        .listen((snapshot) {
      final sessions = snapshot.docs
          .map(_sessionFromSnapshot)
          .toList();
      
      // Sauvegarder en local
      for (final session in sessions) {
        _hiveService.saveSession(session);
      }
      
      controller.add(sessions);
    }, onError: (e) {
      // En cas d'erreur (probablement hors ligne), essayer de récupérer depuis le stockage local
      final localSessions = _hiveService.getAllSessions();
      controller.add(localSessions);
    });
    
    // Fermer le stream et l'abonnement lorsque le controller est fermé
    controller.onCancel = () {
      subscription.cancel();
    };
    
    return controller.stream;
  }
  
  @override
  Future<String> generateSessionCode(String sessionId) async {
    // Générer un code à 6 chiffres
    final code = (100000 + DateTime.now().millisecondsSinceEpoch % 900000).toString();
    
    try {
      // Sauvegarder le code sur Firestore
      await _firestore.collection('session_codes').doc(code).set({
        'sessionId': sessionId,
        'createdAt': DateTime.now().toIso8601String(),
        'expiresAt': DateTime.now().add(const Duration(hours: 24)).toIso8601String(),
      });
      
      return code;
    } catch (e) {
      // En cas d'erreur, retourner quand même le code
      // Il sera validé localement
      return code;
    }
  }
  
  @override
  Future<GameSession?> getSessionByCode(String code) async {
    try {
      // Récupérer le sessionId depuis Firestore
      final codeDoc = await _firestore.collection('session_codes').doc(code).get();
      
      if (!codeDoc.exists) {
        return null;
      }
      
      final sessionId = codeDoc.data()?['sessionId'] as String?;
      if (sessionId == null) {
        return null;
      }
      
      // Récupérer la session
      return await _getSession(sessionId);
    } catch (e) {
      // En cas d'erreur (probablement hors ligne), essayer de valider localement
      // Note: Cette validation est limitée car nous n'avons pas les codes en local
      // Dans une implémentation réelle, il faudrait stocker les codes en local aussi
      return null;
    }
  }
  
  // Méthodes privées
  Future<GameSession?> _getSession(String sessionId) async {
    try {
      final doc = await _firestore.collection('sessions').doc(sessionId).get();
      
      if (!doc.exists) {
        return _hiveService.getSession(sessionId);
      }
      
      final session = _sessionFromSnapshot(doc);
      
      // Sauvegarder en local
      await _hiveService.saveSession(session);
      
      return session;
    } catch (e) {
      // En cas d'erreur (probablement hors ligne), essayer de récupérer depuis le stockage local
      return _hiveService.getSession(sessionId);
    }
  }
  
  Future<GameRound?> _getRound(String roundId) async {
    try {
      // Essayer de trouver le round dans Firestore
      // Note: Nous aurions besoin de connaître le sessionId pour le chemin complet
      // Pour simplifier, nous utilisons directement le stockage local
      return _hiveService.getRound(roundId);
    } catch (e) {
      // En cas d'erreur, essayer de récupérer depuis le stockage local
      return _hiveService.getRound(roundId);
    }
  }
  
  GameSession _sessionFromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    
    return GameSession.fromJson({
      'id': snapshot.id,
      ...data,
    });
  }
}
