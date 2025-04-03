import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:camping_game_show/features/game/models/game_session.dart';
import 'package:camping_game_show/features/game/repositories/game_session_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_session_bloc.freezed.dart';
part 'game_session_event.dart';
part 'game_session_state.dart';

class GameSessionBloc extends Bloc<GameSessionEvent, GameSessionState> {
  final GameSessionRepository _repository;
  StreamSubscription<List<GameSession>>? _sessionsSubscription;

  GameSessionBloc({required GameSessionRepository repository})
      : _repository = repository,
        super(const GameSessionState.initial()) {
    on<GameSessionEvent>((event, emit) async {
      await event.map(
        started: (_) async => _onStarted(emit),
        sessionCreated: (e) async => _onSessionCreated(e, emit),
        sessionUpdated: (e) async => _onSessionUpdated(e, emit),
        sessionDeleted: (e) async => _onSessionDeleted(e, emit),
        sessionsReceived: (e) async => _onSessionsReceived(e, emit),
      );
    });
  }

  Future<void> _onStarted(Emitter<GameSessionState> emit) async {
    emit(const GameSessionState.loading());
    _sessionsSubscription?.cancel();
    _sessionsSubscription = _repository.watchActiveSessions().listen(
          (sessions) => add(GameSessionEvent.sessionsReceived(sessions)),
        );
  }

  Future<void> _onSessionCreated(
    _SessionCreated event,
    Emitter<GameSessionState> emit,
  ) async {
    await _repository.createSession(event.session);
  }

  Future<void> _onSessionUpdated(
    _SessionUpdated event,
    Emitter<GameSessionState> emit,
  ) async {
    await _repository.updateSession(event.session);
  }

  Future<void> _onSessionDeleted(
    _SessionDeleted event,
    Emitter<GameSessionState> emit,
  ) async {
    await _repository.deleteSession(event.sessionId);
  }

  Future<void> _onSessionsReceived(
    _SessionsReceived event,
    Emitter<GameSessionState> emit,
  ) async {
    emit(GameSessionState.loaded(event.sessions));
  }

  @override
  Future<void> close() {
    _sessionsSubscription?.cancel();
    return super.close();
  }
} 