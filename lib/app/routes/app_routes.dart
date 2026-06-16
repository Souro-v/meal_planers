import 'package:get/get.dart';
import '../../features/auth/screens/splash_screen.dart';
import '../../features/auth/screens/signup_screen.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/auth/screens/forgot_password_screen.dart';
import '../../features/auth/screens/verify_code_screen.dart';
import '../../features/auth/screens/reset_password_screen.dart';

class AppRoutes {
  // ── Names ─────────────────────────────────────
  static const splash         = '/';
  static const signup         = '/signup';
  static const login          = '/login';
  static const forgotPassword = '/forgot-password';
  static const verifyCode     = '/verify-code';
  static const resetPassword  = '/reset-password';
  static const onboarding     = '/onboarding';
  static const home           = '/home';

  // ── Pages ─────────────────────────────────────
  static final pages = [
    GetPage(name: splash,         page: () => const SplashScreen()),
    GetPage(name: signup,         page: () => const SignUpScreen()),
    GetPage(name: login,          page: () => const LoginScreen()),
    GetPage(name: forgotPassword, page: () => const ForgotPasswordScreen()),
    GetPage(name: verifyCode,     page: () => const VerifyCodeScreen()),
    GetPage(name: resetPassword,  page: () => const ResetPasswordScreen()),
  ];
}