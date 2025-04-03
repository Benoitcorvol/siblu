import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'team.dart';

part 'game_round.freezed.dart';
part 'game_round.g.dart';

@freezed
class GameRound with _$GameRound {
  const factory GameRound({
    required String id,
    required String sessionId,
    @Default(0) int roundNumber,
    @Default(0) int timeRemaining,
    @Default(GameRoundStatus.pending) GameRoundStatus status,
    String? winningTeamId,
    @Default([]) List<TeamScore> teamScores,
    String? challengeType,
    Map<String, dynamic>? challengeData,
    DateTime? startedAt,
    DateTime? endedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _GameRound;

  factory GameRound.fromJson(Map<String, dynamic> json) => _$GameRoundFromJson(json);
}

@freezed
class TeamScore with _$TeamScore {
  const factory TeamScore({
    required String teamId,
    required int score,
    String? reason,
  }) = _TeamScore;

  factory TeamScore.fromJson(Map<String, dynamic> json) => _$TeamScoreFromJson(json);
}

enum GameRoundStatus { pending, active, completed, cancelled }
