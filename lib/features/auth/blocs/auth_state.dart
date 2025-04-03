import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:camping_game_show/features/auth/models/user.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.success({
    required User user,
  }) = _Success;
  const factory AuthState.failure({
    required String error,
  }) = _Failure;
}
