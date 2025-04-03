// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GameSession _$GameSessionFromJson(Map<String, dynamic> json) {
  return _GameSession.fromJson(json);
}

/// @nodoc
mixin _$GameSession {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  List<Team> get teams => throw _privateConstructorUsedError;
  GameSettings get settings => throw _privateConstructorUsedError;
  String get gameTemplateType => throw _privateConstructorUsedError;

  /// Serializes this GameSession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GameSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameSessionCopyWith<GameSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameSessionCopyWith<$Res> {
  factory $GameSessionCopyWith(
          GameSession value, $Res Function(GameSession) then) =
      _$GameSessionCopyWithImpl<$Res, GameSession>;
  @useResult
  $Res call(
      {String id,
      String name,
      String status,
      DateTime createdAt,
      List<Team> teams,
      GameSettings settings,
      String gameTemplateType});

  $GameSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class _$GameSessionCopyWithImpl<$Res, $Val extends GameSession>
    implements $GameSessionCopyWith<$Res> {
  _$GameSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
    Object? createdAt = null,
    Object? teams = null,
    Object? settings = null,
    Object? gameTemplateType = null,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      teams: null == teams
          ? _value.teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<Team>,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as GameSettings,
      gameTemplateType: null == gameTemplateType
          ? _value.gameTemplateType
          : gameTemplateType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of GameSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GameSettingsCopyWith<$Res> get settings {
    return $GameSettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GameSessionImplCopyWith<$Res>
    implements $GameSessionCopyWith<$Res> {
  factory _$$GameSessionImplCopyWith(
          _$GameSessionImpl value, $Res Function(_$GameSessionImpl) then) =
      __$$GameSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String status,
      DateTime createdAt,
      List<Team> teams,
      GameSettings settings,
      String gameTemplateType});

  @override
  $GameSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class __$$GameSessionImplCopyWithImpl<$Res>
    extends _$GameSessionCopyWithImpl<$Res, _$GameSessionImpl>
    implements _$$GameSessionImplCopyWith<$Res> {
  __$$GameSessionImplCopyWithImpl(
      _$GameSessionImpl _value, $Res Function(_$GameSessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
    Object? createdAt = null,
    Object? teams = null,
    Object? settings = null,
    Object? gameTemplateType = null,
  }) {
    return _then(_$GameSessionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      teams: null == teams
          ? _value._teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<Team>,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as GameSettings,
      gameTemplateType: null == gameTemplateType
          ? _value.gameTemplateType
          : gameTemplateType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameSessionImpl implements _GameSession {
  const _$GameSessionImpl(
      {required this.id,
      required this.name,
      required this.status,
      required this.createdAt,
      required final List<Team> teams,
      required this.settings,
      required this.gameTemplateType})
      : _teams = teams;

  factory _$GameSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameSessionImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String status;
  @override
  final DateTime createdAt;
  final List<Team> _teams;
  @override
  List<Team> get teams {
    if (_teams is EqualUnmodifiableListView) return _teams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_teams);
  }

  @override
  final GameSettings settings;
  @override
  final String gameTemplateType;

  @override
  String toString() {
    return 'GameSession(id: $id, name: $name, status: $status, createdAt: $createdAt, teams: $teams, settings: $settings, gameTemplateType: $gameTemplateType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameSessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._teams, _teams) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.gameTemplateType, gameTemplateType) ||
                other.gameTemplateType == gameTemplateType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, status, createdAt,
      const DeepCollectionEquality().hash(_teams), settings, gameTemplateType);

  /// Create a copy of GameSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameSessionImplCopyWith<_$GameSessionImpl> get copyWith =>
      __$$GameSessionImplCopyWithImpl<_$GameSessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameSessionImplToJson(
      this,
    );
  }
}

abstract class _GameSession implements GameSession {
  const factory _GameSession(
      {required final String id,
      required final String name,
      required final String status,
      required final DateTime createdAt,
      required final List<Team> teams,
      required final GameSettings settings,
      required final String gameTemplateType}) = _$GameSessionImpl;

  factory _GameSession.fromJson(Map<String, dynamic> json) =
      _$GameSessionImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get status;
  @override
  DateTime get createdAt;
  @override
  List<Team> get teams;
  @override
  GameSettings get settings;
  @override
  String get gameTemplateType;

  /// Create a copy of GameSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameSessionImplCopyWith<_$GameSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Team _$TeamFromJson(Map<String, dynamic> json) {
  return _Team.fromJson(json);
}

/// @nodoc
mixin _$Team {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  List<Player> get players => throw _privateConstructorUsedError;

  /// Serializes this Team to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Team
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TeamCopyWith<Team> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamCopyWith<$Res> {
  factory $TeamCopyWith(Team value, $Res Function(Team) then) =
      _$TeamCopyWithImpl<$Res, Team>;
  @useResult
  $Res call(
      {String id, String name, String color, int score, List<Player> players});
}

/// @nodoc
class _$TeamCopyWithImpl<$Res, $Val extends Team>
    implements $TeamCopyWith<$Res> {
  _$TeamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Team
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
    Object? score = null,
    Object? players = null,
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
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<Player>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TeamImplCopyWith<$Res> implements $TeamCopyWith<$Res> {
  factory _$$TeamImplCopyWith(
          _$TeamImpl value, $Res Function(_$TeamImpl) then) =
      __$$TeamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String name, String color, int score, List<Player> players});
}

/// @nodoc
class __$$TeamImplCopyWithImpl<$Res>
    extends _$TeamCopyWithImpl<$Res, _$TeamImpl>
    implements _$$TeamImplCopyWith<$Res> {
  __$$TeamImplCopyWithImpl(_$TeamImpl _value, $Res Function(_$TeamImpl) _then)
      : super(_value, _then);

  /// Create a copy of Team
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
    Object? score = null,
    Object? players = null,
  }) {
    return _then(_$TeamImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      players: null == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<Player>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeamImpl implements _Team {
  const _$TeamImpl(
      {required this.id,
      required this.name,
      required this.color,
      required this.score,
      required final List<Player> players})
      : _players = players;

  factory _$TeamImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeamImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String color;
  @override
  final int score;
  final List<Player> _players;
  @override
  List<Player> get players {
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  @override
  String toString() {
    return 'Team(id: $id, name: $name, color: $color, score: $score, players: $players)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeamImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.score, score) || other.score == score) &&
            const DeepCollectionEquality().equals(other._players, _players));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, color, score,
      const DeepCollectionEquality().hash(_players));

  /// Create a copy of Team
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TeamImplCopyWith<_$TeamImpl> get copyWith =>
      __$$TeamImplCopyWithImpl<_$TeamImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeamImplToJson(
      this,
    );
  }
}

abstract class _Team implements Team {
  const factory _Team(
      {required final String id,
      required final String name,
      required final String color,
      required final int score,
      required final List<Player> players}) = _$TeamImpl;

  factory _Team.fromJson(Map<String, dynamic> json) = _$TeamImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get color;
  @override
  int get score;
  @override
  List<Player> get players;

  /// Create a copy of Team
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TeamImplCopyWith<_$TeamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Player _$PlayerFromJson(Map<String, dynamic> json) {
  return _Player.fromJson(json);
}

/// @nodoc
mixin _$Player {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get isLeader => throw _privateConstructorUsedError;

  /// Serializes this Player to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlayerCopyWith<Player> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerCopyWith<$Res> {
  factory $PlayerCopyWith(Player value, $Res Function(Player) then) =
      _$PlayerCopyWithImpl<$Res, Player>;
  @useResult
  $Res call({String id, String name, bool isLeader});
}

/// @nodoc
class _$PlayerCopyWithImpl<$Res, $Val extends Player>
    implements $PlayerCopyWith<$Res> {
  _$PlayerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? isLeader = null,
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
      isLeader: null == isLeader
          ? _value.isLeader
          : isLeader // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlayerImplCopyWith<$Res> implements $PlayerCopyWith<$Res> {
  factory _$$PlayerImplCopyWith(
          _$PlayerImpl value, $Res Function(_$PlayerImpl) then) =
      __$$PlayerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, bool isLeader});
}

/// @nodoc
class __$$PlayerImplCopyWithImpl<$Res>
    extends _$PlayerCopyWithImpl<$Res, _$PlayerImpl>
    implements _$$PlayerImplCopyWith<$Res> {
  __$$PlayerImplCopyWithImpl(
      _$PlayerImpl _value, $Res Function(_$PlayerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? isLeader = null,
  }) {
    return _then(_$PlayerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isLeader: null == isLeader
          ? _value.isLeader
          : isLeader // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayerImpl implements _Player {
  const _$PlayerImpl(
      {required this.id, required this.name, required this.isLeader});

  factory _$PlayerImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final bool isLeader;

  @override
  String toString() {
    return 'Player(id: $id, name: $name, isLeader: $isLeader)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isLeader, isLeader) ||
                other.isLeader == isLeader));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, isLeader);

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerImplCopyWith<_$PlayerImpl> get copyWith =>
      __$$PlayerImplCopyWithImpl<_$PlayerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerImplToJson(
      this,
    );
  }
}

abstract class _Player implements Player {
  const factory _Player(
      {required final String id,
      required final String name,
      required final bool isLeader}) = _$PlayerImpl;

  factory _Player.fromJson(Map<String, dynamic> json) = _$PlayerImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  bool get isLeader;

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerImplCopyWith<_$PlayerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GameSettings _$GameSettingsFromJson(Map<String, dynamic> json) {
  return _GameSettings.fromJson(json);
}

/// @nodoc
mixin _$GameSettings {
  int get maxTeams => throw _privateConstructorUsedError;
  int get maxPlayersPerTeam => throw _privateConstructorUsedError;
  int get roundTimeInSeconds => throw _privateConstructorUsedError;
  bool get allowJokers => throw _privateConstructorUsedError;
  int get maxJokersPerTeam => throw _privateConstructorUsedError;

  /// Serializes this GameSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GameSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameSettingsCopyWith<GameSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameSettingsCopyWith<$Res> {
  factory $GameSettingsCopyWith(
          GameSettings value, $Res Function(GameSettings) then) =
      _$GameSettingsCopyWithImpl<$Res, GameSettings>;
  @useResult
  $Res call(
      {int maxTeams,
      int maxPlayersPerTeam,
      int roundTimeInSeconds,
      bool allowJokers,
      int maxJokersPerTeam});
}

/// @nodoc
class _$GameSettingsCopyWithImpl<$Res, $Val extends GameSettings>
    implements $GameSettingsCopyWith<$Res> {
  _$GameSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maxTeams = null,
    Object? maxPlayersPerTeam = null,
    Object? roundTimeInSeconds = null,
    Object? allowJokers = null,
    Object? maxJokersPerTeam = null,
  }) {
    return _then(_value.copyWith(
      maxTeams: null == maxTeams
          ? _value.maxTeams
          : maxTeams // ignore: cast_nullable_to_non_nullable
              as int,
      maxPlayersPerTeam: null == maxPlayersPerTeam
          ? _value.maxPlayersPerTeam
          : maxPlayersPerTeam // ignore: cast_nullable_to_non_nullable
              as int,
      roundTimeInSeconds: null == roundTimeInSeconds
          ? _value.roundTimeInSeconds
          : roundTimeInSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      allowJokers: null == allowJokers
          ? _value.allowJokers
          : allowJokers // ignore: cast_nullable_to_non_nullable
              as bool,
      maxJokersPerTeam: null == maxJokersPerTeam
          ? _value.maxJokersPerTeam
          : maxJokersPerTeam // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameSettingsImplCopyWith<$Res>
    implements $GameSettingsCopyWith<$Res> {
  factory _$$GameSettingsImplCopyWith(
          _$GameSettingsImpl value, $Res Function(_$GameSettingsImpl) then) =
      __$$GameSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int maxTeams,
      int maxPlayersPerTeam,
      int roundTimeInSeconds,
      bool allowJokers,
      int maxJokersPerTeam});
}

/// @nodoc
class __$$GameSettingsImplCopyWithImpl<$Res>
    extends _$GameSettingsCopyWithImpl<$Res, _$GameSettingsImpl>
    implements _$$GameSettingsImplCopyWith<$Res> {
  __$$GameSettingsImplCopyWithImpl(
      _$GameSettingsImpl _value, $Res Function(_$GameSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maxTeams = null,
    Object? maxPlayersPerTeam = null,
    Object? roundTimeInSeconds = null,
    Object? allowJokers = null,
    Object? maxJokersPerTeam = null,
  }) {
    return _then(_$GameSettingsImpl(
      maxTeams: null == maxTeams
          ? _value.maxTeams
          : maxTeams // ignore: cast_nullable_to_non_nullable
              as int,
      maxPlayersPerTeam: null == maxPlayersPerTeam
          ? _value.maxPlayersPerTeam
          : maxPlayersPerTeam // ignore: cast_nullable_to_non_nullable
              as int,
      roundTimeInSeconds: null == roundTimeInSeconds
          ? _value.roundTimeInSeconds
          : roundTimeInSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      allowJokers: null == allowJokers
          ? _value.allowJokers
          : allowJokers // ignore: cast_nullable_to_non_nullable
              as bool,
      maxJokersPerTeam: null == maxJokersPerTeam
          ? _value.maxJokersPerTeam
          : maxJokersPerTeam // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameSettingsImpl implements _GameSettings {
  const _$GameSettingsImpl(
      {required this.maxTeams,
      required this.maxPlayersPerTeam,
      required this.roundTimeInSeconds,
      required this.allowJokers,
      required this.maxJokersPerTeam});

  factory _$GameSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameSettingsImplFromJson(json);

  @override
  final int maxTeams;
  @override
  final int maxPlayersPerTeam;
  @override
  final int roundTimeInSeconds;
  @override
  final bool allowJokers;
  @override
  final int maxJokersPerTeam;

  @override
  String toString() {
    return 'GameSettings(maxTeams: $maxTeams, maxPlayersPerTeam: $maxPlayersPerTeam, roundTimeInSeconds: $roundTimeInSeconds, allowJokers: $allowJokers, maxJokersPerTeam: $maxJokersPerTeam)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameSettingsImpl &&
            (identical(other.maxTeams, maxTeams) ||
                other.maxTeams == maxTeams) &&
            (identical(other.maxPlayersPerTeam, maxPlayersPerTeam) ||
                other.maxPlayersPerTeam == maxPlayersPerTeam) &&
            (identical(other.roundTimeInSeconds, roundTimeInSeconds) ||
                other.roundTimeInSeconds == roundTimeInSeconds) &&
            (identical(other.allowJokers, allowJokers) ||
                other.allowJokers == allowJokers) &&
            (identical(other.maxJokersPerTeam, maxJokersPerTeam) ||
                other.maxJokersPerTeam == maxJokersPerTeam));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, maxTeams, maxPlayersPerTeam,
      roundTimeInSeconds, allowJokers, maxJokersPerTeam);

  /// Create a copy of GameSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameSettingsImplCopyWith<_$GameSettingsImpl> get copyWith =>
      __$$GameSettingsImplCopyWithImpl<_$GameSettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameSettingsImplToJson(
      this,
    );
  }
}

abstract class _GameSettings implements GameSettings {
  const factory _GameSettings(
      {required final int maxTeams,
      required final int maxPlayersPerTeam,
      required final int roundTimeInSeconds,
      required final bool allowJokers,
      required final int maxJokersPerTeam}) = _$GameSettingsImpl;

  factory _GameSettings.fromJson(Map<String, dynamic> json) =
      _$GameSettingsImpl.fromJson;

  @override
  int get maxTeams;
  @override
  int get maxPlayersPerTeam;
  @override
  int get roundTimeInSeconds;
  @override
  bool get allowJokers;
  @override
  int get maxJokersPerTeam;

  /// Create a copy of GameSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameSettingsImplCopyWith<_$GameSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
