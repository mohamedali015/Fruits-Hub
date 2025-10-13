import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper/my_responsive.dart';
import 'package:fruits_hub/core/shared_widgets/svg_wrapper.dart';
import 'package:fruits_hub/core/utils/app_assets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class HomeSlider extends StatelessWidget {
  HomeSlider({super.key});

  final List<String> sliderImages = [
    AppAssets.testImage,
    AppAssets.testImage,
    AppAssets.testImage,
    AppAssets.testImage,
    AppAssets.testImage,
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MyResponsive.height(value: 158),
        autoPlay: true,
        viewportFraction: 1,
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
      ),
      items: sliderImages.map((imagePath) {
        return SliderWidget(
          imagePath: imagePath,
        );
      }).toList(),
    );
  }
}

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MyResponsive.width(value: 340),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Image.asset(
            imagePath,
            width: MyResponsive.width(value: 340),
            height: MyResponsive.height(value: 158),
            fit: BoxFit.fill,
          ),
          Container(
            width: MyResponsive.width(value: 170),
            height: MyResponsive.height(value: 158),
            padding: MyResponsive.paddingSymmetric(horizontal: 25),
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(MyResponsive.radius(value: 4)),
              image: DecorationImage(
                image: SvgWrapper.provider(AppAssets.featuredItemBackground),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.eidOffers,
                  style:
                      AppTextStyles.regular13.copyWith(color: AppColors.white),
                ),
                SizedBox(
                  height: MyResponsive.height(value: 8),
                ),
                Text(
                  AppStrings.discount,
                  style: AppTextStyles.bold19.copyWith(color: AppColors.white),
                ),
                SizedBox(
                  height: MyResponsive.height(value: 8),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: MyResponsive.paddingSymmetric(
                      horizontal: 25,
                      vertical: 4,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(MyResponsive.radius(value: 4)),
                    ),
                  ),
                  child: Text(
                    AppStrings.shopNow,
                    style: AppTextStyles.semiBold13
                        .copyWith(color: AppColors.primary),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
