import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ihcltata/widgets/responsibility/responsibilty_store.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({Key? key}) : super(key: key);

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

int current = 0;

class _BannerCarouselState extends State<BannerCarousel> {
  // bool loader=false;

  final responsibility = ResponsibiltyStore();

  @override
  void initState() {
    // TODO: implement initState
    responsibility.getBanner();
    super.initState();
  }

  itemBuild(BuildContext context, int index) {
    return Container(
      height: 200,
      width: 390,
      decoration: BoxDecoration(
        image: DecorationImage(
          image:
              NetworkImage(responsibility.bannerList[index].image?.url ?? ""),
          fit: BoxFit.fill,
        ),
      ),
      child: Align(
          alignment: Alignment.center,
          child: Text(
            responsibility.bannerList[index].text ?? "",
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => CarouselSlider.builder(
        options: CarouselOptions(
          height: 200.0,
          viewportFraction: 2,
          autoPlay: true,
          reverse: false,
          autoPlayInterval: const Duration(seconds: 5),
          onPageChanged: (index, reason) => setState(() => current = index),
        ),
        itemCount: responsibility.bannerList.length,
        itemBuilder: (context, index, realIndex) {
          return responsibility.bannerList.isEmpty
              ? Container()
              : itemBuild(context, index);
        },
      ),
    );
  }
}
