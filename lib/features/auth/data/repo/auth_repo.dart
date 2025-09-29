import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/features/auth/data/model/user_model.dart';

import '../../../../core/network/firebase_response.dart';

class AuthRepo {
  // Singleton
  AuthRepo._();

  static final AuthRepo _instance = AuthRepo._();

  factory AuthRepo() => _instance;

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
      String message = FirebaseErrorHandler.getErrorMessage(e);
      return Left(message);
    }
  }
}
