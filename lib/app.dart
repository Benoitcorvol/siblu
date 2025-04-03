import 'package:flutter/material.dart';
import 'package:camping_game_show/core/navigation/app_router.dart';
import 'package:camping_game_show/core/config/environment.dart';
import 'package:camping_game_show/core/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:camping_game_show/features/auth/blocs/auth_bloc.dart';
import 'package:camping_game_show/features/game_engine/repositories/session_repository.dart';

class App extends StatelessWidget {
  final Environment environment;

  const App({
    Key? key,
    required this.environment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Définir l'environnement
    EnvironmentConfig.setEnvironment(environment);

    return ProviderScope(
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<SessionRepository>(
            create: (context) => SessionRepository(),
          ),
        ],
        child: BlocProvider(
          create: (context) => AuthBloc(),
          child: MaterialApp.router(
            title: EnvironmentConfig.appName,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.system,
            routerConfig: AppRouter.router,
          ),
        ),
      ),
    );
  }
}
