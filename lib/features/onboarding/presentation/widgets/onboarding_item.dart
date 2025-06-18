import 'package:auvnet_internship_assessment/core/utils/app_images.dart';
import 'package:auvnet_internship_assessment/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/onboarding_model.dart';

class OnboardingItem extends StatelessWidget {
  final OnBoardingModel model;

  const OnboardingItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            height: 336.h,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    Images.onBoarding2,
                    width: 336.w,
                    height: 336.h,
                    fit: BoxFit.contain,
                    alignment: Alignment.topLeft,
                  ),
                ),
                Positioned(
                  left: (screenWidth * 0.1),
                  top: 65.h,
                  child: Image.asset(
                    Images.appLogo,
                    width: 342.w,
                    height: 342.h,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 85.h),
              Text(
                model.title,
                style: CustomTextStyles.Rubik500style28.copyWith(
                  fontSize: 28.sp,
                ),
              ),
              SizedBox(height: 11.h),
              Text(
                model.subTitle,
                style: CustomTextStyles.RubikNormalstyle14.copyWith(
                  fontSize: 14.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 55.h),
            ],
          ),
        ],
      ),
    );
  }
}
