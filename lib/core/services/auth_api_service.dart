import 'api_service.dart';
import 'storage_service.dart';

class AuthApiService {
  // ── Sign Up ───────────────────────────────
  static Future<Map<String, dynamic>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    // TODO: Replace endpoint
    final res = await ApiService.post('/auth/signup', data: {
      'name': name,
      'email': email,
      'password': password,
    });
    await StorageService.saveToken(res.data['token']);
    await StorageService.saveUser(res.data['user']);
    return res.data;
  }

  // ── Login ─────────────────────────────────
  static Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    // TODO: Replace endpoint
    final res = await ApiService.post('/auth/login', data: {
      'email': email,
      'password': password,
    });
    await StorageService.saveToken(res.data['token']);
    await StorageService.saveUser(res.data['user']);
    return res.data;
  }

  // ── Forgot Password ───────────────────────
  static Future<void> forgotPassword(String email) async {
    await ApiService.post('/auth/forgot-password', data: {'email': email});
  }

  // ── Verify OTP ────────────────────────────
  static Future<void> verifyOtp({
    required String email,
    required String otp,
  }) async {
    await ApiService.post('/auth/verify-otp',
        data: {'email': email, 'otp': otp});
  }

  // ── Reset Password ────────────────────────
  static Future<void> resetPassword({
    required String email,
    required String password,
  }) async {
    await ApiService.post('/auth/reset-password',
        data: {'email': email, 'password': password});
  }

  // ── Google Sign In ────────────────────────
  static Future<Map<String, dynamic>> googleSignIn(String idToken) async {
    final res =
        await ApiService.post('/auth/google', data: {'id_token': idToken});
    await StorageService.saveToken(res.data['token']);
    await StorageService.saveUser(res.data['user']);
    return res.data;
  }

  // ── Logout ────────────────────────────────
  static Future<void> logout() async {
    try {
      await ApiService.post('/auth/logout');
    } catch (_) {}
    await StorageService.clearToken();
    await StorageService.clearUser();
  }
}
