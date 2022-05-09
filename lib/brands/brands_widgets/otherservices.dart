import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../network/sanity.dart';
import '../../../utils/constants.dart';
import '../brands_data/otherservices_data.dart';

class OtherServices extends StatefulWidget {
  const OtherServices({
    Key? key,
  }) : super(key: key);
  @override
  State<OtherServices> createState() => _OtherServicesState();
}

class _OtherServicesState extends State<OtherServices> {
  int current = 0;
  // bool loader=false;
  final SanityClient sanityClient = SanityClient(
    projectId: projectId,
    dataset: dataSet,
    useCdn: useCdn,
  );
  List<Services> dataList = [];
  void getHospital() async {
    const String query = '*[_type == "featuresInfo"] ';
    setState(() {
      // loader=true;
    });
    List<dynamic> result = await sanityClient.fetch(query: query);
    setState(() {
      // loader=false;
    });
    List<Services> dataListTemp =
        List<Services>.from(result.map((e) => Services.fromJson(e)));
    dataListTemp.forEach((element) {
      var refId = element.coverImage?.asset?.sRef;
      var parts = refId!.split('-');
      var id = parts[1];
      var format = parts[3];
      var size = parts[2];
      element.coverImage?.url =
          "https://cdn.sanity.io/images/$projectId/$dataSet/$id-$size.$format";
    });

    setState(() {
      dataList = dataListTemp;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getHospital();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    itemBuild(BuildContext context, int index) {
      return Container(
        height: 600,
        width: 390,
        child: Column(
          children: <Widget>[
            Image(
              fit: BoxFit.fill,
              image: NetworkImage(dataList[index].coverImage?.url ?? ""),
              height: 300,
              width: 350,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 10),
            //   child: Text(
            //     dataList[index].title ?? "",
            //     style: TextStyle(fontSize: 12),
            //   ),
            // ),
            Row(
              // use whichever suits your need
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 10, left: 20),
                      child: Text(
                        dataList[index].title ?? "",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    /*Padding(
                      padding:EdgeInsets.only(bottom:5,right:100),
                      child:Text(
                        dataList[index].description ?? "",
                       style: const TextStyle(
                            color: Colors.black,fontSize: 10),
                      ),
                    ),*/
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: FlatButton(
                    color: Colors.blue[900],
                    child: Text(dataList[index].details ?? "",
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    var size = MediaQuery.of(context).size;
    return Container(
      height: 450,
      width: 500,
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: 500,
                height: 450,
                child: ListView.builder(
                  itemCount: dataList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return itemBuild(context, index);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
