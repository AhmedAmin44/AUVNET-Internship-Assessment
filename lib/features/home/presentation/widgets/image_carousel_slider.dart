import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:auvnet_internship_assessment/features/home/domain/entities/category_entity.dart';

class BannerSliderSection extends StatefulWidget {
  final List<CategoryEntity> banners;

  const BannerSliderSection({required this.banners, Key? key}) : super(key: key);

  @override
  State<BannerSliderSection> createState() => _BannerSliderSectionState();
}

class _BannerSliderSectionState extends State<BannerSliderSection> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final banners = widget.banners;

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    if (banners.isEmpty) {
      return const Center(child: Text("No banners found."));
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider(
          items: banners.map((banner) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(screenWidth * 0.03),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    imageUrl: banner.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.broken_image),
                  )
                ],
              ),
            );
          }).toList(),
          carouselController: _controller,
          options: CarouselOptions(
            height: screenHeight * 0.22, 
            autoPlay: true,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        SizedBox(height: screenHeight * 0.015),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: banners.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(
                entry.key,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              ),
              child: Container(
                width: screenWidth * 0.022,
                height: screenWidth * 0.022,
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == entry.key
                      ? const Color(0xff8900FE)
                      : Colors.grey.shade400,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
