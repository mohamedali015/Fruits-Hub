import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper/my_responsive.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

AppBar buildAppBar(context, {required String title}) {
  return AppBar(
    title: Text(
      title,
      style: AppTextStyles.bold19,
    ),
    centerTitle: true,
    elevation: 0,
    leadingWidth: MyResponsive.width(value: 72),
    backgroundColor: AppColors.white,
    leading: IconButton(
      style: IconButton.styleFrom(
        shape: CircleBorder(
          side: BorderSide(color: AppColors.borderColor),
        ),
      ),
      icon: const Icon(Icons.arrow_back_ios_sharp),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
}
