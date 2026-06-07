import 'package:dio/dio.dart';

class ApiError implements Exception {
  final String message;
  final int? statusCode;
  final dynamic originalError;

  ApiError({
    required this.message,
    this.statusCode,
    this.originalError,
  });

  factory ApiError.fromDioException(DioException e) {
    String message = 'Произошла непредвиденная ошибка';
    int? statusCode = e.response?.statusCode;

    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      message = 'Превышено время ожидания сервера';
    } else if (e.type == DioExceptionType.connectionError) {
      message = 'Нет соединения с интернетом';
    } else if (e.response?.data != null) {
      final data = e.response!.data;

      if (data is Map<String, dynamic>) {
        message = data['error'] ?? 
                  data['auth'] ?? 
                  data['register'] ?? 
                  data['refresh'] ??
                  data['message'] ?? 
                  message;
      }
    } else if (statusCode == 401) {
      message = 'Сессия истекла, войдите снова';
    } else if (statusCode == 403) {
      message = 'Доступ запрещен';
    } else if (statusCode == 404) {
      message = 'Ресурс не найден';
    } else if (statusCode != null && statusCode >= 500) {
      message = 'Ошибка на стороне сервера (500+)';
    }

    return ApiError(
      message: message,
      statusCode: statusCode,
      originalError: e,
    );
  }

  @override
  String toString() => message;
}
