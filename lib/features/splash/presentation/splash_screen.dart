import 'package:auvnet_internship_assessment/core/databases/cache/cache_helper.dart';
import 'package:auvnet_internship_assessment/core/functions/navigation.dart';
import 'package:auvnet_internship_assessment/core/serveces/service_locator.dart';
import 'package:auvnet_internship_assessment/core/utils/app_images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // to get data that are saved from part of onboarding to know if user visit or not
    bool isOnboardingVisited =
        getIt<CacheHelper>().getData(key: "isOnboardingVisited") ?? false;
    if (isOnboardingVisited == true) {
      FirebaseAuth.instance.currentUser == null
          ? customDelay(context, "/login")
          : customDelay(context, "/home");
    } else {
      customDelay(context, "/onboarding");
    }
    // customDelay(context, "/onboarding");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Image.asset(
            Images.appLogo,
            width: 336.w,
            height: 336.h,
          ),
        ),
      ),
    );
  }
}

void customDelay(context, path) {
  Future.delayed(
    const Duration(seconds: 2),
    () {
      customNavigateReplacement(context, path);
    },
  );
}
