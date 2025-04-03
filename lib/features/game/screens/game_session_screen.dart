import 'package:camping_game_show/features/game/blocs/game_session_bloc.dart';
import 'package:camping_game_show/features/game/models/game_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameSessionScreen extends StatelessWidget {
  const GameSessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameSessionBloc, GameSessionState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => const SizedBox(),
          loading: (_) => const Center(child: CircularProgressIndicator()),
          loaded: (state) => _GameSessionList(sessions: state.sessions),
          error: (state) => Center(child: Text(state.message)),
        );
      },
    );
  }
}

class _GameSessionList extends StatelessWidget {
  final List<GameSession> sessions;

  const _GameSessionList({required this.sessions});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sessions.length,
      itemBuilder: (context, index) {
        final session = sessions[index];
        return _GameSessionCard(session: session);
      },
    );
  }
}

class _GameSessionCard extends StatelessWidget {
  final GameSession session;

  const _GameSessionCard({required this.session});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(session.name),
        subtitle: Text('Teams: ${session.teams.length}'),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            context.read<GameSessionBloc>().add(
                  GameSessionEvent.sessionDeleted(session.id),
                );
          },
        ),
        onTap: () {
          // Navigate to session details
        },
      ),
    );
  }
} 