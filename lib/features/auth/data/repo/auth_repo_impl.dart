import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_hub/core/helper/custom_logger.dart';
import 'package:fruits_hub/features/auth/data/model/user_model.dart';
import 'package:fruits_hub/features/auth/data/repo/auth_repo.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/network/firebase_response.dart';

class AuthRepoImpl extends AuthRepo {
  // Email & Password Register
  @override
  Future<Either<String, UserModel>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      var credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(UserModel.fromFirebaseUser(credential.user!));
    } catch (e) {
      CustomLogger.red(
          "Exception From AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}");
      String message = FirebaseErrorHandler.getErrorMessage(e);
      return Left(message);
    }
  }

  // Email & Password Login
  @override
  Future<Either<String, UserModel>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(UserModel.fromFirebaseUser(credential.user!));
    } catch (e) {
      CustomLogger.red(
          "Exception From AuthRepoImpl.loginWithEmailAndPassword: ${e.toString()}");
      String message = FirebaseErrorHandler.getErrorMessage(e);
      return Left(message);
    }
  }

  // Google Sign In
  @override
  Future<Either<String, UserModel>> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      var user = await FirebaseAuth.instance.signInWithCredential(credential);

      return Right(UserModel.fromFirebaseUser(user.user!));
    } catch (e) {
      CustomLogger.red(
          "Exception From AuthRepoImpl.loginWithGoogle: ${e.toString()}");
      String message = FirebaseErrorHandler.getErrorMessage(e);
      return Left(message);
    }
  }

  // Facebook Sign In
  @override
  Future<Either<String, UserModel>> loginWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      var user = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);

      return Right(UserModel.fromFirebaseUser(user.user!));
    } catch (e) {
      CustomLogger.red(
          "Exception From AuthRepoImpl.loginWithFacebook: ${e.toString()}");
      String message = FirebaseErrorHandler.getErrorMessage(e);
      return Left(message);
    }
  }

  // Apple Sign In
  @override
  Future<Either<String, UserModel>> loginWithApple() {
    // TODO: implement loginWithGoogle
    throw UnimplementedError();
  }
}
