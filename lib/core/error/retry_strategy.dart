class RetryStrategy {
  final int maxAttempts;
  final Duration initialDelay;
  final Duration maxDelay;
  final double backoffFactor;

  const RetryStrategy({
    this.maxAttempts = 3,
    this.initialDelay = const Duration(seconds: 1),
    this.maxDelay = const Duration(seconds: 10),
    this.backoffFactor = 2.0,
  });

  Duration getDelayForAttempt(int attempt) {
    if (attempt <= 0) return Duration.zero;
    
    final delay = initialDelay.inMilliseconds * (backoffFactor * (attempt - 1));
    return Duration(milliseconds: min(delay.toInt(), maxDelay.inMilliseconds));
  }
}