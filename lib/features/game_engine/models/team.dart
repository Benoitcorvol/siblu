import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:camping_game_show/features/game_engine/models/player.dart';

part 'team.freezed.dart';
part 'team.g.dart';

@freezed
class Team with _$Team {
  const factory Team({
    required String id,
    required String name,
    required String sessionId,
    required List<Player> players,
    @Default(0) int score,
    required String colorHex,
    @Default(0) int playerCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Team;

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
}
