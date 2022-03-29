import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../network/sanity.dart';
import '../../utils/constants.dart';
import 'data/carousel_data.dart';

class Brands extends StatefulWidget {
  const Brands({Key? key,required this.title }) : super(key: key);

  final String title;

  @override
  State<Brands> createState() => _BrandsState();
}

class _BrandsState extends State<Brands> {
  bool loader=false;
  final SanityClient sanityClient = SanityClient(
    projectId: projectId,
    dataset: dataSet,
    useCdn: useCdn,
  );
  var current=0;
  List<DataResponse> dataList = [];
  void _incrementCounter() async {
    const String query = '*[_type == "carosalImages"] ';
    setState(() {
      loader=true;
    });

    List<dynamic> result = await sanityClient.fetch(query: query);
    setState(() {
      loader=false;
    });

    List<DataResponse> dataListTemp = List<DataResponse>.from(result.map((e) => DataResponse.fromJson(e)));
    print(dataListTemp);
    dataListTemp.forEach((element) {
      var refId = element.carosalImage?.asset?.sRef;
      var parts = refId!.split('-');
      var id = parts[1];
      var format = parts[3];
      var size = parts[2];
      element.carosalImage?.url = "https://cdn.sanity.io/images/$projectId/$dataSet/$id-$size.$format";
    });

    setState(() {
      dataList = dataListTemp;
    });
print(dataList);
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

          image: NetworkImage(dataList[index].carosalImage?.url ?? ""),
      fit: BoxFit.fill,
      ),
      ),
        child: Align(
            alignment: Alignment.center,
        child:Text(dataList[index].title ?? "",style: TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        )
      ),
      ),
      ],
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
  body: Container(
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
            itemCount:dataList.length,

            itemBuilder: (context, index, realIndex) {
              return dataList.isEmpty?Container():itemBuild(context, index);
            },
          ),
        ],
      ),
    ),
        floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
    onPressed: ()async{
    _incrementCounter();
    }
    ),
    );
  }
}
