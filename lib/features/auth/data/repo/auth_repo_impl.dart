import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/helper/custom_logger.dart';
import 'package:fruits_hub/features/auth/data/model/user_model.dart';
import 'package:fruits_hub/features/auth/data/repo/auth_repo.dart';

import '../../../../core/network/firebase_response.dart';

class AuthRepoImpl extends AuthRepo {
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
}
