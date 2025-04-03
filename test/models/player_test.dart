import 'package:flutter_test/flutter_test.dart';
import 'package:camping_game_show/features/game_engine/models/player.dart';

void main() {
  group('Player Model Tests', () {
    test('Player should be created correctly', () {
      final now = DateTime.now();
      final player = Player(
        id: 'player1',
        name: 'Jean Dupont',
        teamId: 'team1',
        sessionId: 'session1',
        isActive: true,
        lastSeen: now,
        createdAt: now,
        updatedAt: now,
        deviceId: 'device123',
      );
      
      expect(player.id, 'player1');
      expect(player.name, 'Jean Dupont');
      expect(player.teamId, 'team1');
      expect(player.sessionId, 'session1');
      expect(player.isActive, true);
      expect(player.deviceId, 'device123');
    });
    
    test('Player copyWith should work correctly', () {
      final now = DateTime.now();
      final player = Player(
        id: 'player1',
        name: 'Jean Dupont',
        teamId: 'team1',
        sessionId: 'session1',
        isActive: true,
        lastSeen: now,
        createdAt: now,
        updatedAt: now,
        deviceId: 'device123',
      );
      
      final updatedPlayer = player.copyWith(
        name: 'Marie Martin',
        teamId: 'team2',
        isActive: false,
      );
      
      expect(updatedPlayer.id, 'player1'); // Inchangé
      expect(updatedPlayer.name, 'Marie Martin'); // Modifié
      expect(updatedPlayer.teamId, 'team2'); // Modifié
      expect(updatedPlayer.isActive, false); // Modifié
      expect(updatedPlayer.sessionId, 'session1'); // Inchangé
      expect(updatedPlayer.deviceId, 'device123'); // Inchangé
    });
    
    test('Player fromJson and toJson should work correctly', () {
      final now = DateTime.now();
      final json = {
        'id': 'player1',
        'name': 'Jean Dupont',
        'teamId': 'team1',
        'sessionId': 'session1',
        'isActive': true,
        'lastSeen': now.toIso8601String(),
        'createdAt': now.toIso8601String(),
        'updatedAt': now.toIso8601String(),
        'deviceId': 'device123',
      };
      
      final player = Player.fromJson(json);
      
      expect(player.id, 'player1');
      expect(player.name, 'Jean Dupont');
      expect(player.teamId, 'team1');
      expect(player.isActive, true);
      
      final serialized = player.toJson();
      
      expect(serialized['id'], 'player1');
      expect(serialized['name'], 'Jean Dupont');
      expect(serialized['teamId'], 'team1');
      expect(serialized['isActive'], true);
      expect(serialized['deviceId'], 'device123');
    });
    
    test('Player equality should work correctly', () {
      final now = DateTime.now();
      final player1 = Player(
        id: 'player1',
        name: 'Jean Dupont',
        teamId: 'team1',
        sessionId: 'session1',
        isActive: true,
        lastSeen: now,
        createdAt: now,
        updatedAt: now,
        deviceId: 'device123',
      );
      
      final player2 = Player(
        id: 'player1',
        name: 'Jean Dupont',
        teamId: 'team1',
        sessionId: 'session1',
        isActive: true,
        lastSeen: now,
        createdAt: now,
        updatedAt: now,
        deviceId: 'device123',
      );
      
      final player3 = Player(
        id: 'player2',
        name: 'Marie Martin',
        teamId: 'team2',
        sessionId: 'session1',
        isActive: false,
        lastSeen: now,
        createdAt: now,
        updatedAt: now,
        deviceId: 'device456',
      );
      
      expect(player1, player2);
      expect(player1, isNot(player3));
      
      // Vérifier que les objets avec le même ID sont considérés comme égaux
      expect(player1.hashCode, player2.hashCode);
      expect(player1.hashCode, isNot(player3.hashCode));
    });
  });
}
