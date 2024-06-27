class ApiException implements Exception {
  final String message;
  final String serviceName;
  final dynamic cause;

  ApiException({
    required this.message,
    required this.cause,
    required this.serviceName,
  });

  @override
  String toString() {
    return 'ApiException - [$serviceName]: $message\nCause: $cause';
  }
}
