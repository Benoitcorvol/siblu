// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerImpl _$$PlayerImplFromJson(Map<String, dynamic> json) => _$PlayerImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      sessionId: json['sessionId'] as String,
      teamId: json['teamId'] as String?,
      displayName: json['displayName'] as String?,
      photoUrl: json['photoUrl'] as String?,
      status: $enumDecodeNullable(_$PlayerStatusEnumMap, json['status']) ??
          PlayerStatus.active,
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
      joinedAt: DateTime.parse(json['joinedAt'] as String),
      lastActiveAt: json['lastActiveAt'] == null
          ? null
          : DateTime.parse(json['lastActiveAt'] as String),
    );

Map<String, dynamic> _$$PlayerImplToJson(_$PlayerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'sessionId': instance.sessionId,
      'teamId': instance.teamId,
      'displayName': instance.displayName,
      'photoUrl': instance.photoUrl,
      'status': _$PlayerStatusEnumMap[instance.status]!,
      'metadata': instance.metadata,
      'joinedAt': instance.joinedAt.toIso8601String(),
      'lastActiveAt': instance.lastActiveAt?.toIso8601String(),
    };

const _$PlayerStatusEnumMap = {
  PlayerStatus.active: 'active',
  PlayerStatus.inactive: 'inactive',
  PlayerStatus.spectator: 'spectator',
};
