class AppException implements Exception {
  String message;

  AppException({
    required this.message,
  });
}