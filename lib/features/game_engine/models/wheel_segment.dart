import 'package:freezed_annotation/freezed_annotation.dart';

part 'wheel_segment.freezed.dart';
part 'wheel_segment.g.dart';

enum WheelSegmentType {
  challenge,
  question,
  mime,
  bonus,
  malus,
  drawing
}

@freezed
class WheelSegment with _$WheelSegment {
  const factory WheelSegment({
    required String id,
    required String name,
    required String description,
    required String color,
    required int points,
    required WheelSegmentType type,
  }) = _WheelSegment;

  factory WheelSegment.fromJson(Map<String, dynamic> json) => _$WheelSegmentFromJson(json);
}
