import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper/my_responsive.dart';
import 'package:fruits_hub/core/utils/app_assets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.itemFill,
        borderRadius: BorderRadius.circular(MyResponsive.radius(value: 4)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(
                  height: MyResponsive.height(value: 20),
                ),
                Image.asset(
                  AppAssets.watermelon,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: MyResponsive.height(value: 24),
                ),
                ListTile(
                  // contentPadding: EdgeInsets.zero,
                  title: Text(
                    "بطيخ",
                    style: AppTextStyles.semiBold13,
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '20جنية ',
                          style: AppTextStyles.bold13
                              .copyWith(color: AppColors.secondary),
                        ),
                        TextSpan(
                          text: '/',
                          style: AppTextStyles.bold13
                              .copyWith(color: AppColors.lightSecondary),
                        ),
                        TextSpan(
                          text: ' الكيلو',
                          style: AppTextStyles.semiBold13
                              .copyWith(color: AppColors.lightSecondary),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    style: IconButton.styleFrom(
                      // padding: EdgeInsets.zero,
                      fixedSize: Size(
                        MyResponsive.width(value: 36),
                        MyResponsive.height(value: 36),
                      ),
                      shape: CircleBorder(),
                      backgroundColor: AppColors.primary,
                    ),
                    icon: Icon(
                      Icons.add,
                      color: AppColors.white,
                      size: MyResponsive.fontSize(value: 22),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
