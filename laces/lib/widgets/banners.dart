import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  final List<String> bannerItems = [
    'assets/banner.jpg',
    'assets/banner.jpg',
    'assets/banner.jpg',
    'assets/banner.jpg',
    'assets/banner.jpg',
  ];

  final PageController _pageController =
      PageController(initialPage: 3, viewportFraction: 0.8);

  BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 200, // Adjust the height according to your requirements
        child: PageView.builder(
          controller: _pageController,
          itemCount: bannerItems.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: AspectRatio(
                  aspectRatio: 1.5,
                  child: Image.asset(
                    bannerItems[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
