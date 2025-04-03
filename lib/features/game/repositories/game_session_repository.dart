import 'package:camping_game_show/core/architecture/base_repository.dart';
import 'package:camping_game_show/features/game/models/game_session.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GameSessionRepository extends BaseRepository {
  static const String _collection = 'game_sessions';

  Future<void> createSession(GameSession session) async {
    await handleError(() async {
      await collection(_collection).doc(session.id).set(session.toJson());
    });
  }

  Future<void> updateSession(GameSession session) async {
    await handleError(() async {
      await collection(_collection).doc(session.id).update(session.toJson());
    });
  }

  Future<GameSession?> getSession(String sessionId) async {
    return handleError(() async {
      final doc = await collection(_collection).doc(sessionId).get();
      if (doc.exists) {
        return GameSession.fromJson(doc.data()!);
      }
      return null;
    });
  }

  Stream<List<GameSession>> watchActiveSessions() {
    final query = collection(_collection)
        .where('status', isEqualTo: 'active')
        .orderBy('createdAt', descending: true);

    return handleStreamError(
      query.snapshots().map((snapshot) => snapshot.docs
          .map((doc) => GameSession.fromJson(doc.data()))
          .toList()),
    );
  }

  Future<void> deleteSession(String sessionId) async {
    await handleError(() async {
      await collection(_collection).doc(sessionId).delete();
    });
  }
} 