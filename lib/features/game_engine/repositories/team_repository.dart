import 'package:camping_game_show/features/game_engine/models/team.dart';
import 'package:camping_game_show/features/game_engine/models/player.dart';

abstract class TeamRepository {
  Future<Team> createTeam(TeamCreateParams params);
  Future<Team> updateTeam(String teamId, TeamUpdateParams params);
  Future<void> deleteTeam(String teamId);
  Future<Team> getTeam(String teamId);
  Future<List<Team>> getTeamsBySession(String sessionId);
  Future<void> addPlayerToTeam(String teamId, String playerId);
  Future<void> removePlayerFromTeam(String teamId, String playerId);
  Future<List<Player>> getTeamPlayers(String teamId);
  Stream<Team> getTeamStream(String teamId);
  Stream<List<Team>> getTeamsBySessionStream(String sessionId);
}

class TeamCreateParams {
  final String name;
  final String colorHex;
  final String sessionId;

  TeamCreateParams({
    required this.name,
    required this.colorHex,
    required this.sessionId,
  });
}

class TeamUpdateParams {
  final String? name;
  final String? colorHex;
  final int? score;

  TeamUpdateParams({
    this.name,
    this.colorHex,
    this.score,
  });
}
