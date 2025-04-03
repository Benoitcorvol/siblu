import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'player.freezed.dart';
part 'player.g.dart';

@freezed
class Player with _$Player {
  const factory Player({
    required String id,
    required String userId,
    required String sessionId,
    String? teamId,
    String? displayName,
    String? photoUrl,
    @Default(PlayerStatus.active) PlayerStatus status,
    @Default({}) Map<String, dynamic> metadata,
    required DateTime joinedAt,
    DateTime? lastActiveAt,
  }) = _Player;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}

enum PlayerStatus { active, inactive, spectator }
