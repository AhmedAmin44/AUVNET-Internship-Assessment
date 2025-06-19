import 'package:auvnet_internship_assessment/core/databases/cache/cache_helper.dart';
import 'package:auvnet_internship_assessment/core/functions/navigation.dart';
import 'package:auvnet_internship_assessment/core/serveces/service_locator.dart';
import 'package:auvnet_internship_assessment/core/utils/app_string.dart';
import 'package:auvnet_internship_assessment/core/utils/app_text_style.dart';
import 'package:auvnet_internship_assessment/features/onboarding/presentation/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/models/onboarding_model.dart';
import '../widgets/onboarding_item.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: onBoardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingItem(model: onBoardingData[index]);
                },
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.bottomRight,
                  radius: 1.19,
                  colors: [
                    Color(
                      0xFF0EBE7E,
                    ).withOpacity(0.01),
                    Colors.white, 
                  ],
                  stops: [0.0, 0.85],
                  tileMode: TileMode.clamp,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  children: [
                    SizedBox(height: 12.h),
                    CustomOnboardingBotton(
                      onPressed: () {
                        OnBoardingVisited();
                        customNavigateReplacement(context, '/signUp');
                      },
                      text: AppStrings.getStarted,
                    ),
                    SizedBox(height: 12.h),
                    TextButton(
                      onPressed: () {
                        pageController.jumpToPage(onBoardingData.length - 1);
                        setState(() {
                          currentIndex = onBoardingData.length - 1;
                        });
                      },
                      child: Text(
                        AppStrings.next,
                        style: CustomTextStyles.RubikNormalstyle14,
                      ),
                    ),
                    SizedBox(height: 42.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Function to save the onboarding visited status in cache
void OnBoardingVisited() {
  getIt<CacheHelper>().saveData(key: "isOnboardingVisited", value: true);
}
