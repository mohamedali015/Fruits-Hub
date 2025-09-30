import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper/my_responsive.dart';
import 'package:fruits_hub/core/shared_widgets/custom_button.dart';
import 'package:fruits_hub/core/shared_widgets/custom_text_form_field.dart';
import 'package:fruits_hub/core/utils/app_constants.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:fruits_hub/features/auth/manager/register_cubit/register_cubit.dart';
import 'package:fruits_hub/features/auth/view/login_view.dart';
import 'package:fruits_hub/features/auth/view/widgets/do_not_have_account.dart';

import 'terms_and_conditions_widget.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterCubit cubit = RegisterCubit.get(context);
    return Padding(
      padding: MyResponsive.paddingSymmetric(
          horizontal: AppConstants.paddingHorizontal),
      child: SingleChildScrollView(
        child: Form(
          key: cubit.formKey,
          child: Column(
            children: [
              SizedBox(
                height: MyResponsive.height(value: 24),
              ),
              CustomTextFormField(
                type: TextFieldType.name,
                controller: cubit.nameController,
              ),
              SizedBox(
                height: MyResponsive.height(value: 16),
              ),
              CustomTextFormField(
                type: TextFieldType.email,
                controller: cubit.emailController,
              ),
              SizedBox(
                height: MyResponsive.height(value: 16),
              ),
              CustomTextFormField(
                type: TextFieldType.password,
                controller: cubit.passwordController,
                obsecure: cubit.obscureText,
                onSuffixTapped: cubit.togglePasswordVisibility,
              ),
              SizedBox(
                height: MyResponsive.height(value: 16),
              ),
              CustomTextFormField(
                type: TextFieldType.password,
                controller: cubit.confirmPasswordController,
                passController: cubit.passwordController,
                obsecure: cubit.obscureConfirmText,
                onSuffixTapped: cubit.toggleConfirmPasswordVisibility,
              ),
              SizedBox(
                height: MyResponsive.height(value: 16),
              ),
              TermsAndConditionRow(),
              SizedBox(
                height: MyResponsive.height(value: 30),
              ),
              CustomButton(
                title: AppStrings.makeNewAccount,
                onPressed: cubit.register,
              ),
              SizedBox(
                height: MyResponsive.height(value: 32),
              ),
              DoNotHaveAccount(
                question: AppStrings.alreadyHaveAccount,
                actionText: AppStrings.login,
                onPressed: () {
                  Navigator.pushNamed(context, LoginView.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
