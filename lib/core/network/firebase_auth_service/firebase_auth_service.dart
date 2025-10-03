import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_hub/core/helper/custom_logger.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_services.dart';

class FirebaseAuthService implements AuthService {
  @override
  Future<User> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    var credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return credential.user!;
  }

  @override
  Future<User> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    var credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user!;
  }

  @override
  Future<User> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    var user = await FirebaseAuth.instance.signInWithCredential(credential);
    return user.user!;
  }

  @override
  Future<User> loginWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    var user = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);

    return user.user!;
  }

  @override
  Future<User> loginWithApple() {
    // TODO: implement loginWithApple
    throw UnimplementedError();
  }

  @override
  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser?.delete();
  }
}
