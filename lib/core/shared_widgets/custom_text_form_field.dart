import 'package:flutter/material.dart';

import '../helper/my_responsive.dart';
import '../helper/validator.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import '../utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.type,
    required this.controller,
    this.passController,
    this.obsecure = true,
    this.onSuffixTapped,
  });

  final TextFieldType type;
  final TextEditingController controller;
  final TextEditingController? passController;
  final bool obsecure;
  final void Function()? onSuffixTapped;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case TextFieldType.password:
        return _passwordField(
          context,
          passController == null
              ? Validator.password
              : (value) =>
                  Validator.confirmPassword(value, passController!.text),
        );

      case TextFieldType.email:
        return _emailField(context, Validator.email);

      case TextFieldType.name:
        return _nameField(context, Validator.name);
    }
  }

  ///////////////////////--Decorations//////////////////////
  InputDecoration _inputDecoration(
    BuildContext context, {
    required String label,
    String? hint,
    Widget? suffixIcon,
    Widget? prefixIcon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: AppTextStyles.bold13.copyWith(color: AppColors.gray400),
      labelText: label,
      labelStyle: AppTextStyles.bold13.copyWith(color: AppColors.gray400),
      filled: true,
      fillColor: AppColors.fillColor,
      contentPadding: EdgeInsets.symmetric(
        vertical: MyResponsive.height(value: 20),
        horizontal: MyResponsive.width(value: 10),
      ),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      border: _border(context, AppColors.borderColor),
      focusedErrorBorder: _border(context, AppColors.red),
      focusedBorder: _border(context, AppColors.primary),
      enabledBorder: _border(context, AppColors.borderColor),
      errorBorder: _border(context, AppColors.red),
    );
  }

  TextStyle _textStyle(BuildContext context) {
    return AppTextStyles.semiBold16;
  }

  InputBorder _border(BuildContext context, Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(MyResponsive.radius(value: 4)),
      ),
      borderSide: BorderSide(color: color, width: 1),
    );
  }

  /////////////////////////--TextFields////////////////////////////////
  Widget _nameField(
    BuildContext context,
    String? Function(String?)? validator,
  ) {
    return TextFormField(
      controller: controller,
      style: _textStyle(context),
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.name,
      decoration: _inputDecoration(
        context,
        label: AppStrings.fullName,
        prefixIcon: Icon(
          Icons.person,
          color: AppColors.gray400,
        ),
      ),
    );
  }

  Widget _emailField(
    BuildContext context,
    String? Function(String?)? validator,
  ) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: _textStyle(context),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.emailAddress,
      decoration: _inputDecoration(
        context,
        label: AppStrings.email,
        prefixIcon: Icon(
          Icons.email,
          color: AppColors.gray400,
        ),
      ),
    );
  }

  Widget _passwordField(
    BuildContext context,
    String? Function(String?)? validator,
  ) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: _textStyle(context),
      obscureText: obsecure,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.visiblePassword,
      decoration: _inputDecoration(
        context,
        label: passController == null
            ? AppStrings.password
            : AppStrings.confirmPassword,
        prefixIcon: Icon(Icons.lock, color: AppColors.gray400),
        suffixIcon: IconButton(
          onPressed: onSuffixTapped,
          icon: obsecure
              ? Icon(
                  Icons.visibility,
                  color: AppColors.gray400,
                )
              : Icon(
                  Icons.visibility_off,
                  color: AppColors.gray400,
                ),
        ),
      ),
    );
  }
}

enum TextFieldType { password, email, name }
