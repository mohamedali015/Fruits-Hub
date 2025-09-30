import 'package:fruits_hub/features/auth/data/repo/auth_repo.dart';
import 'package:fruits_hub/features/auth/data/repo/auth_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl());
}
