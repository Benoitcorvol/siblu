import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:camping_game_show/features/game_engine/models/team.dart';
import 'package:camping_game_show/features/game_engine/models/game_round.dart';

part 'game_session.freezed.dart';
part 'game_session.g.dart';

enum GameSessionStatus {
  pending,
  active,
  completed
}

@freezed
class GameSession with _$GameSession {
  const factory GameSession({
    required String id,
    required String name,
    String? description,
    required List<Team> teams,
    required Map<String, dynamic> settings,
    required GameSessionStatus status,
    required String gameTemplateType,
    String? locationName,
    DateTime? scheduledDate,
    @Default([]) List<Map<String, dynamic>> history,
    GameRound? currentRound,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _GameSession;

  factory GameSession.fromJson(Map<String, dynamic> json) =>
      _$GameSessionFromJson(json);
}
