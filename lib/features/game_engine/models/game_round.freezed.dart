// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_round.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GameRound _$GameRoundFromJson(Map<String, dynamic> json) {
  return _GameRound.fromJson(json);
}

/// @nodoc
mixin _$GameRound {
  String get id => throw _privateConstructorUsedError;
  String get sessionId => throw _privateConstructorUsedError;
  int get roundNumber => throw _privateConstructorUsedError;
  int get timeRemaining => throw _privateConstructorUsedError;
  GameRoundStatus get status => throw _privateConstructorUsedError;
  String? get winningTeamId => throw _privateConstructorUsedError;
  List<TeamScore> get teamScores => throw _privateConstructorUsedError;
  String? get challengeType => throw _privateConstructorUsedError;
  Map<String, dynamic>? get challengeData => throw _privateConstructorUsedError;
  DateTime? get startedAt => throw _privateConstructorUsedError;
  DateTime? get endedAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this GameRound to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GameRound
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameRoundCopyWith<GameRound> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameRoundCopyWith<$Res> {
  factory $GameRoundCopyWith(GameRound value, $Res Function(GameRound) then) =
      _$GameRoundCopyWithImpl<$Res, GameRound>;
  @useResult
  $Res call(
      {String id,
      String sessionId,
      int roundNumber,
      int timeRemaining,
      GameRoundStatus status,
      String? winningTeamId,
      List<TeamScore> teamScores,
      String? challengeType,
      Map<String, dynamic>? challengeData,
      DateTime? startedAt,
      DateTime? endedAt,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$GameRoundCopyWithImpl<$Res, $Val extends GameRound>
    implements $GameRoundCopyWith<$Res> {
  _$GameRoundCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameRound
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionId = null,
    Object? roundNumber = null,
    Object? timeRemaining = null,
    Object? status = null,
    Object? winningTeamId = freezed,
    Object? teamScores = null,
    Object? challengeType = freezed,
    Object? challengeData = freezed,
    Object? startedAt = freezed,
    Object? endedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      roundNumber: null == roundNumber
          ? _value.roundNumber
          : roundNumber // ignore: cast_nullable_to_non_nullable
              as int,
      timeRemaining: null == timeRemaining
          ? _value.timeRemaining
          : timeRemaining // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameRoundStatus,
      winningTeamId: freezed == winningTeamId
          ? _value.winningTeamId
          : winningTeamId // ignore: cast_nullable_to_non_nullable
              as String?,
      teamScores: null == teamScores
          ? _value.teamScores
          : teamScores // ignore: cast_nullable_to_non_nullable
              as List<TeamScore>,
      challengeType: freezed == challengeType
          ? _value.challengeType
          : challengeType // ignore: cast_nullable_to_non_nullable
              as String?,
      challengeData: freezed == challengeData
          ? _value.challengeData
          : challengeData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endedAt: freezed == endedAt
          ? _value.endedAt
          : endedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameRoundImplCopyWith<$Res>
    implements $GameRoundCopyWith<$Res> {
  factory _$$GameRoundImplCopyWith(
          _$GameRoundImpl value, $Res Function(_$GameRoundImpl) then) =
      __$$GameRoundImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String sessionId,
      int roundNumber,
      int timeRemaining,
      GameRoundStatus status,
      String? winningTeamId,
      List<TeamScore> teamScores,
      String? challengeType,
      Map<String, dynamic>? challengeData,
      DateTime? startedAt,
      DateTime? endedAt,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$GameRoundImplCopyWithImpl<$Res>
    extends _$GameRoundCopyWithImpl<$Res, _$GameRoundImpl>
    implements _$$GameRoundImplCopyWith<$Res> {
  __$$GameRoundImplCopyWithImpl(
      _$GameRoundImpl _value, $Res Function(_$GameRoundImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameRound
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionId = null,
    Object? roundNumber = null,
    Object? timeRemaining = null,
    Object? status = null,
    Object? winningTeamId = freezed,
    Object? teamScores = null,
    Object? challengeType = freezed,
    Object? challengeData = freezed,
    Object? startedAt = freezed,
    Object? endedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$GameRoundImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      roundNumber: null == roundNumber
          ? _value.roundNumber
          : roundNumber // ignore: cast_nullable_to_non_nullable
              as int,
      timeRemaining: null == timeRemaining
          ? _value.timeRemaining
          : timeRemaining // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameRoundStatus,
      winningTeamId: freezed == winningTeamId
          ? _value.winningTeamId
          : winningTeamId // ignore: cast_nullable_to_non_nullable
              as String?,
      teamScores: null == teamScores
          ? _value._teamScores
          : teamScores // ignore: cast_nullable_to_non_nullable
              as List<TeamScore>,
      challengeType: freezed == challengeType
          ? _value.challengeType
          : challengeType // ignore: cast_nullable_to_non_nullable
              as String?,
      challengeData: freezed == challengeData
          ? _value._challengeData
          : challengeData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endedAt: freezed == endedAt
          ? _value.endedAt
          : endedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameRoundImpl implements _GameRound {
  const _$GameRoundImpl(
      {required this.id,
      required this.sessionId,
      this.roundNumber = 0,
      this.timeRemaining = 0,
      this.status = GameRoundStatus.pending,
      this.winningTeamId,
      final List<TeamScore> teamScores = const [],
      this.challengeType,
      final Map<String, dynamic>? challengeData,
      this.startedAt,
      this.endedAt,
      required this.createdAt,
      required this.updatedAt})
      : _teamScores = teamScores,
        _challengeData = challengeData;

  factory _$GameRoundImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameRoundImplFromJson(json);

  @override
  final String id;
  @override
  final String sessionId;
  @override
  @JsonKey()
  final int roundNumber;
  @override
  @JsonKey()
  final int timeRemaining;
  @override
  @JsonKey()
  final GameRoundStatus status;
  @override
  final String? winningTeamId;
  final List<TeamScore> _teamScores;
  @override
  @JsonKey()
  List<TeamScore> get teamScores {
    if (_teamScores is EqualUnmodifiableListView) return _teamScores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_teamScores);
  }

  @override
  final String? challengeType;
  final Map<String, dynamic>? _challengeData;
  @override
  Map<String, dynamic>? get challengeData {
    final value = _challengeData;
    if (value == null) return null;
    if (_challengeData is EqualUnmodifiableMapView) return _challengeData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final DateTime? startedAt;
  @override
  final DateTime? endedAt;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'GameRound(id: $id, sessionId: $sessionId, roundNumber: $roundNumber, timeRemaining: $timeRemaining, status: $status, winningTeamId: $winningTeamId, teamScores: $teamScores, challengeType: $challengeType, challengeData: $challengeData, startedAt: $startedAt, endedAt: $endedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameRoundImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.roundNumber, roundNumber) ||
                other.roundNumber == roundNumber) &&
            (identical(other.timeRemaining, timeRemaining) ||
                other.timeRemaining == timeRemaining) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.winningTeamId, winningTeamId) ||
                other.winningTeamId == winningTeamId) &&
            const DeepCollectionEquality()
                .equals(other._teamScores, _teamScores) &&
            (identical(other.challengeType, challengeType) ||
                other.challengeType == challengeType) &&
            const DeepCollectionEquality()
                .equals(other._challengeData, _challengeData) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.endedAt, endedAt) || other.endedAt == endedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      sessionId,
      roundNumber,
      timeRemaining,
      status,
      winningTeamId,
      const DeepCollectionEquality().hash(_teamScores),
      challengeType,
      const DeepCollectionEquality().hash(_challengeData),
      startedAt,
      endedAt,
      createdAt,
      updatedAt);

  /// Create a copy of GameRound
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameRoundImplCopyWith<_$GameRoundImpl> get copyWith =>
      __$$GameRoundImplCopyWithImpl<_$GameRoundImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameRoundImplToJson(
      this,
    );
  }
}

abstract class _GameRound implements GameRound {
  const factory _GameRound(
      {required final String id,
      required final String sessionId,
      final int roundNumber,
      final int timeRemaining,
      final GameRoundStatus status,
      final String? winningTeamId,
      final List<TeamScore> teamScores,
      final String? challengeType,
      final Map<String, dynamic>? challengeData,
      final DateTime? startedAt,
      final DateTime? endedAt,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$GameRoundImpl;

  factory _GameRound.fromJson(Map<String, dynamic> json) =
      _$GameRoundImpl.fromJson;

  @override
  String get id;
  @override
  String get sessionId;
  @override
  int get roundNumber;
  @override
  int get timeRemaining;
  @override
  GameRoundStatus get status;
  @override
  String? get winningTeamId;
  @override
  List<TeamScore> get teamScores;
  @override
  String? get challengeType;
  @override
  Map<String, dynamic>? get challengeData;
  @override
  DateTime? get startedAt;
  @override
  DateTime? get endedAt;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of GameRound
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameRoundImplCopyWith<_$GameRoundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TeamScore _$TeamScoreFromJson(Map<String, dynamic> json) {
  return _TeamScore.fromJson(json);
}

/// @nodoc
mixin _$TeamScore {
  String get teamId => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;

  /// Serializes this TeamScore to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TeamScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TeamScoreCopyWith<TeamScore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamScoreCopyWith<$Res> {
  factory $TeamScoreCopyWith(TeamScore value, $Res Function(TeamScore) then) =
      _$TeamScoreCopyWithImpl<$Res, TeamScore>;
  @useResult
  $Res call({String teamId, int score, String? reason});
}

/// @nodoc
class _$TeamScoreCopyWithImpl<$Res, $Val extends TeamScore>
    implements $TeamScoreCopyWith<$Res> {
  _$TeamScoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TeamScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teamId = null,
    Object? score = null,
    Object? reason = freezed,
  }) {
    return _then(_value.copyWith(
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TeamScoreImplCopyWith<$Res>
    implements $TeamScoreCopyWith<$Res> {
  factory _$$TeamScoreImplCopyWith(
          _$TeamScoreImpl value, $Res Function(_$TeamScoreImpl) then) =
      __$$TeamScoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String teamId, int score, String? reason});
}

/// @nodoc
class __$$TeamScoreImplCopyWithImpl<$Res>
    extends _$TeamScoreCopyWithImpl<$Res, _$TeamScoreImpl>
    implements _$$TeamScoreImplCopyWith<$Res> {
  __$$TeamScoreImplCopyWithImpl(
      _$TeamScoreImpl _value, $Res Function(_$TeamScoreImpl) _then)
      : super(_value, _then);

  /// Create a copy of TeamScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teamId = null,
    Object? score = null,
    Object? reason = freezed,
  }) {
    return _then(_$TeamScoreImpl(
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeamScoreImpl implements _TeamScore {
  const _$TeamScoreImpl(
      {required this.teamId, required this.score, this.reason});

  factory _$TeamScoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeamScoreImplFromJson(json);

  @override
  final String teamId;
  @override
  final int score;
  @override
  final String? reason;

  @override
  String toString() {
    return 'TeamScore(teamId: $teamId, score: $score, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeamScoreImpl &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, teamId, score, reason);

  /// Create a copy of TeamScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TeamScoreImplCopyWith<_$TeamScoreImpl> get copyWith =>
      __$$TeamScoreImplCopyWithImpl<_$TeamScoreImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeamScoreImplToJson(
      this,
    );
  }
}

abstract class _TeamScore implements TeamScore {
  const factory _TeamScore(
      {required final String teamId,
      required final int score,
      final String? reason}) = _$TeamScoreImpl;

  factory _TeamScore.fromJson(Map<String, dynamic> json) =
      _$TeamScoreImpl.fromJson;

  @override
  String get teamId;
  @override
  int get score;
  @override
  String? get reason;

  /// Create a copy of TeamScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TeamScoreImplCopyWith<_$TeamScoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
