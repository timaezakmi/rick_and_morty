import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://rickandmortyapi.com/api",
      headers: {"Content-Type": "application/json"},
      connectTimeout: const Duration(seconds: 10),
    ),
  );

  Dio get dio {
    _dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true),
    );
    return _dio;
  }
}
