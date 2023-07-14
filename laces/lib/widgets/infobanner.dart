import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class InfoBanner extends StatefulWidget {
  const InfoBanner({super.key});

  @override
  State<InfoBanner> createState() => _InfoBannerState();
}

class _InfoBannerState extends State<InfoBanner> {
  List bannerItems = [
    {'id': 1, 'imagepath': 'assets/infobanner.jpg'},
    {'id': 2, 'imagepath': 'assets/infobanner.jpg'},
    {'id': 3, 'imagepath': 'assets/infobanner.jpg'},
    {'id': 4, 'imagepath': 'assets/infobanner.jpg'},
    {'id': 5, 'imagepath': 'assets/infobanner.jpg'},
  ];
  int currentindex = 0;

  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
    onTap: () => currentindex,
    child: CarouselSlider(
      items: bannerItems
          .map(
            (item) => Image.asset(
              item['imagepath'],
              fit: BoxFit.cover,
            ),
          )
          .toList(),
      options: CarouselOptions(
        scrollPhysics: const BouncingScrollPhysics(),
        autoPlay: false,
        aspectRatio: 1,
        viewportFraction: 1,
        onPageChanged: (index, reason) {
          setState(() {
            currentindex = index;
          });
        },
      ),
    ),
      );
  }
}
