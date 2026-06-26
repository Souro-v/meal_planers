import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'auth_api_service.dart';

class SocialAuthService {

  // ── Google ────────────────────────────────
  static final _google = GoogleSignIn(scopes: ['email', 'profile']);

  static Future<Map<String, dynamic>?> signInWithGoogle() async {
    final account = await _google.signIn();
    if (account == null) return null;

    final auth    = await account.authentication;
    final idToken = auth.idToken;
    if (idToken == null) return null;

    return await AuthApiService.googleSignIn(idToken);
  }

  // ── Facebook ──────────────────────────────
  static Future<Map<String, dynamic>?> signInWithFacebook() async {
    final result = await FacebookAuth.instance.login();
    if (result.status != LoginStatus.success) return null;

    final token = result.accessToken?.tokenString;
    if (token == null) return null;

    // TODO: Send token to your backend
    // return await AuthApiService.facebookSignIn(token);
    return null;
  }
}