import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService {
  Future<User> registerWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<User> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<User> loginWithGoogle();

  Future<User> loginWithFacebook();

  Future<User> loginWithApple();

  Future deleteUser();
}
