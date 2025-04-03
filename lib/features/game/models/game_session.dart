import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_session.freezed.dart';
part 'game_session.g.dart';

@freezed
class GameSession with _$GameSession {
  const factory GameSession({
    required String id,
    required String name,
    required String status,
    required DateTime createdAt,
    required List<Team> teams,
    required GameSettings settings,
    required String gameTemplateType,
  }) = _GameSession;

  factory GameSession.fromJson(Map<String, dynamic> json) =>
      _$GameSessionFromJson(json);
}

@freezed
class Team with _$Team {
  const factory Team({
    required String id,
    required String name,
    required String color,
    required int score,
    required List<Player> players,
  }) = _Team;

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
}

@freezed
class Player with _$Player {
  const factory Player({
    required String id,
    required String name,
    required bool isLeader,
  }) = _Player;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}

@freezed
class GameSettings with _$GameSettings {
  const factory GameSettings({
    required int maxTeams,
    required int maxPlayersPerTeam,
    required int roundTimeInSeconds,
    required bool allowJokers,
    required int maxJokersPerTeam,
  }) = _GameSettings;

  factory GameSettings.fromJson(Map<String, dynamic> json) =>
      _$GameSettingsFromJson(json);
} 