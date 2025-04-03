// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wheel_segment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WheelSegmentImpl _$$WheelSegmentImplFromJson(Map<String, dynamic> json) =>
    _$WheelSegmentImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      color: json['color'] as String,
      points: (json['points'] as num).toInt(),
      type: $enumDecode(_$WheelSegmentTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$WheelSegmentImplToJson(_$WheelSegmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'color': instance.color,
      'points': instance.points,
      'type': _$WheelSegmentTypeEnumMap[instance.type]!,
    };

const _$WheelSegmentTypeEnumMap = {
  WheelSegmentType.challenge: 'challenge',
  WheelSegmentType.question: 'question',
  WheelSegmentType.mime: 'mime',
  WheelSegmentType.bonus: 'bonus',
  WheelSegmentType.malus: 'malus',
  WheelSegmentType.drawing: 'drawing',
};
