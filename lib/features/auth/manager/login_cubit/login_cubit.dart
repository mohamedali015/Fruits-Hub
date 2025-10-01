import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/auth/data/repo/auth_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  final AuthRepo authRepo;

  bool obscureText = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Email & Password Login
  void login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    emit(LoginLoadingState());
    var result = await authRepo.loginWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );

    result.fold(
      (error) => emit(LoginFailureState(error)),
      (user) => emit(LoginSuccessState(user)),
    );
  }

  // Google Sign In
  void loginWithGoogle() async {
    emit(LoginLoadingState());
    var result = await authRepo.loginWithGoogle();

    result.fold(
      (error) => emit(LoginFailureState(error)),
      (user) => emit(LoginSuccessState(user)),
    );
  }

  // Facebook Sign In
  void loginWithFacebook() async {
    emit(LoginLoadingState());
    var result = await authRepo.loginWithFacebook();
    result.fold(
      (error) => emit(LoginFailureState(error)),
      (user) => emit(LoginSuccessState(user)),
    );
  }

  // Change Obscure Text
  void changeObscureText() {
    obscureText = !obscureText;
    emit(LoginToggleState());
  }
}
