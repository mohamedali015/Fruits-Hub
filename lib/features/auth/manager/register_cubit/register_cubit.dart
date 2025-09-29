import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/auth/data/repo/auth_repo.dart';
import 'package:fruits_hub/features/auth/manager/register_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isChecked = false;
  bool obscureText = true;

  AuthRepo authRepo = AuthRepo();

  void register() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    emit(RegisterLoadingState());
    var result = await authRepo.createUserWithEmailAndPassword(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );

    result.fold(
      (error) => emit(RegisterFailureState(error)),
      (user) => emit(RegisterSuccessState(user)),
    );
  }

  void isCheckedChange() {
    isChecked = !isChecked;
    emit(RegisterToggleState());
  }

  void togglePasswordVisibility() {
    obscureText = !obscureText;
    emit(RegisterToggleState());
  }
}
