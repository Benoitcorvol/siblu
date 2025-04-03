class ErrorHandler {
  final FirebaseCrashlytics _crashlytics;
  final ConnectivityService _connectivity;
  
  Future<T> handleError<T>({
    required Future<T> Function() operation,
    required String context,
    bool retry = true,
  }) async {
    try {
      return await operation();
    } catch (e, stack) {
      if (e is NetworkException && retry) {
        if (!await _connectivity.isConnected()) {
          // Fall back to offline mode
          return await _handleOfflineFallback<T>(operation);
        }
        
        // Retry once after delay
        await Future.delayed(const Duration(seconds: 1));
        return handleError(
          operation: operation,
          context: context,
          retry: false,
        );
      }
      
      // Log error
      await _crashlytics.recordError(e, stack, reason: context);
      
      // Rethrow with context
      throw GameShowException(
        message: 'Operation failed: $context',
        originalError: e,
      );
    }
  }
}