import 'package:fruits_hub/features/auth/data/model/user_model.dart';

class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  final UserModel userModel;

  RegisterSuccessState(this.userModel);
}

class RegisterFailureState extends RegisterState {
  final String message;

  RegisterFailureState(this.message);
}

class RegisterToggleState extends RegisterState {}
