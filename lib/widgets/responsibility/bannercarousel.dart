import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../network/sanity.dart';
import '../../utils/constants.dart';
import 'data/banner.dart';
class BannerCarousel extends StatefulWidget {


  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}
int current=0;
class _BannerCarouselState extends State<BannerCarousel> {
  // bool loader=false;

  final SanityClient sanityClient = SanityClient(
    projectId: projectId,
    dataset: dataSet,
    useCdn: useCdn,
  );
  List<Result> dataList = [];
  void getCounter() async {

    const String query = '*[_type == "banner"] ';
    setState(() {
      // loader=true;
    });

    List<dynamic> result = await sanityClient.fetch(query: query);
    setState(() {
      // loader=false;
    });

    List<Result> dataListTemp = List<Result>.from(result.map((e) => Result.fromJson(e)));
    dataListTemp.forEach((element) {
      var refId = element.image?.asset?.sRef;
      var parts = refId!.split('-');
      var id = parts[1];
      var format = parts[3];
      var size = parts[2];
      element.image?.url = "https://cdn.sanity.io/images/$projectId/$dataSet/$id-$size.$format";
    });

    setState(() {
      dataList = dataListTemp;
    });
  }
@override
  void initState() {
    // TODO: implement initState
  getCounter();
    super.initState();
  }
  itemBuild(BuildContext context, int index) {
    return  Container(
      height: 200,
      width: 390,
      decoration: BoxDecoration(
        image: DecorationImage(

          image: NetworkImage(dataList[index].image?.url ?? ""),
          fit: BoxFit.fill,
        ),
      ),
      child: Align(
          alignment: Alignment.center,
          child:Text(dataList[index].text ?? "",style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )
      ),
    );
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      child: CarouselSlider.builder(
        options: CarouselOptions(
          height: 200.0,
          viewportFraction: 2,
          autoPlay: true,
          reverse: false,
          autoPlayInterval: Duration(seconds: 5),
          onPageChanged: (index, reason) => setState(() => current = index),
        ),
        itemCount:dataList.length,

        itemBuilder: (context, index, realIndex) {
          return dataList.isEmpty?Container():itemBuild(context, index);
        },
      ),
    );
  }
}






