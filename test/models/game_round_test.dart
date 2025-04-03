import 'package:flutter_test/flutter_test.dart';
import 'package:camping_game_show/features/game_engine/models/game_round.dart';

void main() {
  group('GameRound Model Tests', () {
    test('GameRound should be created correctly', () {
      final now = DateTime.now();
      final gameRound = GameRound(
        id: 'round1',
        sessionId: 'session1',
        roundNumber: 3,
        timeRemaining: 180,
        status: GameRoundStatus.active,
        teamScores: [
          {'teamId': 'team1', 'score': 120},
          {'teamId': 'team2', 'score': 90},
        ],
        createdAt: now,
        updatedAt: now,
        startedAt: now,
        endedAt: null,
      );
      
      expect(gameRound.id, 'round1');
      expect(gameRound.sessionId, 'session1');
      expect(gameRound.roundNumber, 3);
      expect(gameRound.timeRemaining, 180);
      expect(gameRound.status, GameRoundStatus.active);
      expect(gameRound.teamScores.length, 2);
      expect(gameRound.teamScores[0]['teamId'], 'team1');
      expect(gameRound.teamScores[0]['score'], 120);
      expect(gameRound.startedAt, now);
      expect(gameRound.endedAt, null);
    });
    
    test('GameRound copyWith should work correctly', () {
      final now = DateTime.now();
      final gameRound = GameRound(
        id: 'round1',
        sessionId: 'session1',
        roundNumber: 3,
        timeRemaining: 180,
        status: GameRoundStatus.active,
        teamScores: [],
        createdAt: now,
        updatedAt: now,
        startedAt: now,
        endedAt: null,
      );
      
      final updatedRound = gameRound.copyWith(
        timeRemaining: 120,
        status: GameRoundStatus.completed,
        endedAt: now.add(const Duration(minutes: 3)),
      );
      
      expect(updatedRound.id, 'round1'); // Inchangé
      expect(updatedRound.sessionId, 'session1'); // Inchangé
      expect(updatedRound.roundNumber, 3); // Inchangé
      expect(updatedRound.timeRemaining, 120); // Modifié
      expect(updatedRound.status, GameRoundStatus.completed); // Modifié
      expect(updatedRound.endedAt, isNotNull); // Modifié
    });
    
    test('GameRound fromJson and toJson should work correctly', () {
      final now = DateTime.now();
      final json = {
        'id': 'round1',
        'sessionId': 'session1',
        'roundNumber': 3,
        'timeRemaining': 180,
        'status': 'active',
        'teamScores': [
          {'teamId': 'team1', 'score': 120},
          {'teamId': 'team2', 'score': 90},
        ],
        'createdAt': now.toIso8601String(),
        'updatedAt': now.toIso8601String(),
        'startedAt': now.toIso8601String(),
        'endedAt': null,
      };
      
      final gameRound = GameRound.fromJson(json);
      
      expect(gameRound.id, 'round1');
      expect(gameRound.sessionId, 'session1');
      expect(gameRound.roundNumber, 3);
      expect(gameRound.timeRemaining, 180);
      expect(gameRound.status, GameRoundStatus.active);
      
      final serialized = gameRound.toJson();
      
      expect(serialized['id'], 'round1');
      expect(serialized['sessionId'], 'session1');
      expect(serialized['roundNumber'], 3);
      expect(serialized['timeRemaining'], 180);
      expect(serialized['status'], 'active');
      expect(serialized['teamScores'].length, 2);
    });
  });
  
  group('GameRoundStatus Enum Tests', () {
    test('GameRoundStatus values should be correct', () {
      expect(GameRoundStatus.values.length, 4);
      expect(GameRoundStatus.pending.toString(), 'GameRoundStatus.pending');
      expect(GameRoundStatus.active.toString(), 'GameRoundStatus.active');
      expect(GameRoundStatus.paused.toString(), 'GameRoundStatus.paused');
      expect(GameRoundStatus.completed.toString(), 'GameRoundStatus.completed');
    });
    
    test('GameRoundStatus fromString should work correctly', () {
      expect(GameRoundStatus.fromString('pending'), GameRoundStatus.pending);
      expect(GameRoundStatus.fromString('active'), GameRoundStatus.active);
      expect(GameRoundStatus.fromString('paused'), GameRoundStatus.paused);
      expect(GameRoundStatus.fromString('completed'), GameRoundStatus.completed);
      expect(GameRoundStatus.fromString('invalid'), GameRoundStatus.pending); // Valeur par défaut
    });
  });
}
