import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../features/auth/screens/forgot_password_screen.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/auth/screens/reset_password_screen.dart';
import '../../features/auth/screens/signup_screen.dart';
import '../../features/auth/screens/splash_screen.dart';
import '../../features/auth/screens/verify_code_screen.dart';
import '../../features/onboarding/screens/onboarding_screen.dart';
import '../../features/onboarding/screens/select_diet_screen.dart';
import '../../features/onboarding/screens/select_allergies_screen.dart';
import '../../features/onboarding/screens/select_dislikes_screen.dart';
import '../../features/onboarding/screens/select_servings_screen.dart';
import '../../features/onboarding/screens/set_reminder_screen.dart';

class AppRoutes {
  // ── Names ──────────────────────────────────
  static const splash = '/';
  static const signup = '/signup';
  static const login = '/login';
  static const forgotPassword = '/forgot-password';
  static const verifyCode = '/verify-code';
  static const resetPassword = '/reset-password';
  static const onboarding = '/onboarding';
  static const selectDiet = '/select-diet';
  static const selectAllergies = '/select-allergies';
  static const selectDislikes = '/select-dislikes';
  static const selectServings = '/select-servings';
  static const setReminder = '/set-reminder';
  static const home = '/home';

  // ── Pages ──────────────────────────────────
  static final pages = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: signup, page: () => const SignUpScreen()),
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: forgotPassword, page: () => const ForgotPasswordScreen()),
    GetPage(name: verifyCode, page: () => const VerifyCodeScreen()),
    GetPage(name: resetPassword, page: () => const ResetPasswordScreen()),
    GetPage(name: onboarding, page: () => const OnboardingScreen()),
    GetPage(name: selectDiet, page: () => const SelectDietScreen()),
    GetPage(name: selectAllergies, page: () => const SelectAllergiesScreen()),
    GetPage(name: selectDislikes, page: () => const SelectDislikesScreen()),
    GetPage(name: selectServings, page: () => const SelectServingsScreen()),
    GetPage(name: setReminder, page: () => const SetReminderScreen()),
  ];
}
