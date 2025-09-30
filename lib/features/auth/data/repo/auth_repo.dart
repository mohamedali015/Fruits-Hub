import 'package:dartz/dartz.dart';
import 'package:fruits_hub/features/auth/data/model/user_model.dart';

abstract class AuthRepo {
  Future<Either<String, UserModel>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });

  Future<Either<String, UserModel>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
}
