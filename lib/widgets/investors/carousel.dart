import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'store/investors_store.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

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
        return Column(
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
            }));
      },
    );
  }
}
