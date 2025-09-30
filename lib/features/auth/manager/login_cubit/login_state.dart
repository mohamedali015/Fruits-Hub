import 'package:fruits_hub/features/auth/data/model/user_model.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final UserModel user;

  LoginSuccessState(this.user);
}

class LoginFailureState extends LoginState {
  final String errorMessage;

  LoginFailureState(this.errorMessage);
}

class LoginToggleState extends LoginState {}
