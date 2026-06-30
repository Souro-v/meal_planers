import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../features/auth/screens/forgot_password_screen.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/auth/screens/reset_password_screen.dart';
import '../../features/auth/screens/signup_screen.dart';
import '../../features/auth/screens/splash_screen.dart';
import '../../features/auth/screens/verify_code_screen.dart';
import '../../features/grocerises/screens/add_grocery_screen.dart';
import '../../features/grocerises/screens/shop_online_screen.dart';
import '../../features/home/screens/main_screen.dart';
import '../../features/meals/screens/add_collection_screen.dart';
import '../../features/meals/screens/add_notes_screen.dart';
import '../../features/meals/screens/build_meal_plan_screen.dart';
import '../../features/meals/screens/cooking_mode_screen.dart';
import '../../features/meals/screens/feedback_screen.dart';
import '../../features/meals/screens/meal_detail_screen.dart';
import '../../features/meals/screens/search_screen.dart';
import '../../features/meals/screens/see_all_screen.dart';
import '../../features/meals/screens/select_collections_screen.dart';
import '../../features/meals/screens/vegetarian_screen.dart';
import '../../features/onboarding/screens/onboarding_screen.dart';
import '../../features/onboarding/screens/select_diet_screen.dart';
import '../../features/onboarding/screens/select_allergies_screen.dart';
import '../../features/onboarding/screens/select_dislikes_screen.dart';
import '../../features/onboarding/screens/select_servings_screen.dart';
import '../../features/onboarding/screens/set_reminder_screen.dart';
import '../../features/settings/screens/eating_preferences_screen.dart';
import '../../features/settings/screens/edit_account_screen.dart';
import '../../features/settings/screens/food_waste_screen.dart';
import '../../features/settings/screens/meet_chefs_screen.dart';
import '../../features/settings/screens/settings_screen.dart';
import '../../features/settings/screens/share_mealtime_screen.dart';
import '../../features/settings/screens/upgrade_screen.dart';
import '../../features/settings/screens/your_recipes_screen.dart';

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
  static const buildMealPlan = '/build-meal-plan';
  static const mealDetail = '/meal-detail';
  static const addNotes = '/add-notes';
  static const feedback = '/feedback';
  static const selectCollections = '/select-collections';
  static const addCollection = '/add-collection';
  static const cookingMode = '/cooking-mode';
  static const addGrocery = '/add-grocery';
  static const shopOnline = '/shop-online';
  static const settings = '/settings';
  static const upgrade = '/upgrade';
  static const search = '/search';
  static const seeAll = '/see-all';
  static const editAccount = '/edit-account';
  static const eatingPreferences = '/eating-preferences';
  static const yourRecipes = '/your-recipes';
  static const foodWaste = '/food-waste';
  static const meetChefs = '/meet-chefs';
  static const shareMealtime = '/share-mealtime';
  static const vegetarian = '/vegetarian';
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
    GetPage(name: home, page: () => const MainScreen()),
    GetPage(name: buildMealPlan, page: () => const BuildMealPlanScreen()),
    GetPage(name: mealDetail, page: () => const MealDetailScreen()),
    GetPage(name: addNotes, page: () => const AddNotesScreen()),
    GetPage(name: feedback, page: () => const FeedbackScreen()),
    GetPage(
      name: selectCollections,
      page: () => const SelectCollectionsScreen(),
    ),
    GetPage(name: addCollection, page: () => const AddCollectionScreen()),
    GetPage(name: cookingMode, page: () => const CookingModeScreen()),
    GetPage(name: addGrocery, page: () => const AddGroceryScreen()),
    GetPage(name: shopOnline, page: () => const ShopOnlineScreen()),
    GetPage(name: settings, page: () => const SettingsScreen()),
    GetPage(name: upgrade, page: () => const UpgradeScreen()),
    GetPage(name: search, page: () => const SearchScreen()),
    GetPage(name: seeAll, page: () => const SeeAllScreen()),
    GetPage(name: editAccount, page: () => const EditAccountScreen()),
    GetPage(
      name: eatingPreferences,
      page: () => const EatingPreferencesScreen(),
    ),
    GetPage(name: yourRecipes, page: () => const YourRecipesScreen()),
    GetPage(name: foodWaste, page: () => const FoodWasteScreen()),
    GetPage(name: meetChefs, page: () => const MeetChefsScreen()),
    GetPage(name: shareMealtime, page: () => const ShareMealtimeScreen()),
    GetPage(name: vegetarian, page: () => const VegetarianScreen()),

  ];
}
