import 'package:auvnet_internship_assessment/core/utils/app_colors.dart';
import 'package:auvnet_internship_assessment/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFField extends StatelessWidget {
  final String labelText;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final bool? obscureText;
  final Widget? prefixIcon;

  const TextFField({
    super.key,
    required this.labelText,
    this.onChanged,
    this.onFieldSubmitted,
    this.obscureText,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      child: TextFormField(
        obscureText: obscureText ?? false,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        style: CustomTextStyles.MulishNormalstyle14.copyWith(
          color: Colors.black,
          fontSize: 14.sp,
        ),
        // This validator checks if the field is empty
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "This field is required";
          }
          return null;
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.lightGray,
          prefixIcon: prefixIcon,
          prefixIconColor: AppColors.grey,
          labelText: labelText,
          labelStyle: CustomTextStyles.MulishNormalstyle14.copyWith(
            fontSize: 14.sp,
            color: AppColors.grey,
          ),
          border: _getBorderStyle(),
          enabledBorder: _getBorderStyle(),
          focusedBorder: _getBorderStyle(),
          errorBorder: _getBorderStyle(),
        ),
      ),
    );
  }

  // This method returns a consistent border style for the TextFormField
  OutlineInputBorder _getBorderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: AppColors.lightGray, width: 1.w),
    );
  }
}
