import 'package:get/get.dart';
import '../../features/auth/screens/splash_screen.dart';
import '../../features/auth/screens/signup_screen.dart';

class AppRoutes {
  // ── Route Names ──────────────────────────────
  static const splash     = '/';
  static const signup     = '/signup';
  static const login      = '/login';
  static const resetPass  = '/reset-password';
  static const onboarding = '/onboarding';
  static const home       = '/home';

  // ── Pages ────────────────────────────────────
  static final pages = [
    GetPage(name: splash,  page: () => const SplashScreen()),
    GetPage(name: signup,  page: () => const SignUpScreen()),

  ];
}