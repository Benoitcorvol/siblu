part of 'game_session_bloc.dart';

@freezed
class GameSessionState with _$GameSessionState {
  const factory GameSessionState.initial() = _Initial;
  const factory GameSessionState.loading() = _Loading;
  const factory GameSessionState.loaded(List<GameSession> sessions) = _Loaded;
  const factory GameSessionState.error(String message) = _Error;
} 