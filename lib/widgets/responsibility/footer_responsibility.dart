import 'package:flutter/material.dart';

import '../../network/sanity.dart';
import '../../utils/constants.dart';
import 'data/footer_responsibilitydata.dart';
class FooterResponsibility extends StatefulWidget {
  const FooterResponsibility({Key? key}) : super(key: key);

  @override
  State<FooterResponsibility> createState() => _FooterResponsibilityState();
}

class _FooterResponsibilityState extends State<FooterResponsibility> {
  var cOne="";
  var cTwo="";
  var header="";
  List<FooterResponsibilityData> dataList=[];
  final SanityClient sanityClient = SanityClient(
    projectId: projectId,
    dataset: dataSet,
    useCdn: useCdn,
  );
  void getInvestors() async {
    // print("tapped");
    const String query = '*[_type == "footerResponsibility"]';
    List<dynamic> result = await sanityClient.fetch(query: query);
    List<FooterResponsibilityData> dataListTemp = List<FooterResponsibilityData>.from(result.map((e) => FooterResponsibilityData.fromJson(e)));
    setState(() {
      cOne=dataListTemp[0].cOne!;
      cTwo=dataListTemp[0].cTwo!;
      header=dataListTemp[0].header!;
      print(header);
//       dataList=dataListTemp;
      // print(dataList);
    });
  }
  @override
  void initState() {
    getInvestors();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children:[
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

          ]
      ),
    );
  }
}
