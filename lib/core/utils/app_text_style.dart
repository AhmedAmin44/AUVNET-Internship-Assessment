// ignore_for_file: non_constant_identifier_names
import 'package:auvnet_internship_assessment/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class CustomTextStyles {
  static final  Rubik500style28 =  TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontFamily: "Rubik",
  );
  static final RubikNormalstyle14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.grey,
    fontFamily: "Rubik",
  );
 static final MulishNormalstyle14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.grey,
    fontFamily: "Mulish",
  );
  static final  dmSansNstyle14 =  TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.primaryColor,
    fontFamily: "DM Sans",
  );
   static final  dmSansBoldstyle14 =  TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.blue,
    fontFamily: "DM Sans",
  );
   static final  RubikBoldstyle30 =  TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: "Rubik",
  );
}