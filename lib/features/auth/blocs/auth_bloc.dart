import 'package:bloc/bloc.dart';
import 'package:camping_game_show/features/auth/models/user.dart';
import 'package:camping_game_show/features/auth/blocs/auth_event.dart';
import 'package:camping_game_show/features/auth/blocs/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.map(
        login: (event) async {
          emit(const AuthState.loading());
          try {
            // TODO: Implement actual authentication
            final user = User(
              uid: 'admin-${event.email}',
              name: 'Admin User',
              email: event.email,
              isAdmin: true,
              currentSessionId: 'demo-session',
            );
            emit(AuthState.success(user: user));
          } catch (e) {
            emit(AuthState.failure(error: e.toString()));
          }
        },
        logout: (_) async {
          emit(const AuthState.loading());
          await Future.delayed(const Duration(milliseconds: 300));
          emit(const AuthState.initial());
        },
        offlineLogin: (_) async {
          emit(const AuthState.loading());
          await Future.delayed(const Duration(milliseconds: 300));
          final user = User(
            uid: 'offline-admin',
            name: 'Offline Admin',
            email: 'offline@example.com',
            isAdmin: true,
            currentSessionId: 'offline-session',
          );
          emit(AuthState.success(user: user));
        },
        joinSession: (event) async {
          emit(const AuthState.loading());
          try {
            // TODO: Implement actual session joining
            final user = User(
              uid: 'player-${event.playerName}',
              name: event.playerName,
              email: '${event.playerName}@example.com',
              isAdmin: false,
              currentSessionId: event.sessionId,
            );
            emit(AuthState.success(user: user));
          } catch (e) {
            emit(AuthState.failure(error: e.toString()));
          }
        },
      );
    });
  }
}
