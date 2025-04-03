// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_session_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GameSessionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(GameSession session) sessionCreated,
    required TResult Function(GameSession session) sessionUpdated,
    required TResult Function(String sessionId) sessionDeleted,
    required TResult Function(List<GameSession> sessions) sessionsReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(GameSession session)? sessionCreated,
    TResult? Function(GameSession session)? sessionUpdated,
    TResult? Function(String sessionId)? sessionDeleted,
    TResult? Function(List<GameSession> sessions)? sessionsReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(GameSession session)? sessionCreated,
    TResult Function(GameSession session)? sessionUpdated,
    TResult Function(String sessionId)? sessionDeleted,
    TResult Function(List<GameSession> sessions)? sessionsReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SessionCreated value) sessionCreated,
    required TResult Function(_SessionUpdated value) sessionUpdated,
    required TResult Function(_SessionDeleted value) sessionDeleted,
    required TResult Function(_SessionsReceived value) sessionsReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SessionCreated value)? sessionCreated,
    TResult? Function(_SessionUpdated value)? sessionUpdated,
    TResult? Function(_SessionDeleted value)? sessionDeleted,
    TResult? Function(_SessionsReceived value)? sessionsReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SessionCreated value)? sessionCreated,
    TResult Function(_SessionUpdated value)? sessionUpdated,
    TResult Function(_SessionDeleted value)? sessionDeleted,
    TResult Function(_SessionsReceived value)? sessionsReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameSessionEventCopyWith<$Res> {
  factory $GameSessionEventCopyWith(
          GameSessionEvent value, $Res Function(GameSessionEvent) then) =
      _$GameSessionEventCopyWithImpl<$Res, GameSessionEvent>;
}

/// @nodoc
class _$GameSessionEventCopyWithImpl<$Res, $Val extends GameSessionEvent>
    implements $GameSessionEventCopyWith<$Res> {
  _$GameSessionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameSessionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$GameSessionEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameSessionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'GameSessionEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(GameSession session) sessionCreated,
    required TResult Function(GameSession session) sessionUpdated,
    required TResult Function(String sessionId) sessionDeleted,
    required TResult Function(List<GameSession> sessions) sessionsReceived,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(GameSession session)? sessionCreated,
    TResult? Function(GameSession session)? sessionUpdated,
    TResult? Function(String sessionId)? sessionDeleted,
    TResult? Function(List<GameSession> sessions)? sessionsReceived,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(GameSession session)? sessionCreated,
    TResult Function(GameSession session)? sessionUpdated,
    TResult Function(String sessionId)? sessionDeleted,
    TResult Function(List<GameSession> sessions)? sessionsReceived,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SessionCreated value) sessionCreated,
    required TResult Function(_SessionUpdated value) sessionUpdated,
    required TResult Function(_SessionDeleted value) sessionDeleted,
    required TResult Function(_SessionsReceived value) sessionsReceived,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SessionCreated value)? sessionCreated,
    TResult? Function(_SessionUpdated value)? sessionUpdated,
    TResult? Function(_SessionDeleted value)? sessionDeleted,
    TResult? Function(_SessionsReceived value)? sessionsReceived,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SessionCreated value)? sessionCreated,
    TResult Function(_SessionUpdated value)? sessionUpdated,
    TResult Function(_SessionDeleted value)? sessionDeleted,
    TResult Function(_SessionsReceived value)? sessionsReceived,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements GameSessionEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$SessionCreatedImplCopyWith<$Res> {
  factory _$$SessionCreatedImplCopyWith(_$SessionCreatedImpl value,
          $Res Function(_$SessionCreatedImpl) then) =
      __$$SessionCreatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GameSession session});

  $GameSessionCopyWith<$Res> get session;
}

/// @nodoc
class __$$SessionCreatedImplCopyWithImpl<$Res>
    extends _$GameSessionEventCopyWithImpl<$Res, _$SessionCreatedImpl>
    implements _$$SessionCreatedImplCopyWith<$Res> {
  __$$SessionCreatedImplCopyWithImpl(
      _$SessionCreatedImpl _value, $Res Function(_$SessionCreatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session = null,
  }) {
    return _then(_$SessionCreatedImpl(
      null == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as GameSession,
    ));
  }

  /// Create a copy of GameSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GameSessionCopyWith<$Res> get session {
    return $GameSessionCopyWith<$Res>(_value.session, (value) {
      return _then(_value.copyWith(session: value));
    });
  }
}

/// @nodoc

class _$SessionCreatedImpl implements _SessionCreated {
  const _$SessionCreatedImpl(this.session);

  @override
  final GameSession session;

  @override
  String toString() {
    return 'GameSessionEvent.sessionCreated(session: $session)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionCreatedImpl &&
            (identical(other.session, session) || other.session == session));
  }

  @override
  int get hashCode => Object.hash(runtimeType, session);

  /// Create a copy of GameSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionCreatedImplCopyWith<_$SessionCreatedImpl> get copyWith =>
      __$$SessionCreatedImplCopyWithImpl<_$SessionCreatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(GameSession session) sessionCreated,
    required TResult Function(GameSession session) sessionUpdated,
    required TResult Function(String sessionId) sessionDeleted,
    required TResult Function(List<GameSession> sessions) sessionsReceived,
  }) {
    return sessionCreated(session);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(GameSession session)? sessionCreated,
    TResult? Function(GameSession session)? sessionUpdated,
    TResult? Function(String sessionId)? sessionDeleted,
    TResult? Function(List<GameSession> sessions)? sessionsReceived,
  }) {
    return sessionCreated?.call(session);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(GameSession session)? sessionCreated,
    TResult Function(GameSession session)? sessionUpdated,
    TResult Function(String sessionId)? sessionDeleted,
    TResult Function(List<GameSession> sessions)? sessionsReceived,
    required TResult orElse(),
  }) {
    if (sessionCreated != null) {
      return sessionCreated(session);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SessionCreated value) sessionCreated,
    required TResult Function(_SessionUpdated value) sessionUpdated,
    required TResult Function(_SessionDeleted value) sessionDeleted,
    required TResult Function(_SessionsReceived value) sessionsReceived,
  }) {
    return sessionCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SessionCreated value)? sessionCreated,
    TResult? Function(_SessionUpdated value)? sessionUpdated,
    TResult? Function(_SessionDeleted value)? sessionDeleted,
    TResult? Function(_SessionsReceived value)? sessionsReceived,
  }) {
    return sessionCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SessionCreated value)? sessionCreated,
    TResult Function(_SessionUpdated value)? sessionUpdated,
    TResult Function(_SessionDeleted value)? sessionDeleted,
    TResult Function(_SessionsReceived value)? sessionsReceived,
    required TResult orElse(),
  }) {
    if (sessionCreated != null) {
      return sessionCreated(this);
    }
    return orElse();
  }
}

abstract class _SessionCreated implements GameSessionEvent {
  const factory _SessionCreated(final GameSession session) =
      _$SessionCreatedImpl;

  GameSession get session;

  /// Create a copy of GameSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionCreatedImplCopyWith<_$SessionCreatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SessionUpdatedImplCopyWith<$Res> {
  factory _$$SessionUpdatedImplCopyWith(_$SessionUpdatedImpl value,
          $Res Function(_$SessionUpdatedImpl) then) =
      __$$SessionUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GameSession session});

  $GameSessionCopyWith<$Res> get session;
}

/// @nodoc
class __$$SessionUpdatedImplCopyWithImpl<$Res>
    extends _$GameSessionEventCopyWithImpl<$Res, _$SessionUpdatedImpl>
    implements _$$SessionUpdatedImplCopyWith<$Res> {
  __$$SessionUpdatedImplCopyWithImpl(
      _$SessionUpdatedImpl _value, $Res Function(_$SessionUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session = null,
  }) {
    return _then(_$SessionUpdatedImpl(
      null == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as GameSession,
    ));
  }

  /// Create a copy of GameSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GameSessionCopyWith<$Res> get session {
    return $GameSessionCopyWith<$Res>(_value.session, (value) {
      return _then(_value.copyWith(session: value));
    });
  }
}

/// @nodoc

class _$SessionUpdatedImpl implements _SessionUpdated {
  const _$SessionUpdatedImpl(this.session);

  @override
  final GameSession session;

  @override
  String toString() {
    return 'GameSessionEvent.sessionUpdated(session: $session)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionUpdatedImpl &&
            (identical(other.session, session) || other.session == session));
  }

  @override
  int get hashCode => Object.hash(runtimeType, session);

  /// Create a copy of GameSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionUpdatedImplCopyWith<_$SessionUpdatedImpl> get copyWith =>
      __$$SessionUpdatedImplCopyWithImpl<_$SessionUpdatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(GameSession session) sessionCreated,
    required TResult Function(GameSession session) sessionUpdated,
    required TResult Function(String sessionId) sessionDeleted,
    required TResult Function(List<GameSession> sessions) sessionsReceived,
  }) {
    return sessionUpdated(session);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(GameSession session)? sessionCreated,
    TResult? Function(GameSession session)? sessionUpdated,
    TResult? Function(String sessionId)? sessionDeleted,
    TResult? Function(List<GameSession> sessions)? sessionsReceived,
  }) {
    return sessionUpdated?.call(session);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(GameSession session)? sessionCreated,
    TResult Function(GameSession session)? sessionUpdated,
    TResult Function(String sessionId)? sessionDeleted,
    TResult Function(List<GameSession> sessions)? sessionsReceived,
    required TResult orElse(),
  }) {
    if (sessionUpdated != null) {
      return sessionUpdated(session);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SessionCreated value) sessionCreated,
    required TResult Function(_SessionUpdated value) sessionUpdated,
    required TResult Function(_SessionDeleted value) sessionDeleted,
    required TResult Function(_SessionsReceived value) sessionsReceived,
  }) {
    return sessionUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SessionCreated value)? sessionCreated,
    TResult? Function(_SessionUpdated value)? sessionUpdated,
    TResult? Function(_SessionDeleted value)? sessionDeleted,
    TResult? Function(_SessionsReceived value)? sessionsReceived,
  }) {
    return sessionUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SessionCreated value)? sessionCreated,
    TResult Function(_SessionUpdated value)? sessionUpdated,
    TResult Function(_SessionDeleted value)? sessionDeleted,
    TResult Function(_SessionsReceived value)? sessionsReceived,
    required TResult orElse(),
  }) {
    if (sessionUpdated != null) {
      return sessionUpdated(this);
    }
    return orElse();
  }
}

abstract class _SessionUpdated implements GameSessionEvent {
  const factory _SessionUpdated(final GameSession session) =
      _$SessionUpdatedImpl;

  GameSession get session;

  /// Create a copy of GameSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionUpdatedImplCopyWith<_$SessionUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SessionDeletedImplCopyWith<$Res> {
  factory _$$SessionDeletedImplCopyWith(_$SessionDeletedImpl value,
          $Res Function(_$SessionDeletedImpl) then) =
      __$$SessionDeletedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String sessionId});
}

/// @nodoc
class __$$SessionDeletedImplCopyWithImpl<$Res>
    extends _$GameSessionEventCopyWithImpl<$Res, _$SessionDeletedImpl>
    implements _$$SessionDeletedImplCopyWith<$Res> {
  __$$SessionDeletedImplCopyWithImpl(
      _$SessionDeletedImpl _value, $Res Function(_$SessionDeletedImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
  }) {
    return _then(_$SessionDeletedImpl(
      null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SessionDeletedImpl implements _SessionDeleted {
  const _$SessionDeletedImpl(this.sessionId);

  @override
  final String sessionId;

  @override
  String toString() {
    return 'GameSessionEvent.sessionDeleted(sessionId: $sessionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionDeletedImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sessionId);

  /// Create a copy of GameSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionDeletedImplCopyWith<_$SessionDeletedImpl> get copyWith =>
      __$$SessionDeletedImplCopyWithImpl<_$SessionDeletedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(GameSession session) sessionCreated,
    required TResult Function(GameSession session) sessionUpdated,
    required TResult Function(String sessionId) sessionDeleted,
    required TResult Function(List<GameSession> sessions) sessionsReceived,
  }) {
    return sessionDeleted(sessionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(GameSession session)? sessionCreated,
    TResult? Function(GameSession session)? sessionUpdated,
    TResult? Function(String sessionId)? sessionDeleted,
    TResult? Function(List<GameSession> sessions)? sessionsReceived,
  }) {
    return sessionDeleted?.call(sessionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(GameSession session)? sessionCreated,
    TResult Function(GameSession session)? sessionUpdated,
    TResult Function(String sessionId)? sessionDeleted,
    TResult Function(List<GameSession> sessions)? sessionsReceived,
    required TResult orElse(),
  }) {
    if (sessionDeleted != null) {
      return sessionDeleted(sessionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SessionCreated value) sessionCreated,
    required TResult Function(_SessionUpdated value) sessionUpdated,
    required TResult Function(_SessionDeleted value) sessionDeleted,
    required TResult Function(_SessionsReceived value) sessionsReceived,
  }) {
    return sessionDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SessionCreated value)? sessionCreated,
    TResult? Function(_SessionUpdated value)? sessionUpdated,
    TResult? Function(_SessionDeleted value)? sessionDeleted,
    TResult? Function(_SessionsReceived value)? sessionsReceived,
  }) {
    return sessionDeleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SessionCreated value)? sessionCreated,
    TResult Function(_SessionUpdated value)? sessionUpdated,
    TResult Function(_SessionDeleted value)? sessionDeleted,
    TResult Function(_SessionsReceived value)? sessionsReceived,
    required TResult orElse(),
  }) {
    if (sessionDeleted != null) {
      return sessionDeleted(this);
    }
    return orElse();
  }
}

abstract class _SessionDeleted implements GameSessionEvent {
  const factory _SessionDeleted(final String sessionId) = _$SessionDeletedImpl;

  String get sessionId;

  /// Create a copy of GameSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionDeletedImplCopyWith<_$SessionDeletedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SessionsReceivedImplCopyWith<$Res> {
  factory _$$SessionsReceivedImplCopyWith(_$SessionsReceivedImpl value,
          $Res Function(_$SessionsReceivedImpl) then) =
      __$$SessionsReceivedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<GameSession> sessions});
}

/// @nodoc
class __$$SessionsReceivedImplCopyWithImpl<$Res>
    extends _$GameSessionEventCopyWithImpl<$Res, _$SessionsReceivedImpl>
    implements _$$SessionsReceivedImplCopyWith<$Res> {
  __$$SessionsReceivedImplCopyWithImpl(_$SessionsReceivedImpl _value,
      $Res Function(_$SessionsReceivedImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessions = null,
  }) {
    return _then(_$SessionsReceivedImpl(
      null == sessions
          ? _value._sessions
          : sessions // ignore: cast_nullable_to_non_nullable
              as List<GameSession>,
    ));
  }
}

/// @nodoc

class _$SessionsReceivedImpl implements _SessionsReceived {
  const _$SessionsReceivedImpl(final List<GameSession> sessions)
      : _sessions = sessions;

  final List<GameSession> _sessions;
  @override
  List<GameSession> get sessions {
    if (_sessions is EqualUnmodifiableListView) return _sessions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sessions);
  }

  @override
  String toString() {
    return 'GameSessionEvent.sessionsReceived(sessions: $sessions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionsReceivedImpl &&
            const DeepCollectionEquality().equals(other._sessions, _sessions));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_sessions));

  /// Create a copy of GameSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionsReceivedImplCopyWith<_$SessionsReceivedImpl> get copyWith =>
      __$$SessionsReceivedImplCopyWithImpl<_$SessionsReceivedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(GameSession session) sessionCreated,
    required TResult Function(GameSession session) sessionUpdated,
    required TResult Function(String sessionId) sessionDeleted,
    required TResult Function(List<GameSession> sessions) sessionsReceived,
  }) {
    return sessionsReceived(sessions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(GameSession session)? sessionCreated,
    TResult? Function(GameSession session)? sessionUpdated,
    TResult? Function(String sessionId)? sessionDeleted,
    TResult? Function(List<GameSession> sessions)? sessionsReceived,
  }) {
    return sessionsReceived?.call(sessions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(GameSession session)? sessionCreated,
    TResult Function(GameSession session)? sessionUpdated,
    TResult Function(String sessionId)? sessionDeleted,
    TResult Function(List<GameSession> sessions)? sessionsReceived,
    required TResult orElse(),
  }) {
    if (sessionsReceived != null) {
      return sessionsReceived(sessions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SessionCreated value) sessionCreated,
    required TResult Function(_SessionUpdated value) sessionUpdated,
    required TResult Function(_SessionDeleted value) sessionDeleted,
    required TResult Function(_SessionsReceived value) sessionsReceived,
  }) {
    return sessionsReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SessionCreated value)? sessionCreated,
    TResult? Function(_SessionUpdated value)? sessionUpdated,
    TResult? Function(_SessionDeleted value)? sessionDeleted,
    TResult? Function(_SessionsReceived value)? sessionsReceived,
  }) {
    return sessionsReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SessionCreated value)? sessionCreated,
    TResult Function(_SessionUpdated value)? sessionUpdated,
    TResult Function(_SessionDeleted value)? sessionDeleted,
    TResult Function(_SessionsReceived value)? sessionsReceived,
    required TResult orElse(),
  }) {
    if (sessionsReceived != null) {
      return sessionsReceived(this);
    }
    return orElse();
  }
}

abstract class _SessionsReceived implements GameSessionEvent {
  const factory _SessionsReceived(final List<GameSession> sessions) =
      _$SessionsReceivedImpl;

  List<GameSession> get sessions;

  /// Create a copy of GameSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionsReceivedImplCopyWith<_$SessionsReceivedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GameSessionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<GameSession> sessions) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<GameSession> sessions)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<GameSession> sessions)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameSessionStateCopyWith<$Res> {
  factory $GameSessionStateCopyWith(
          GameSessionState value, $Res Function(GameSessionState) then) =
      _$GameSessionStateCopyWithImpl<$Res, GameSessionState>;
}

/// @nodoc
class _$GameSessionStateCopyWithImpl<$Res, $Val extends GameSessionState>
    implements $GameSessionStateCopyWith<$Res> {
  _$GameSessionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameSessionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$GameSessionStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameSessionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'GameSessionState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<GameSession> sessions) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<GameSession> sessions)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<GameSession> sessions)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements GameSessionState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$GameSessionStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameSessionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'GameSessionState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<GameSession> sessions) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<GameSession> sessions)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<GameSession> sessions)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements GameSessionState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<GameSession> sessions});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$GameSessionStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameSessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessions = null,
  }) {
    return _then(_$LoadedImpl(
      null == sessions
          ? _value._sessions
          : sessions // ignore: cast_nullable_to_non_nullable
              as List<GameSession>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(final List<GameSession> sessions) : _sessions = sessions;

  final List<GameSession> _sessions;
  @override
  List<GameSession> get sessions {
    if (_sessions is EqualUnmodifiableListView) return _sessions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sessions);
  }

  @override
  String toString() {
    return 'GameSessionState.loaded(sessions: $sessions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._sessions, _sessions));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_sessions));

  /// Create a copy of GameSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<GameSession> sessions) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(sessions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<GameSession> sessions)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(sessions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<GameSession> sessions)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(sessions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements GameSessionState {
  const factory _Loaded(final List<GameSession> sessions) = _$LoadedImpl;

  List<GameSession> get sessions;

  /// Create a copy of GameSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$GameSessionStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameSessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'GameSessionState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of GameSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<GameSession> sessions) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<GameSession> sessions)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<GameSession> sessions)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements GameSessionState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of GameSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
