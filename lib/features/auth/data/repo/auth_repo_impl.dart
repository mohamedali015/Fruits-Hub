import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/helper/custom_logger.dart';
import 'package:fruits_hub/features/auth/data/model/user_model.dart';
import 'package:fruits_hub/features/auth/data/repo/auth_repo.dart';

import '../../../../core/network/firebase_auth_service/auth_services.dart';
import '../../../../core/network/firebase_endpoint.dart';
import '../../../../core/network/firebase_response.dart';
import '../../../../core/network/firestore_service/database_service.dart';

class AuthRepoImpl extends AuthRepo {
  final DatabaseService databaseService;
  final AuthService authService;

  AuthRepoImpl({required this.authService, required this.databaseService});

  // Email & Password Register
  @override
  Future<Either<String, UserModel>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    User? credentialUser;
    try {
      credentialUser = await authService.registerWithEmailAndPassword(
          email: email, password: password);
      var user = UserModel.fromFirebaseUser(credentialUser, name: name);
      // Add additional user info
      await addUserData(
        user: user,
      );

      return Right(user);
    } catch (e) {
      await deleteUser(credentialUser);
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
      var credentialUser = await authService.loginWithEmailAndPassword(
        email: email,
        password: password,
      );

      var user = await getUserData(uid: credentialUser.uid);

      return Right(user);
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
    User? credentialUser;
    try {
      credentialUser = await authService.loginWithGoogle();

      var user = UserModel.fromFirebaseUser(credentialUser);

      var isUserExist = await databaseService.isDataExist(
          collectionName: FirebaseEndpoint.isUserExist, docId: user.uId);
      // Add additional user info
      if (isUserExist) {
        await getUserData(uid: user.uId);
      } else {
        await addUserData(user: user);
      }

      return Right(user);
    } catch (e) {
      await deleteUser(credentialUser);
      CustomLogger.red(
          "Exception From AuthRepoImpl.loginWithGoogle: ${e.toString()}");
      String message = FirebaseErrorHandler.getErrorMessage(e);
      return Left(message);
    }
  }

  // Facebook Sign In
  @override
  Future<Either<String, UserModel>> loginWithFacebook() async {
    User? credentialUser;

    try {
      credentialUser = await authService.loginWithFacebook();

      var user = UserModel.fromFirebaseUser(credentialUser);

      var isUserExist = await databaseService.isDataExist(
          collectionName: FirebaseEndpoint.isUserExist, docId: user.uId);
      // Add additional user info
      if (isUserExist) {
        await getUserData(uid: user.uId);
      } else {
        await addUserData(user: user);
      }

      return Right(user);
    } catch (e) {
      await deleteUser(credentialUser);
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

  // Add User Data to Firestore
  @override
  Future addUserData({required UserModel user}) async {
    await databaseService.addData(
      collectionName: FirebaseEndpoint.addUserData,
      data: user.toMap(),
      docId: user.uId,
    );
  }

  // Get User Data from Firestore
  @override
  Future<UserModel> getUserData({required String uid}) async {
    var userDate = await databaseService.getData(
        docId: uid, collectionName: FirebaseEndpoint.getUserData);

    return UserModel.fromJson(userDate);
  }

  Future<void> deleteUser(User? credentialUser) async {
    if (credentialUser != null) {
      await authService.deleteUser();
    }
  }
}
