class AppException implements Exception {
  final int code;
  final String message;

  AppException({required this.code, required this.message});

  Map<String, dynamic> toJson() => {'code': code, 'message': message};

  @override
  String toString() => 'AppException(code: $code, message: $message)';
}
