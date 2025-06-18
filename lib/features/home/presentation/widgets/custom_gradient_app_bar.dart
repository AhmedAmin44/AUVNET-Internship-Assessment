import 'package:auvnet_internship_assessment/core/utils/app_string.dart';
import 'package:auvnet_internship_assessment/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomGradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomGradientAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return AppBar(
      flexibleSpace: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff8900FE), Color(0xffFFDE59)],
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: screen.width * 0.08,
          vertical: screen.height * 0.04,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.bannerDelivering,
                    style: CustomTextStyles.dmSansBoldstyle14.copyWith(
                      color: Colors.black,
                      fontSize: screen.width * 0.03,
                    ),
                  ),
                  Text(
                    AppStrings.bannerAlSatwa,
                    style: CustomTextStyles.dmSansBoldstyle14.copyWith(
                      color: Colors.black,
                      fontSize: screen.width * 0.04,
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      "${AppStrings.hi}hepa!",
                      style: CustomTextStyles.RubikBoldstyle30,
                    ),
                  ),
                ],
              ),
            ),
            CircleAvatar(
              radius: screen.width * 0.09,
              backgroundImage: const AssetImage("assets/images/homeImage.png"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(140);
}
