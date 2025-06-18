import 'package:auvnet_internship_assessment/core/utils/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShortcutsSection extends StatelessWidget {
  ShortcutsSection({super.key});

  final List<Map<String, dynamic>> shortcuts = [
    {
      "imagePath": 'assets/images/past_orders.png',
      "label": "Past\n orders",
    },
    {
      "imagePath": 'assets/images/super_saver.png',
      "label": "Super\n Saver",
    },
    {
      "imagePath": 'assets/images/must_tries.png',
      "label": "Must-tries",
    },
    {
      "imagePath": 'assets/images/give_back.png',
      "label": "Give Back",
    },
    {
      "imagePath": 'assets/images/best_seller.png',
      "label": "Best\n Sellers",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.shortcuts,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: screenWidth * 0.03),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: shortcuts.map((item) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.015),
                child: GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("You clicked: ${item["label"]}"),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: screenWidth * 0.14,
                        height: screenWidth * 0.14,
                        decoration: BoxDecoration(
                          color: const Color(0xffFFEEE6),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Center(
                          child: Image.asset(
                            item["imagePath"],
                            width: screenWidth * 0.07,
                            height: screenWidth * 0.07,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(height: screenWidth * 0.025),
                      Text(
                        item["label"],
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
