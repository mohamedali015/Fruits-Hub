import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper/my_responsive.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../manager/register_cubit/register_cubit.dart';

class TermsAndConditionRow extends StatelessWidget {
  const TermsAndConditionRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    RegisterCubit cubit = RegisterCubit.get(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Transform.scale(
          scale: 1.4,
          child: Checkbox(
            value: cubit.isChecked,
            onChanged: (value) {
              cubit.isCheckedChange();
            },
          ),
        ),
        SizedBox(
          width: MyResponsive.width(value: 16),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: AppStrings.bySigningUp,
                  style: AppTextStyles.semiBold13.copyWith(
                      color: AppColors.gray400,
                      fontFamily: AppConstants.fontFamily),
                ),
                TextSpan(text: "  "),
                TextSpan(
                  text: AppStrings.conditionsAndTerms,
                  style: AppTextStyles.semiBold13.copyWith(
                      color: AppColors.primary,
                      fontFamily: AppConstants.fontFamily),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
              ],
            ),
            // textDirection:
            //     Directionality.of(context),
          ),
        ),
      ],
    );
  }
}
