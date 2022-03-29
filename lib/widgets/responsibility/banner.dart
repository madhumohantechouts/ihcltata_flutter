import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../network/sanity.dart';
import '../../utils/constants.dart';
import 'data/banner.dart';
class Banner extends StatefulWidget {
  const Banner({Key? key,required this.title}) : super(key: key);
  final String title;

  @override
  State<Banner> createState() => _BannerState();
}
int current=0;
class _BannerState extends State<Banner> {
  bool loader=false;

  final SanityClient sanityClient = SanityClient(
    projectId: projectId,
    dataset: dataSet,
    useCdn: useCdn,
  );
  List<Result> dataList = [];
  void _incrementCounter() async {

    const String query = '*[_type == "banner"] ';
    setState(() {
      loader=true;
    });

    List<dynamic> result = await sanityClient.fetch(query: query);
    setState(() {
      loader=false;
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
  Widget build(BuildContext context) {
    itemBuild(BuildContext context, int index) {
      return Column(
        // margin: EdgeInsets.symmetric(horizontal: 10.0),
        children:<Widget>[
          Container(
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
                child:Text(dataList[index].slug ?? "",style: TextStyle(
                    fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                )
            ),
          ),
        ],
      );
    }
    return Container(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Column(
          // children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              height: 200.0,
              viewportFraction: 2,
              autoPlay: true,
              reverse: false,
              autoPlayInterval: Duration(seconds: 5),
              onPageChanged: (index, reason) => setState(() => current = index),
            ),
            itemCount: dataList.length,
            itemBuilder: (context, index, realIndex) {
              var img = dataList[index];
              return itemBuild(context, index);
            },
          ),
        ],
      ),


    );
  }
}
