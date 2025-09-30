import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/my_snackbar.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:fruits_hub/features/auth/manager/register_cubit/register_cubit.dart';
import 'package:fruits_hub/features/auth/manager/register_cubit/register_state.dart';
import 'package:fruits_hub/features/auth/view/widgets/register_view_body.dart';

import '../../../core/helper/get_it.dart';
import '../../../core/shared_widgets/custom_app_bar.dart';
import '../../../core/shared_widgets/custom_progress_hud.dart';
import '../data/repo/auth_repo.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  static const String routeName = 'register';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: AppStrings.register),
        body: Builder(builder: (context) {
          return BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state is RegisterFailureState) {
                MySnackbar.error(context, state.message);
              }
              if (state is RegisterSuccessState) {
                MySnackbar.success(context, AppStrings.successRegister);
                // Navigator
              }
            },
            builder: (context, state) {
              return CustomProgressHud(
                isLoading: state is RegisterLoadingState ? true : false,
                child: RegisterViewBody(),
              );
            },
          );
        }),
      ),
    );
  }
}
