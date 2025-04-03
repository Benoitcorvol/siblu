import 'package:firebase_performance/firebase_performance.dart';

class PerformanceMonitor {
  final FirebasePerformance _performance;

  PerformanceMonitor(this._performance);

  Future<void> startTrace(String name) async {
    final trace = _performance.newTrace(name);
    await trace.start();
  }

  Future<void> stopTrace(String name) async {
    final trace = _performance.newTrace(name);
    await trace.stop();
  }

  Future<void> setAttribute(String name, String attribute, String value) async {
    final trace = _performance.newTrace(name);
    trace.setAttribute(attribute, value);
  }

  Future<void> incrementMetric(String name, String metric, int value) async {
    final trace = _performance.newTrace(name);
    trace.incrementMetric(metric, value);
  }
}