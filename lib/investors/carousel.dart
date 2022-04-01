import 'package:flutter/material.dart';

import '../network/sanity.dart';
import '../utils/constants.dart';
import 'json/carousel_images.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final SanityClient sanityClient = SanityClient(
    projectId: projectId,
    dataset: dataSet,
    useCdn: useCdn,
  );
  List<CarouselImages> dataList = [];

  void _extractCarousel() async {
    const String query = '*[_type in ["carosalImages"]]{carosalImage,title}';
    List<dynamic> result = await sanityClient.fetch(query: query);
    List<CarouselImages> dataListTemp = List<CarouselImages>.from(
        result.map((e) => CarouselImages.fromJson(e)));
    for (var element in dataListTemp) {
      var refId = element.carosalImage?.asset?.sRef;
      var parts = refId!.split('-');
      var id = parts[1];
      var format = parts[3];
      var size = parts[2];
      element.carosalImage?.url =
          "https://cdn.sanity.io/images/$projectId/$dataSet/$id-$size.$format";
    }

    setState(() {
      dataList = dataListTemp;
    });
  }

  @override
  Widget build(BuildContext context) {
    _extractCarousel();
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(dataList.length, (index) {
          return Row(
            children: [
              SizedBox(
                  height: 100,
                  width: 350,
                  child:
                      Image.network(dataList[index].carosalImage?.url ?? "")),
            ],
          );
        }));
  }
}
