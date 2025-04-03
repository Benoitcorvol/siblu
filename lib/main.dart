import 'package:camping_game_show/core/services/performance_monitor.dart';
import 'package:camping_game_show/core/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'core/di/injection.dart';
import 'core/navigation/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  final performance = FirebasePerformance.instance;
  final performanceMonitor = PerformanceMonitor(performance);
  
  configureDependencies();
  
  runApp(MyApp(router: AppRouter()));
}

class MyApp extends StatelessWidget {
  final AppRouter router;
  
  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Camping Game Show',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: router.config(),
    );
  }
}
