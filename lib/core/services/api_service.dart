import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'storage_service.dart';
import '../../app/routes/app_routes.dart';

class ApiService {
  static late Dio _dio;

  // TODO: Replace with your actual base URL
  static const _baseUrl = 'https://api.mealtime.app/v1';

  static void init() {
    _dio = Dio(BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {'Content-Type': 'application/json'},
    ));

    // ── Request Interceptor ──
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final token = StorageService.getToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onError: (error, handler) {
        if (error.response?.statusCode == 401) {
          StorageService.clearToken();
          StorageService.clearUser();
          Get.offAllNamed(AppRoutes.login);
        }
        return handler.next(error);
      },
    ));
  }

  // ── GET ───────────────────────────────────
  static Future<Response> get(
    String path, {
    Map<String, dynamic>? params,
  }) async {
    return await _dio.get(path, queryParameters: params);
  }

  // ── POST ──────────────────────────────────
  static Future<Response> post(
    String path, {
    Map<String, dynamic>? data,
  }) async {
    return await _dio.post(path, data: data);
  }

  // ── PUT ───────────────────────────────────
  static Future<Response> put(
    String path, {
    Map<String, dynamic>? data,
  }) async {
    return await _dio.put(path, data: data);
  }

  // ── DELETE ────────────────────────────────
  static Future<Response> delete(String path) async {
    return await _dio.delete(path);
  }
}
