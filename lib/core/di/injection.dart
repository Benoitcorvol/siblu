import 'package:camping_game_show/core/services/performance_monitor.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // Firebase services
  getIt.registerSingleton<FirebasePerformance>(FirebasePerformance.instance);
  
  // App services
  getIt.registerSingleton<PerformanceMonitor>(
    PerformanceMonitor(getIt<FirebasePerformance>()),
  );
}