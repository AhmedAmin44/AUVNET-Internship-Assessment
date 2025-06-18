import 'package:auvnet_internship_assessment/core/utils/app_colors.dart';
import 'package:auvnet_internship_assessment/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOnboardingBotton extends StatelessWidget {
  const CustomOnboardingBotton({
    super.key,
    this.color,
    required this.text,
    required this.onPressed,
  });

  final Color? color;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: screenWidth * 0.78, 
      height: screenHeight * 0.065, 
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.purple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        child: Text(
          text,
          style: CustomTextStyles.Rubik500style28.copyWith(
            fontSize: screenWidth * 0.045, 
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
