import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login({
    required String email,
    required String password,
  }) = _Login;

  const factory AuthEvent.logout() = _Logout;

  const factory AuthEvent.offlineLogin() = _OfflineLogin;

  const factory AuthEvent.joinSession({
    required String sessionId,
    required String playerName,
  }) = _JoinSession;
}
