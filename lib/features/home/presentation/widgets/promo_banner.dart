import 'package:auvnet_internship_assessment/core/utils/app_string.dart';
import 'package:auvnet_internship_assessment/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screen.height * 0.025),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Promo code tapped")),
          );
        },
        child: Container(
          height: screen.height * 0.125,
          width: screen.width * 0.91,
          padding: EdgeInsets.symmetric(
            horizontal: screen.width * 0.04,
            vertical: screen.height * 0.01,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 6,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/promoCode.png",
                fit: BoxFit.contain,
                height: screen.height * 0.15,
                width: screen.width * 0.25,
                alignment: Alignment.centerLeft,
              ),
              SizedBox(width: screen.width * 0.03),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.gotCode,
                    style: CustomTextStyles.dmSansBoldstyle14.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screen.height * 0.005),
                  Text(
                    AppStrings.gotCodeDescription,
                    style: CustomTextStyles.dmSansBoldstyle14.copyWith(
                      color: Colors.grey,
                      fontSize: screen.width * 0.027,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
