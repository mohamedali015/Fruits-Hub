import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/shared_widgets/custom_progress_hud.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:fruits_hub/features/auth/data/repo/auth_repo.dart';
import 'package:fruits_hub/features/auth/manager/login_cubit/login_cubit.dart';
import 'package:fruits_hub/features/auth/manager/login_cubit/login_state.dart';
import 'package:fruits_hub/features/auth/view/widgets/login_view_body.dart';

import '../../../core/helper/get_it.dart';
import '../../../core/helper/my_snackbar.dart';
import '../../../core/shared_widgets/custom_app_bar.dart';
import '../../home/view/home_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: AppStrings.login),
        body: Builder(builder: (context) {
          return BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginFailureState) {
                MySnackbar.error(context, state.errorMessage);
              }
              if (state is LoginSuccessState) {
                MySnackbar.success(context, AppStrings.successLogin);
                // Navigator
                Navigator.pushNamedAndRemoveUntil(
                    context, HomeView.routeName, (route) => false);
              }
            },
            builder: (context, state) {
              return CustomProgressHud(
                isLoading: state is LoginLoadingState ? true : false,
                child: LoginViewBody(),
              );
            },
          );
        }),
      ),
    );
  }
}
