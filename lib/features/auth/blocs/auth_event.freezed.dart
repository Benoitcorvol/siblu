// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) login,
    required TResult Function() logout,
    required TResult Function() offlineLogin,
    required TResult Function(String sessionId, String playerName) joinSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? login,
    TResult? Function()? logout,
    TResult? Function()? offlineLogin,
    TResult? Function(String sessionId, String playerName)? joinSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function()? logout,
    TResult Function()? offlineLogin,
    TResult Function(String sessionId, String playerName)? joinSession,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_Logout value) logout,
    required TResult Function(_OfflineLogin value) offlineLogin,
    required TResult Function(_JoinSession value) joinSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_OfflineLogin value)? offlineLogin,
    TResult? Function(_JoinSession value)? joinSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_Logout value)? logout,
    TResult Function(_OfflineLogin value)? offlineLogin,
    TResult Function(_JoinSession value)? joinSession,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoginImplCopyWith<$Res> {
  factory _$$LoginImplCopyWith(
          _$LoginImpl value, $Res Function(_$LoginImpl) then) =
      __$$LoginImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$LoginImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LoginImpl>
    implements _$$LoginImplCopyWith<$Res> {
  __$$LoginImplCopyWithImpl(
      _$LoginImpl _value, $Res Function(_$LoginImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$LoginImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginImpl implements _Login {
  const _$LoginImpl({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.login(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith =>
      __$$LoginImplCopyWithImpl<_$LoginImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) login,
    required TResult Function() logout,
    required TResult Function() offlineLogin,
    required TResult Function(String sessionId, String playerName) joinSession,
  }) {
    return login(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? login,
    TResult? Function()? logout,
    TResult? Function()? offlineLogin,
    TResult? Function(String sessionId, String playerName)? joinSession,
  }) {
    return login?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function()? logout,
    TResult Function()? offlineLogin,
    TResult Function(String sessionId, String playerName)? joinSession,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_Logout value) logout,
    required TResult Function(_OfflineLogin value) offlineLogin,
    required TResult Function(_JoinSession value) joinSession,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_OfflineLogin value)? offlineLogin,
    TResult? Function(_JoinSession value)? joinSession,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_Logout value)? logout,
    TResult Function(_OfflineLogin value)? offlineLogin,
    TResult Function(_JoinSession value)? joinSession,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class _Login implements AuthEvent {
  const factory _Login(
      {required final String email,
      required final String password}) = _$LoginImpl;

  String get email;
  String get password;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogoutImplCopyWith<$Res> {
  factory _$$LogoutImplCopyWith(
          _$LogoutImpl value, $Res Function(_$LogoutImpl) then) =
      __$$LogoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LogoutImpl>
    implements _$$LogoutImplCopyWith<$Res> {
  __$$LogoutImplCopyWithImpl(
      _$LogoutImpl _value, $Res Function(_$LogoutImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LogoutImpl implements _Logout {
  const _$LogoutImpl();

  @override
  String toString() {
    return 'AuthEvent.logout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) login,
    required TResult Function() logout,
    required TResult Function() offlineLogin,
    required TResult Function(String sessionId, String playerName) joinSession,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? login,
    TResult? Function()? logout,
    TResult? Function()? offlineLogin,
    TResult? Function(String sessionId, String playerName)? joinSession,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function()? logout,
    TResult Function()? offlineLogin,
    TResult Function(String sessionId, String playerName)? joinSession,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_Logout value) logout,
    required TResult Function(_OfflineLogin value) offlineLogin,
    required TResult Function(_JoinSession value) joinSession,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_OfflineLogin value)? offlineLogin,
    TResult? Function(_JoinSession value)? joinSession,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_Logout value)? logout,
    TResult Function(_OfflineLogin value)? offlineLogin,
    TResult Function(_JoinSession value)? joinSession,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class _Logout implements AuthEvent {
  const factory _Logout() = _$LogoutImpl;
}

/// @nodoc
abstract class _$$OfflineLoginImplCopyWith<$Res> {
  factory _$$OfflineLoginImplCopyWith(
          _$OfflineLoginImpl value, $Res Function(_$OfflineLoginImpl) then) =
      __$$OfflineLoginImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OfflineLoginImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$OfflineLoginImpl>
    implements _$$OfflineLoginImplCopyWith<$Res> {
  __$$OfflineLoginImplCopyWithImpl(
      _$OfflineLoginImpl _value, $Res Function(_$OfflineLoginImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OfflineLoginImpl implements _OfflineLogin {
  const _$OfflineLoginImpl();

  @override
  String toString() {
    return 'AuthEvent.offlineLogin()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OfflineLoginImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) login,
    required TResult Function() logout,
    required TResult Function() offlineLogin,
    required TResult Function(String sessionId, String playerName) joinSession,
  }) {
    return offlineLogin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? login,
    TResult? Function()? logout,
    TResult? Function()? offlineLogin,
    TResult? Function(String sessionId, String playerName)? joinSession,
  }) {
    return offlineLogin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function()? logout,
    TResult Function()? offlineLogin,
    TResult Function(String sessionId, String playerName)? joinSession,
    required TResult orElse(),
  }) {
    if (offlineLogin != null) {
      return offlineLogin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_Logout value) logout,
    required TResult Function(_OfflineLogin value) offlineLogin,
    required TResult Function(_JoinSession value) joinSession,
  }) {
    return offlineLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_OfflineLogin value)? offlineLogin,
    TResult? Function(_JoinSession value)? joinSession,
  }) {
    return offlineLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_Logout value)? logout,
    TResult Function(_OfflineLogin value)? offlineLogin,
    TResult Function(_JoinSession value)? joinSession,
    required TResult orElse(),
  }) {
    if (offlineLogin != null) {
      return offlineLogin(this);
    }
    return orElse();
  }
}

abstract class _OfflineLogin implements AuthEvent {
  const factory _OfflineLogin() = _$OfflineLoginImpl;
}

/// @nodoc
abstract class _$$JoinSessionImplCopyWith<$Res> {
  factory _$$JoinSessionImplCopyWith(
          _$JoinSessionImpl value, $Res Function(_$JoinSessionImpl) then) =
      __$$JoinSessionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String sessionId, String playerName});
}

/// @nodoc
class __$$JoinSessionImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$JoinSessionImpl>
    implements _$$JoinSessionImplCopyWith<$Res> {
  __$$JoinSessionImplCopyWithImpl(
      _$JoinSessionImpl _value, $Res Function(_$JoinSessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? playerName = null,
  }) {
    return _then(_$JoinSessionImpl(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      playerName: null == playerName
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$JoinSessionImpl implements _JoinSession {
  const _$JoinSessionImpl({required this.sessionId, required this.playerName});

  @override
  final String sessionId;
  @override
  final String playerName;

  @override
  String toString() {
    return 'AuthEvent.joinSession(sessionId: $sessionId, playerName: $playerName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JoinSessionImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.playerName, playerName) ||
                other.playerName == playerName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sessionId, playerName);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JoinSessionImplCopyWith<_$JoinSessionImpl> get copyWith =>
      __$$JoinSessionImplCopyWithImpl<_$JoinSessionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) login,
    required TResult Function() logout,
    required TResult Function() offlineLogin,
    required TResult Function(String sessionId, String playerName) joinSession,
  }) {
    return joinSession(sessionId, playerName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? login,
    TResult? Function()? logout,
    TResult? Function()? offlineLogin,
    TResult? Function(String sessionId, String playerName)? joinSession,
  }) {
    return joinSession?.call(sessionId, playerName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function()? logout,
    TResult Function()? offlineLogin,
    TResult Function(String sessionId, String playerName)? joinSession,
    required TResult orElse(),
  }) {
    if (joinSession != null) {
      return joinSession(sessionId, playerName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_Logout value) logout,
    required TResult Function(_OfflineLogin value) offlineLogin,
    required TResult Function(_JoinSession value) joinSession,
  }) {
    return joinSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_OfflineLogin value)? offlineLogin,
    TResult? Function(_JoinSession value)? joinSession,
  }) {
    return joinSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_Logout value)? logout,
    TResult Function(_OfflineLogin value)? offlineLogin,
    TResult Function(_JoinSession value)? joinSession,
    required TResult orElse(),
  }) {
    if (joinSession != null) {
      return joinSession(this);
    }
    return orElse();
  }
}

abstract class _JoinSession implements AuthEvent {
  const factory _JoinSession(
      {required final String sessionId,
      required final String playerName}) = _$JoinSessionImpl;

  String get sessionId;
  String get playerName;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JoinSessionImplCopyWith<_$JoinSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
