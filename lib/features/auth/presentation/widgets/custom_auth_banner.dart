import 'package:auvnet_internship_assessment/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAuthBanner extends StatelessWidget {
  const CustomAuthBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Image.asset(
        Images.appLogo,
        width: screenWidth * 0.6,
        height: 260.h, 
        fit: BoxFit.contain,
      ),
    );
  }
}
