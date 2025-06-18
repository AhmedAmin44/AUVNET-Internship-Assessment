import 'package:auvnet_internship_assessment/core/utils/app_string.dart';
import 'package:auvnet_internship_assessment/core/utils/app_text_style.dart';
import 'package:auvnet_internship_assessment/features/home/domain/entities/service_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServicesSection extends StatelessWidget {
  final List<ServiceEntity> services;
  const ServicesSection({required this.services, super.key});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: screen.height * 0.02),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screen.width * 0.03),
          child: Text(
            AppStrings.services,
            style: CustomTextStyles.dmSansBoldstyle14.copyWith(
              color: Colors.black,
              fontSize: screen.width * 0.05, 
            ),
          ),
        ),
        SizedBox(height: screen.height * 0.015),
        SizedBox(
          height: screen.height * 0.19, 
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: screen.width * 0.03),
            scrollDirection: Axis.horizontal,
            itemCount: services.length,
            separatorBuilder: (_, __) => SizedBox(width: screen.width * 0.03),
            itemBuilder: (context, index) {
              final service = services[index];
              final hasDiscount =
                  service.discount != "0" && service.discount.trim().isNotEmpty;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: screen.width * 0.28, 
                        height: screen.height * 0.09, 
                        decoration: BoxDecoration(
                          color: const Color(0xffF5F5F5),
                          borderRadius:
                              BorderRadius.circular(screen.width * 0.025),
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
                        imageUrl: service.imageUrl,
                        width: screen.width * 0.16, 
                        height: screen.height * 0.065, 
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.broken_image),
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                  SizedBox(height: screen.height * 0.005),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: screen.width * 0.013),
                    width: screen.width * 0.24, 
                    height: screen.height * 0.028, 
                    decoration: BoxDecoration(
                      color: const Color(0xff8900FE),
                      borderRadius:
                          BorderRadius.circular(screen.width * 0.040),
                    ),
                    child: Center(
                      child: Text(
                        hasDiscount
                            ? " Up to ${service.discount} %"
                            : " ${service.duration} mins",
                        style: CustomTextStyles.dmSansNstyle14.copyWith(
                          color: Colors.white,
                          fontSize: 12.sp, 
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screen.height * 0.005),
                  SizedBox(
                    width: screen.width * 0.24,
                    child: Text(
                      service.title,
                      style: CustomTextStyles.dmSansBoldstyle14.copyWith(
                        color: Colors.black,
                        fontSize: 14.sp,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
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
