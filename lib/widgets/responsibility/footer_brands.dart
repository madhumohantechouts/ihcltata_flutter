import 'package:flutter/material.dart';

import '../../network/sanity.dart';
import '../../utils/constants.dart';
import 'data/footer_brandsdata.dart';
class FooterBrands extends StatefulWidget {
  const FooterBrands({Key? key}) : super(key: key);

  @override
  State<FooterBrands> createState() => _FooterBrandsState();
}
class _FooterBrandsState extends State<FooterBrands> {
  var cFive="";
  var cFour="";
  var cOne="";
  var cThree="";
  var cTwo="";
  var header="";

  List<FooterBrandsData> dataList=[];
  final SanityClient sanityClient = SanityClient(
    projectId: projectId,
    dataset: dataSet,
    useCdn: useCdn,
  );
  void getDescription() async {
    // print("tapped");
    const String query = '*[_type == "footerBrands"]';
    List<dynamic> result = await sanityClient.fetch(query: query);
    List<FooterBrandsData> dataListTemp = List<FooterBrandsData>.from(result.map((e) => FooterBrandsData.fromJson(e)));
    setState(() {
      cFive = dataListTemp[0].cFive!;
      cFour=dataListTemp[0].cFour!;
      cOne=dataListTemp[0].cOne!;
      cThree=dataListTemp[0].cThree!;
      cTwo=dataListTemp[0].cTwo!;
      header=dataListTemp[0].header!;
// print(header);
//       dataList=dataListTemp;
     // print(dataList);
        });
  }
  @override
  void initState() {
    getDescription();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children:[  Padding(
            padding: const EdgeInsets.fromLTRB(30.0,0,5,0),
            child: Align(
              alignment: Alignment.topLeft,
              child:Text("Home",style:TextStyle(fontSize: 15,)),
            ),
          ),

            Padding(
              padding: const EdgeInsets.fromLTRB(30,0,5,0),
              child: Align(
                alignment: Alignment.topLeft,
                child:Text(header,style:TextStyle(fontSize: 15,)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0,0,5,0),
              child: Align(
                alignment: Alignment.topLeft,
                child:Text(cOne,style:TextStyle(fontSize: 15,)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0,0,5,0),
              child: Align(
                alignment: Alignment.topLeft,
                child:Text(cTwo,style:TextStyle(fontSize: 15,)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0,0,5,0),
              child: Align(
                alignment: Alignment.topLeft,
                child:Text(cThree,style:TextStyle(fontSize: 15,)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0,0,5,0),
              child: Align(
                alignment: Alignment.topLeft,
                child:Text(cFour,style:TextStyle(fontSize: 15,)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0,0,5,0),
              child: Align(
                alignment: Alignment.topLeft,
                child:Text(cFive,style:TextStyle(fontSize: 15,)),
              ),
            ),




            // Text(descripition),
          ]
        // Text("Id :.." + id),
      ),

    );
  }
}
