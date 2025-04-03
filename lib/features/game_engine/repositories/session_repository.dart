import 'package:camping_game_show/features/game_engine/models/game_session.dart';
import 'package:camping_game_show/features/game_engine/models/team.dart';

class SessionRepository {
  final List<GameSession> _mockSessions = [
    GameSession(
      id: '1',
      name: 'Soirée Camping des Pins',
      description: 'Session de jeu pour le camping des pins',
      teams: [],
      settings: {
        'maxTeams': 8,
        'maxPlayersPerTeam': 4,
        'timeLimit': 120,
      },
      status: GameSessionStatus.active,
      gameTemplateType: 'standard',
      locationName: 'Camping des Pins',
      scheduledDate: DateTime.now().add(const Duration(days: 1)),
      history: [],
      currentRound: null,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      updatedAt: DateTime.now(),
    ),
    GameSession(
      id: '2',
      name: 'Tournoi du Weekend',
      description: 'Grand tournoi du weekend',
      teams: [],
      settings: {
        'maxTeams': 6,
        'maxPlayersPerTeam': 5,
        'timeLimit': 180,
      },
      status: GameSessionStatus.pending,
      gameTemplateType: 'tournament',
      locationName: 'Espace des Sports',
      scheduledDate: DateTime.now().add(const Duration(days: 3)),
      history: [],
      currentRound: null,
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      updatedAt: DateTime.now(),
    ),
  ];

  Future<List<GameSession>> getAllSessions() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));
    return _mockSessions;
  }

  Future<GameSession?> getSessionById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _mockSessions.firstWhere(
      (session) => session.id == id,
      orElse: () => throw Exception('Session not found'),
    );
  }

  Future<void> createSession(GameSession session) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _mockSessions.add(session);
  }

  Future<void> updateSession(GameSession session) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final index = _mockSessions.indexWhere((s) => s.id == session.id);
    if (index != -1) {
      _mockSessions[index] = session;
    } else {
      throw Exception('Session not found');
    }
  }
}
