import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper/my_responsive.dart';
import 'package:fruits_hub/core/shared_widgets/custom_button.dart';
import 'package:fruits_hub/core/shared_widgets/custom_text_form_field.dart';
import 'package:fruits_hub/core/utils/app_assets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_constants.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/auth/view/widgets/do_not_have_account.dart';
import 'package:fruits_hub/features/auth/view/widgets/or_divider.dart';
import 'package:fruits_hub/features/auth/view/widgets/social_login_button.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MyResponsive.paddingSymmetric(
          horizontal: AppConstants.paddingHorizontal),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MyResponsive.height(value: 24),
            ),
            CustomTextFormField(
              type: TextFieldType.email,
              controller: controller,
            ),
            SizedBox(
              height: MyResponsive.height(value: 16),
            ),
            CustomTextFormField(
              type: TextFieldType.password,
              controller: controller,
            ),
            SizedBox(
              height: MyResponsive.height(value: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  AppStrings.forgotPassword,
                  style: AppTextStyles.semiBold13
                      .copyWith(color: AppColors.primary),
                ),
              ],
            ),
            SizedBox(
              height: MyResponsive.height(value: 32),
            ),
            CustomButton(
              title: AppStrings.login,
              onPressed: () {},
            ),
            SizedBox(
              height: MyResponsive.height(value: 32),
            ),
            DoNotHaveAccount(
              question: AppStrings.doNotHaveAccount,
              actionText: AppStrings.makeAnAccount,
              onPressed: () {},
            ),
            SizedBox(
              height: MyResponsive.height(value: 37),
            ),
            OrDivider(),
            SizedBox(
              height: MyResponsive.height(value: 22),
            ),
            SocialLoginButton(
              imagePath: AppAssets.googleLogo,
              title: AppStrings.signWithGoogle,
              onPressed: () {},
            ),
            SizedBox(
              height: MyResponsive.height(value: 16),
            ),
            SocialLoginButton(
              imagePath: AppAssets.appleLogo,
              title: AppStrings.signWithApple,
              onPressed: () {},
            ),
            SizedBox(
              height: MyResponsive.height(value: 16),
            ),
            SocialLoginButton(
              imagePath: AppAssets.facebookLogo,
              title: AppStrings.signWithFacebook,
              onPressed: () {},
            ),
            SizedBox(
              height: MyResponsive.height(value: 60),
            ),
          ],
        ),
      ),
    );
  }
}
