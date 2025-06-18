import 'package:auvnet_internship_assessment/features/home/domain/entities/home_entity.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/widgets/custom_gradient_app_bar.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/widgets/image_carousel_slider.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/widgets/nearby_restaurants.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/widgets/promo_banner.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/widgets/services_section.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/widgets/shortcuts_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state.error != null) {
          return Scaffold(body: Center(child: Text(state.error!)));
        }

        if (state.data == null) {
          return const Scaffold(body: Center(child: Text('No data found')));
        }

        final HomeEntity data = state.data!;

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomGradientAppBar(),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 6.h),
                  ServicesSection(services: data.services),
                  SizedBox(height: 20.h),
                  const PromoBanner(),
                  SizedBox(height: 20.h),
                  ShortcutsSection(),
                  SizedBox(height: 40.h),
                  BannerSliderSection(banners: data.categories),
                  SizedBox(height: 20.h),
                  NearbyRestaurants(restaurants: data.restaurants),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
          bottomNavigationBar: CustomBottomNavBar(
            currentIndex: 0,
            onTap: (index) {
              // TODO: Implement navigation logic here
            },
          ),
        );
      },
    );
  }
}

