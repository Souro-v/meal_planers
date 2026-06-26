import 'package:get/get.dart';
import '../../../core/services/storage_service.dart';
import '../../../app/routes/app_routes.dart';

class AuthStateController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    _checkAuthState();
  }

  Future<void> _checkAuthState() async {
    await Future.delayed(const Duration(milliseconds: 1500));

    if (!StorageService.isLoggedIn) {
      Get.offAllNamed(AppRoutes.login);
      return;
    }

    if (!StorageService.isOnboardingDone) {
      Get.offAllNamed(AppRoutes.onboarding);
      return;
    }

    Get.offAllNamed(AppRoutes.home);
  }

  Future<void> logout() async {
    await StorageService.clearToken();
    await StorageService.clearUser();
    Get.offAllNamed(AppRoutes.login);
  }
}