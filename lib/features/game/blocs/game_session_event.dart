part of 'game_session_bloc.dart';

@freezed
class GameSessionEvent with _$GameSessionEvent {
  const factory GameSessionEvent.started() = _Started;
  const factory GameSessionEvent.sessionCreated(GameSession session) = _SessionCreated;
  const factory GameSessionEvent.sessionUpdated(GameSession session) = _SessionUpdated;
  const factory GameSessionEvent.sessionDeleted(String sessionId) = _SessionDeleted;
  const factory GameSessionEvent.sessionsReceived(List<GameSession> sessions) = _SessionsReceived;
} 