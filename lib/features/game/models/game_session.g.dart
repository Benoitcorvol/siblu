// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameSessionImpl _$$GameSessionImplFromJson(Map<String, dynamic> json) =>
    _$GameSessionImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      teams: (json['teams'] as List<dynamic>)
          .map((e) => Team.fromJson(e as Map<String, dynamic>))
          .toList(),
      settings: GameSettings.fromJson(json['settings'] as Map<String, dynamic>),
      gameTemplateType: json['gameTemplateType'] as String,
    );

Map<String, dynamic> _$$GameSessionImplToJson(_$GameSessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
      'teams': instance.teams,
      'settings': instance.settings,
      'gameTemplateType': instance.gameTemplateType,
    };

_$TeamImpl _$$TeamImplFromJson(Map<String, dynamic> json) => _$TeamImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      color: json['color'] as String,
      score: (json['score'] as num).toInt(),
      players: (json['players'] as List<dynamic>)
          .map((e) => Player.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TeamImplToJson(_$TeamImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
      'score': instance.score,
      'players': instance.players,
    };

_$PlayerImpl _$$PlayerImplFromJson(Map<String, dynamic> json) => _$PlayerImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      isLeader: json['isLeader'] as bool,
    );

Map<String, dynamic> _$$PlayerImplToJson(_$PlayerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isLeader': instance.isLeader,
    };

_$GameSettingsImpl _$$GameSettingsImplFromJson(Map<String, dynamic> json) =>
    _$GameSettingsImpl(
      maxTeams: (json['maxTeams'] as num).toInt(),
      maxPlayersPerTeam: (json['maxPlayersPerTeam'] as num).toInt(),
      roundTimeInSeconds: (json['roundTimeInSeconds'] as num).toInt(),
      allowJokers: json['allowJokers'] as bool,
      maxJokersPerTeam: (json['maxJokersPerTeam'] as num).toInt(),
    );

Map<String, dynamic> _$$GameSettingsImplToJson(_$GameSettingsImpl instance) =>
    <String, dynamic>{
      'maxTeams': instance.maxTeams,
      'maxPlayersPerTeam': instance.maxPlayersPerTeam,
      'roundTimeInSeconds': instance.roundTimeInSeconds,
      'allowJokers': instance.allowJokers,
      'maxJokersPerTeam': instance.maxJokersPerTeam,
    };
