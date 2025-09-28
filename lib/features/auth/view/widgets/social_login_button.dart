import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper/my_responsive.dart';
import 'package:fruits_hub/core/shared_widgets/svg_wrapper.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.imagePath,
    required this.title,
    this.onPressed,
  });

  final String imagePath;
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: Size(
          double.infinity,
          MyResponsive.height(value: 56),
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.borderColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(MyResponsive.radius(value: 16)),
        ),
      ),
      child: ListTile(
        leading: SvgWrapper(path: imagePath),
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyles.semiBold16,
        ),
      ),
    );
  }
}
