import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:camping_game_show/features/admin/screens/admin_login_screen.dart';
import 'package:camping_game_show/features/admin/screens/admin_dashboard_screen.dart';
import 'package:camping_game_show/features/admin/screens/create_session_screen.dart';
import 'package:camping_game_show/features/admin/screens/game_control_screen.dart';
import 'package:camping_game_show/features/admin/screens/teams_management_screen.dart';
import 'package:camping_game_show/features/admin/screens/session_details_screen.dart';
import 'package:camping_game_show/features/player/screens/player_login_screen.dart';
import 'package:camping_game_show/features/player/screens/player_game_screen.dart';
import 'package:camping_game_show/features/game/screens/game_session_form.dart';
import 'package:camping_game_show/features/game/screens/game_session_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      // Routes administrateur
      GoRoute(
        path: '/admin/login',
        builder: (context, state) => const AdminLoginScreen(),
      ),
      GoRoute(
        path: '/admin/dashboard',
        builder: (context, state) => const AdminDashboardScreen(),
      ),
      GoRoute(
        path: '/admin/sessions/create',
        builder: (context, state) => const CreateSessionScreen(),
      ),
      GoRoute(
        path: '/admin/sessions/:sessionId',
        builder: (context, state) {
          final sessionId = state.pathParameters['sessionId']!;
          return SessionDetailsScreen(sessionId: sessionId);
        },
      ),
      GoRoute(
        path: '/admin/sessions/:sessionId/game',
        builder: (context, state) {
          final sessionId = state.pathParameters['sessionId']!;
          return GameControlScreen(sessionId: sessionId);
        },
      ),
      GoRoute(
        path: '/admin/sessions/:sessionId/teams',
        builder: (context, state) {
          final sessionId = state.pathParameters['sessionId']!;
          return TeamsManagementScreen(sessionId: sessionId);
        },
      ),
      GoRoute(
        path: '/admin/forgot-password',
        builder: (context, state) => const Scaffold(
          body: Center(child: Text("Écran de récupération de mot de passe")),
        ),
      ),
      GoRoute(
        path: '/admin/teams',
        builder: (context, state) => const Scaffold(
          body: Center(child: Text("Écran de gestion des équipes")),
        ),
      ),
      GoRoute(
        path: '/admin/teams/:teamId/players',
        builder: (context, state) {
          final teamId = state.pathParameters['teamId']!;
          return Scaffold(
            body: Center(child: Text("Gestion des joueurs de l'équipe $teamId")),
          );
        },
      ),
      GoRoute(
        path: '/admin/history',
        builder: (context, state) => const Scaffold(
          body: Center(child: Text("Historique des jeux")),
        ),
      ),
      GoRoute(
        path: '/admin/settings',
        builder: (context, state) => const Scaffold(
          body: Center(child: Text("Paramètres")),
        ),
      ),
      GoRoute(
        path: '/admin/help',
        builder: (context, state) => const Scaffold(
          body: Center(child: Text("Aide")),
        ),
      ),
      
      // Routes joueur
      GoRoute(
        path: '/player/login',
        builder: (context, state) => const PlayerLoginScreen(),
      ),
      GoRoute(
        path: '/player/game/:sessionId',
        builder: (context, state) {
          final sessionId = state.pathParameters['sessionId']!;
          return PlayerGameScreen(sessionId: sessionId);
        },
        routes: [
          GoRoute(
            path: 'qr',
            builder: (context, state) => const Scaffold(
              body: Center(child: Text('QR Scanner Screen')),
            ),
          ),
          GoRoute(
            path: 'profile/:playerId',
            builder: (context, state) {
              final playerId = state.pathParameters['playerId']!;
              return Scaffold(
                body: Center(child: Text('Player Profile: $playerId')),
              );
            },
          ),
        ],
      ),
      
      // Route par défaut
      GoRoute(
        path: '/',
        redirect: (_, __) => '/admin/login',
      ),
    ],
  );
}
