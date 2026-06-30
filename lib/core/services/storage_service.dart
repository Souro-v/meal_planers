import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }
  // ── Auth
  static Future<void> saveToken(String token) async =>
      await _prefs.setString('auth_token', token);

  static String? getToken() => _prefs.getString('auth_token');

  static Future<void> clearToken() async => await _prefs.remove('auth_token');

  static bool get isLoggedIn => getToken() != null;

  // ── User
  static Future<void> saveUser(Map<String, dynamic> user) async =>
      await _prefs.setString('user', jsonEncode(user));

  static Map<String, dynamic>? getUser() {
    final s = _prefs.getString('user');
    return s != null ? jsonDecode(s) : null;
  }

  static Future<void> clearUser() async => await _prefs.remove('user');

  // ── Favorites ─────────────────────────────
  static Future<void> saveFavoriteIds(List<String> ids) async =>
      await _prefs.setStringList('favorite_ids', ids);

  static List<String> getFavoriteIds() =>
      _prefs.getStringList('favorite_ids') ?? [];

  // ── Grocery List ──────────────────────────
  static Future<void> saveGroceries(String json) async =>
      await _prefs.setString('groceries', json);

  static String? getGroceries() => _prefs.getString('groceries');

  // ── Meal Plan ─────────────────────────────
  static Future<void> saveMealPlan(String json) async =>
      await _prefs.setString('meal_plan', json);

  static String? getMealPlan() => _prefs.getString('meal_plan');

  // ── Preferences ───────────────────────────
  static Future<void> savePreferences(Map<String, dynamic> prefs) async =>
      await _prefs.setString('user_prefs', jsonEncode(prefs));

  static Map<String, dynamic>? getPreferences() {
    final s = _prefs.getString('user_prefs');
    return s != null ? jsonDecode(s) : null;
  }
  // ── Onboarding ────────────────────────────
  static Future<void> setOnboardingDone() async =>
      await _prefs.setBool('onboarding_done', true);

  static bool get isOnboardingDone =>
      _prefs.getBool('onboarding_done') ?? false;

  // ── Clear All ─────────────────────────────
  static Future<void> clearAll() async => await _prefs.clear();
}
