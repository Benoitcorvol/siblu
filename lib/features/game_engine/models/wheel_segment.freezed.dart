// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wheel_segment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WheelSegment _$WheelSegmentFromJson(Map<String, dynamic> json) {
  return _WheelSegment.fromJson(json);
}

/// @nodoc
mixin _$WheelSegment {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;
  WheelSegmentType get type => throw _privateConstructorUsedError;

  /// Serializes this WheelSegment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WheelSegment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WheelSegmentCopyWith<WheelSegment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WheelSegmentCopyWith<$Res> {
  factory $WheelSegmentCopyWith(
          WheelSegment value, $Res Function(WheelSegment) then) =
      _$WheelSegmentCopyWithImpl<$Res, WheelSegment>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String color,
      int points,
      WheelSegmentType type});
}

/// @nodoc
class _$WheelSegmentCopyWithImpl<$Res, $Val extends WheelSegment>
    implements $WheelSegmentCopyWith<$Res> {
  _$WheelSegmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WheelSegment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? color = null,
    Object? points = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WheelSegmentType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WheelSegmentImplCopyWith<$Res>
    implements $WheelSegmentCopyWith<$Res> {
  factory _$$WheelSegmentImplCopyWith(
          _$WheelSegmentImpl value, $Res Function(_$WheelSegmentImpl) then) =
      __$$WheelSegmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String color,
      int points,
      WheelSegmentType type});
}

/// @nodoc
class __$$WheelSegmentImplCopyWithImpl<$Res>
    extends _$WheelSegmentCopyWithImpl<$Res, _$WheelSegmentImpl>
    implements _$$WheelSegmentImplCopyWith<$Res> {
  __$$WheelSegmentImplCopyWithImpl(
      _$WheelSegmentImpl _value, $Res Function(_$WheelSegmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of WheelSegment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? color = null,
    Object? points = null,
    Object? type = null,
  }) {
    return _then(_$WheelSegmentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WheelSegmentType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WheelSegmentImpl implements _WheelSegment {
  const _$WheelSegmentImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.color,
      required this.points,
      required this.type});

  factory _$WheelSegmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$WheelSegmentImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String color;
  @override
  final int points;
  @override
  final WheelSegmentType type;

  @override
  String toString() {
    return 'WheelSegment(id: $id, name: $name, description: $description, color: $color, points: $points, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WheelSegmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, description, color, points, type);

  /// Create a copy of WheelSegment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WheelSegmentImplCopyWith<_$WheelSegmentImpl> get copyWith =>
      __$$WheelSegmentImplCopyWithImpl<_$WheelSegmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WheelSegmentImplToJson(
      this,
    );
  }
}

abstract class _WheelSegment implements WheelSegment {
  const factory _WheelSegment(
      {required final String id,
      required final String name,
      required final String description,
      required final String color,
      required final int points,
      required final WheelSegmentType type}) = _$WheelSegmentImpl;

  factory _WheelSegment.fromJson(Map<String, dynamic> json) =
      _$WheelSegmentImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get color;
  @override
  int get points;
  @override
  WheelSegmentType get type;

  /// Create a copy of WheelSegment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WheelSegmentImplCopyWith<_$WheelSegmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
