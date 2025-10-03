import 'package:fruits_hub/core/network/firestore_service/database_service.dart';
import 'package:fruits_hub/core/network/firestore_service/firestore_service.dart';
import 'package:fruits_hub/features/auth/data/repo/auth_repo.dart';
import 'package:fruits_hub/features/auth/data/repo/auth_repo_impl.dart';
import 'package:get_it/get_it.dart';

import '../network/firebase_auth_service/auth_services.dart';
import '../network/firebase_auth_service/firebase_auth_service.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<AuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FirestoreService());
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
    databaseService: getIt<DatabaseService>(),
    authService: getIt<AuthService>(),
  ));
}
