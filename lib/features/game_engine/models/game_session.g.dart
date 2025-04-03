// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameSessionImpl _$$GameSessionImplFromJson(Map<String, dynamic> json) =>
    _$GameSessionImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      teams: (json['teams'] as List<dynamic>)
          .map((e) => Team.fromJson(e as Map<String, dynamic>))
          .toList(),
      settings: json['settings'] as Map<String, dynamic>,
      status: $enumDecode(_$GameSessionStatusEnumMap, json['status']),
      gameTemplateType: json['gameTemplateType'] as String,
      locationName: json['locationName'] as String?,
      scheduledDate: json['scheduledDate'] == null
          ? null
          : DateTime.parse(json['scheduledDate'] as String),
      history: (json['history'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      currentRound: json['currentRound'] == null
          ? null
          : GameRound.fromJson(json['currentRound'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$GameSessionImplToJson(_$GameSessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'teams': instance.teams,
      'settings': instance.settings,
      'status': _$GameSessionStatusEnumMap[instance.status]!,
      'gameTemplateType': instance.gameTemplateType,
      'locationName': instance.locationName,
      'scheduledDate': instance.scheduledDate?.toIso8601String(),
      'history': instance.history,
      'currentRound': instance.currentRound,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$GameSessionStatusEnumMap = {
  GameSessionStatus.pending: 'pending',
  GameSessionStatus.active: 'active',
  GameSessionStatus.completed: 'completed',
};
