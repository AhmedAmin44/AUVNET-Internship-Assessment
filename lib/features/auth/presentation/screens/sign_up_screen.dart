import 'package:auvnet_internship_assessment/features/auth/presentation/widgets/custom_auth_banner.dart';
import 'package:auvnet_internship_assessment/features/auth/presentation/widgets/custom_signUp_form.dart';
import 'package:flutter/material.dart%20%20';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 85.h)),
          SliverToBoxAdapter(child: CustomAuthBanner()),
          SliverToBoxAdapter(child: SizedBox(height: 14.h)),
          SliverToBoxAdapter(child: CustomSignUpForm()),
        ],
      ),
    );
  }
}
