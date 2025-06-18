import 'package:auvnet_internship_assessment/core/utils/app_string.dart';
import 'package:auvnet_internship_assessment/core/utils/app_text_style.dart';
import 'package:auvnet_internship_assessment/features/home/domain/entities/restaurant_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NearbyRestaurants extends StatelessWidget {
  final List<RestaurantEntity> restaurants;
  const NearbyRestaurants({required this.restaurants, super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.popularRestaurantsNearby,
          style: TextStyle(
            fontSize: screenWidth * 0.045, 
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: screenHeight * 0.025),
        SizedBox(
          height: screenHeight * 0.20, 
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: restaurants.length,
            separatorBuilder: (_, __) => SizedBox(width: screenWidth * 0.04),
            itemBuilder: (context, index) {
              final r = restaurants[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: screenWidth * 0.25, 
                        height: screenHeight * 0.09, 
                        decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF),
                          border: Border.all(
                            color: const Color(0xffD9D9D9),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(screenWidth * 0.025),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                      ),
                      CachedNetworkImage(
                        imageUrl: r.logoUrl,
                        width: screenWidth * 0.21,
                        height: screenHeight * 0.06,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.broken_image),
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  SizedBox(
                    width: screenWidth * 0.25,
                    child: Text(
                      r.name,
                      style: CustomTextStyles.dmSansNstyle14.copyWith(
                        color: Colors.black,
                        fontSize: screenWidth * 0.030,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.access_time,
                        color: const Color(0xff1E1E1E),
                        size: screenWidth * 0.03,
                      ),
                      SizedBox(width: screenWidth * 0.015),
                      Text(
                        "${r.distance.toString()} mins",
                        style: CustomTextStyles.dmSansBoldstyle14.copyWith(
                          color: const Color(0xff1E1E1E),
                          fontSize: screenWidth * 0.027,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
