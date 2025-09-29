import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:fruits_hub/features/auth/manager/register_cubit/register_cubit.dart';
import 'package:fruits_hub/features/auth/view/widgets/register_view_body.dart';

import '../../../core/shared_widgets/custom_app_bar.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  static const String routeName = 'register';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        appBar: buildAppBar(context, title: AppStrings.register),
        body: RegisterViewBody(),
      ),
    );
  }
}
