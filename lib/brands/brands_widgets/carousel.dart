import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../network/sanity.dart';
import '../../../utils/constants.dart';
import '../brands_data/carousel_data.dart';
import 'brands_store.dart';

class Brands extends StatefulWidget {
  const Brands({
    Key? key,
  }) : super(key: key);
  @override
  State<Brands> createState() => _BrandsState();
}

class _BrandsState extends State<Brands> {
  int current = 0;
  final carousel = BrandsStore();

  @override
  void initState() {
    // TODO: implement initState
    carousel.getBrands();
    super.initState();
  }

  itemBuild(BuildContext context, int index) {
    return Container(
      height: 200,
      width: 390,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              carousel.carouselList[index].carosalImage?.url ?? ""),
          fit: BoxFit.fill,
        ),
      ),
      child: Align(
          alignment: Alignment.center,
          child: Text(
            carousel.carouselList[index].title ?? "",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Observer(
        builder: (_) => CarouselSlider.builder(
          options: CarouselOptions(
            height: 200.0,
            viewportFraction: 2,
            autoPlay: true,
            reverse: false,
            autoPlayInterval: Duration(seconds: 5),
            onPageChanged: (index, reason) => setState(() => current = index),
          ),
          itemCount: carousel.carouselList.length,
          itemBuilder: (context, index, realIndex) {
            return carousel.carouselList.isEmpty
                ? Container()
                : itemBuild(context, index);
          },
        ),
      ),
    );
  }
}
