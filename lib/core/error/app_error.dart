enum ErrorType {
  network,
  offline,
  authentication,
  server,
  database,
  unknown
}

class AppError implements Exception {
  final String message;
  final ErrorType type;
  final dynamic originalError;
  final StackTrace? stackTrace;
  final String? context;

  const AppError({
    required this.message,
    required this.type,
    this.originalError,
    this.stackTrace,
    this.context,
  });

  bool get isRecoverable => type == ErrorType.network || type == ErrorType.offline;
  
  @override
  String toString() => 'AppError(type: $type, message: $message, context: $context)';
}