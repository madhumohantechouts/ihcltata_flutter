import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'store/investors_store.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

int current = 0;

class _CarouselState extends State<Carousel> {
  final investorsStore = InvestorsStore();

  @override
  void initState() {
    investorsStore.extractCarousel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return CarouselSlider.builder(
          options: CarouselOptions(
            height: 200.0,
            viewportFraction: 2,
            autoPlay: true,
            reverse: false,
            autoPlayInterval: const Duration(seconds: 5),
            onPageChanged: (index, reason) => setState(() => current = index),
          ),
          itemCount: investorsStore.carouselImagesList.length,
          itemBuilder: (context, index, realIndex) {
            return investorsStore.carouselImagesList.isEmpty
                ? Container()
                : itemBuild(context, index);
          },
        ); /*Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(investorsStore.carouselImagesList.length, (index) {
              return Row(
                children: [
                  SizedBox(
                      height: 100,
                      width: 350,
                      child:
                      Image.network(investorsStore.carouselImagesList[index].carosalImage?.url ?? "")),
                ],
              );
            }));*/
      },
    );
  }

  itemBuild(BuildContext context, int index) {
    return Container(
      height: 200,
      width: 400,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              investorsStore.carouselImagesList[index].carosalImage?.url ?? ""),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
