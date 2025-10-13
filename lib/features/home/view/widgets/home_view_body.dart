import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper/my_responsive.dart';
import 'package:fruits_hub/core/shared_widgets/custom_text_form_field.dart';
import 'package:fruits_hub/core/utils/app_constants.dart';
import 'package:fruits_hub/features/home/view/widgets/home_slider.dart';

import 'custom_home_appbar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MyResponsive.height(value: 40),
        ),
        const CustomHomeAppbar(),
        SizedBox(
          height: MyResponsive.height(value: 16),
        ),
        Padding(
          padding: MyResponsive.paddingSymmetric(
              horizontal: AppConstants.paddingHorizontal),
          child: CustomTextFormField(
            type: TextFieldType.search,
            onChanged: (value) {},
          ),
        ),
        SizedBox(
          height: MyResponsive.height(value: 16),
        ),
        HomeSlider()
      ],
    );
  }
}
