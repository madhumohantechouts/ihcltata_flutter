import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MainCarousel extends StatefulWidget {
  const MainCarousel({Key? key}) : super(key: key);

  @override
  State<MainCarousel> createState() => _MainCarouselState();
}

class _MainCarouselState extends State<MainCarousel> {
  int current = 0;

  var name = [
    "assets/shoppersStop/mainCarousel/footwear_carousel-msite-without-offer-banner-2022-05-06newhp-page.jpg",
    "assets/shoppersStop/mainCarousel/fragrances_carousel-msite.jpg",
    "assets/shoppersStop/mainCarousel/msite__hp_anardan67a_exclusive_static_inhouse_20220505.jpg",
    "assets/shoppersStop/mainCarousel/msite__hp_smart-pant_exclusive_static_inhouse_20220505786.jpg"
  ];

  itemBuild(BuildContext context, int index) {
    return Image.asset(name[index]);
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 200.0,
        viewportFraction: 1,
        autoPlay: true,
        reverse: false,
        autoPlayInterval: const Duration(seconds: 5),
        onPageChanged: (index, reason) => setState(() => current = index),
      ),
      itemCount: name.length,
      itemBuilder: (context, index, realIndex) {
        return itemBuild(context, index);
      },
    );
  }
}
