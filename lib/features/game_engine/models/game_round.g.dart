// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_round.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameRoundImpl _$$GameRoundImplFromJson(Map<String, dynamic> json) =>
    _$GameRoundImpl(
      id: json['id'] as String,
      sessionId: json['sessionId'] as String,
      roundNumber: (json['roundNumber'] as num?)?.toInt() ?? 0,
      timeRemaining: (json['timeRemaining'] as num?)?.toInt() ?? 0,
      status: $enumDecodeNullable(_$GameRoundStatusEnumMap, json['status']) ??
          GameRoundStatus.pending,
      winningTeamId: json['winningTeamId'] as String?,
      teamScores: (json['teamScores'] as List<dynamic>?)
              ?.map((e) => TeamScore.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      challengeType: json['challengeType'] as String?,
      challengeData: json['challengeData'] as Map<String, dynamic>?,
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
      endedAt: json['endedAt'] == null
          ? null
          : DateTime.parse(json['endedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$GameRoundImplToJson(_$GameRoundImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sessionId': instance.sessionId,
      'roundNumber': instance.roundNumber,
      'timeRemaining': instance.timeRemaining,
      'status': _$GameRoundStatusEnumMap[instance.status]!,
      'winningTeamId': instance.winningTeamId,
      'teamScores': instance.teamScores,
      'challengeType': instance.challengeType,
      'challengeData': instance.challengeData,
      'startedAt': instance.startedAt?.toIso8601String(),
      'endedAt': instance.endedAt?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$GameRoundStatusEnumMap = {
  GameRoundStatus.pending: 'pending',
  GameRoundStatus.active: 'active',
  GameRoundStatus.completed: 'completed',
  GameRoundStatus.cancelled: 'cancelled',
};

_$TeamScoreImpl _$$TeamScoreImplFromJson(Map<String, dynamic> json) =>
    _$TeamScoreImpl(
      teamId: json['teamId'] as String,
      score: (json['score'] as num).toInt(),
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$$TeamScoreImplToJson(_$TeamScoreImpl instance) =>
    <String, dynamic>{
      'teamId': instance.teamId,
      'score': instance.score,
      'reason': instance.reason,
    };
