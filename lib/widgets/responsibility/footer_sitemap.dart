import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../network/sanity.dart';
import '../../utils/constants.dart';
import 'data/footer_sitemapdata.dart';

class FooterSiteMap extends StatefulWidget {
  const FooterSiteMap({Key? key}) : super(key: key);

  @override
  State<FooterSiteMap> createState() => _FooterSiteMapState();
}

class _FooterSiteMapState extends State<FooterSiteMap> {
  var headerFive = "";
  var headerFour = "";
  var headerOne = "";
  var headerThree = "";
  var headerTwo = "";
  List<FooterSiteMapData> dataList = [];
  final SanityClient sanityClient = SanityClient(
    projectId: projectId,
    dataset: dataSet,
    useCdn: useCdn,
  );
  void getSiteMap() async {
    // print("tapped");
    const String query = '*[_type == "subFooter"]';
    List<dynamic> result = await sanityClient.fetch(query: query);
    List<FooterSiteMapData> dataListTemp = List<FooterSiteMapData>.from(
        result.map((e) => FooterSiteMapData.fromJson(e)));
    setState(() {
      headerThree = dataListTemp[0].headerThree!;
      headerTwo = dataListTemp[0].headerTwo!;
      headerOne = dataListTemp[0].headerOne!;
      headerFour = dataListTemp[0].headerFour!;
      headerFive = dataListTemp[0].headerFive!;
      // print(header);
//       dataList=dataListTemp;
      // print(dataList);
    });
  }

  @override
  void initState() {
    getSiteMap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(22.0, 10, 0, 0),
                child: Align(
                  // alignment: Alignment.topLeft,
                  child: Text(headerOne,
                      style: TextStyle(
                        fontSize: 15,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0,10,0,0),
                child: Align(
                  // alignment: Alignment.topLeft,
                  child: Text(headerTwo,
                      style: TextStyle(
                        fontSize: 15,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10, 0, 0),
                child: Align(
                  // alignment: Alignment.topLeft,
                  child: Text(headerThree,
                      style: TextStyle(
                        fontSize: 15,
                      )),
                ),
              )
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(82.0, 0, 0, 15),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(headerFour,
                      style: TextStyle(
                        fontSize: 15,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(82.0, 0, 0, 15),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(headerFive,
                      style: TextStyle(
                        fontSize: 15,
                      )),
                ),
              ),

            ],
          ),
          Divider(
            height: 2,
            color: Colors.black,
          )
        ],



      )

    );

  }
}
