import 'package:flutter/material.dart';

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
    backgroundColor: AppColors.white,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
}
