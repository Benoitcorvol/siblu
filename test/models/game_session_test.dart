import 'package:flutter_test/flutter_test.dart';
import 'package:camping_game_show/features/game_engine/models/game_session.dart';
import 'package:camping_game_show/features/game_engine/models/team.dart';

void main() {
  group('GameSession Model Tests', () {
    test('GameSession should be created correctly', () {
      final now = DateTime.now();
      final teams = [
        Team(
          id: 'team1',
          name: 'Les Aventuriers',
          colorHex: '#F44336',
          score: 120,
          sessionId: 'session1',
          players: [],
          createdAt: now,
          updatedAt: now,
        ),
        Team(
          id: 'team2',
          name: 'Les Explorateurs',
          colorHex: '#2196F3',
          score: 90,
          sessionId: 'session1',
          players: [],
          createdAt: now,
          updatedAt: now,
        ),
      ];
      
      final session = GameSession(
        id: 'session1',
        name: 'Grand jeu du camping - Été 2025',
        teams: teams,
        createdAt: now,
        updatedAt: now,
        status: GameSessionStatus.active,
        gameTemplateType: 'standard',
        scheduledDate: now.add(const Duration(days: 1)),
        locationName: 'Terrain de jeux principal',
        settings: {
          'maxRounds': 10,
          'timePerRound': 300,
        },
        history: [],
        currentRound: null,
      );
      
      expect(session.id, 'session1');
      expect(session.name, 'Grand jeu du camping - Été 2025');
      expect(session.teams.length, 2);
      expect(session.status, GameSessionStatus.active);
      expect(session.gameTemplateType, 'standard');
      expect(session.locationName, 'Terrain de jeux principal');
      expect(session.settings['maxRounds'], 10);
      expect(session.settings['timePerRound'], 300);
    });
    
    test('GameSession copyWith should work correctly', () {
      final now = DateTime.now();
      final session = GameSession(
        id: 'session1',
        name: 'Grand jeu du camping - Été 2025',
        teams: [],
        createdAt: now,
        updatedAt: now,
        status: GameSessionStatus.pending,
        gameTemplateType: 'standard',
        scheduledDate: now.add(const Duration(days: 1)),
        locationName: 'Terrain de jeux principal',
        settings: {},
        history: [],
        currentRound: null,
      );
      
      final updatedSession = session.copyWith(
        name: 'Nouveau nom',
        status: GameSessionStatus.active,
      );
      
      expect(updatedSession.id, 'session1'); // Inchangé
      expect(updatedSession.name, 'Nouveau nom'); // Modifié
      expect(updatedSession.status, GameSessionStatus.active); // Modifié
      expect(updatedSession.gameTemplateType, 'standard'); // Inchangé
    });
    
    test('GameSession fromJson and toJson should work correctly', () {
      final now = DateTime.now();
      final json = {
        'id': 'session1',
        'name': 'Grand jeu du camping - Été 2025',
        'teams': [],
        'createdAt': now.toIso8601String(),
        'updatedAt': now.toIso8601String(),
        'status': 'active',
        'gameTemplateType': 'standard',
        'scheduledDate': now.add(const Duration(days: 1)).toIso8601String(),
        'locationName': 'Terrain de jeux principal',
        'settings': {
          'maxRounds': 10,
          'timePerRound': 300,
        },
        'history': [],
        'currentRound': null,
      };
      
      final session = GameSession.fromJson(json);
      
      expect(session.id, 'session1');
      expect(session.name, 'Grand jeu du camping - Été 2025');
      expect(session.status, GameSessionStatus.active);
      
      final serialized = session.toJson();
      
      expect(serialized['id'], 'session1');
      expect(serialized['name'], 'Grand jeu du camping - Été 2025');
      expect(serialized['status'], 'active');
      expect(serialized['settings']['maxRounds'], 10);
    });
  });
  
  group('Team Model Tests', () {
    test('Team should be created correctly', () {
      final now = DateTime.now();
      final team = Team(
        id: 'team1',
        name: 'Les Aventuriers',
        colorHex: '#F44336',
        score: 120,
        sessionId: 'session1',
        players: [],
        createdAt: now,
        updatedAt: now,
      );
      
      expect(team.id, 'team1');
      expect(team.name, 'Les Aventuriers');
      expect(team.colorHex, '#F44336');
      expect(team.score, 120);
      expect(team.sessionId, 'session1');
      expect(team.players, isEmpty);
    });
    
    test('Team copyWith should work correctly', () {
      final now = DateTime.now();
      final team = Team(
        id: 'team1',
        name: 'Les Aventuriers',
        colorHex: '#F44336',
        score: 120,
        sessionId: 'session1',
        players: [],
        createdAt: now,
        updatedAt: now,
      );
      
      final updatedTeam = team.copyWith(
        name: 'Nouveau nom',
        score: 150,
      );
      
      expect(updatedTeam.id, 'team1'); // Inchangé
      expect(updatedTeam.name, 'Nouveau nom'); // Modifié
      expect(updatedTeam.score, 150); // Modifié
      expect(updatedTeam.colorHex, '#F44336'); // Inchangé
    });
    
    test('Team fromJson and toJson should work correctly', () {
      final now = DateTime.now();
      final json = {
        'id': 'team1',
        'name': 'Les Aventuriers',
        'colorHex': '#F44336',
        'score': 120,
        'sessionId': 'session1',
        'players': [],
        'createdAt': now.toIso8601String(),
        'updatedAt': now.toIso8601String(),
      };
      
      final team = Team.fromJson(json);
      
      expect(team.id, 'team1');
      expect(team.name, 'Les Aventuriers');
      expect(team.colorHex, '#F44336');
      expect(team.score, 120);
      
      final serialized = team.toJson();
      
      expect(serialized['id'], 'team1');
      expect(serialized['name'], 'Les Aventuriers');
      expect(serialized['colorHex'], '#F44336');
      expect(serialized['score'], 120);
    });
  });
  
  group('GameSessionStatus Enum Tests', () {
    test('GameSessionStatus values should be correct', () {
      expect(GameSessionStatus.values.length, 4);
      expect(GameSessionStatus.pending.toString(), 'GameSessionStatus.pending');
      expect(GameSessionStatus.active.toString(), 'GameSessionStatus.active');
      expect(GameSessionStatus.completed.toString(), 'GameSessionStatus.completed');
      expect(GameSessionStatus.cancelled.toString(), 'GameSessionStatus.cancelled');
    });
    
    test('GameSessionStatus fromString should work correctly', () {
      expect(GameSessionStatus.fromString('pending'), GameSessionStatus.pending);
      expect(GameSessionStatus.fromString('active'), GameSessionStatus.active);
      expect(GameSessionStatus.fromString('completed'), GameSessionStatus.completed);
      expect(GameSessionStatus.fromString('cancelled'), GameSessionStatus.cancelled);
      expect(GameSessionStatus.fromString('invalid'), GameSessionStatus.pending); // Valeur par défaut
    });
    
    test('GameSessionStatus toString should work correctly', () {
      expect(GameSessionStatus.pending.toString(), 'GameSessionStatus.pending');
      expect(GameSessionStatus.active.toString(), 'GameSessionStatus.active');
      expect(GameSessionStatus.completed.toString(), 'GameSessionStatus.completed');
      expect(GameSessionStatus.cancelled.toString(), 'GameSessionStatus.cancelled');
    });
  });
}
