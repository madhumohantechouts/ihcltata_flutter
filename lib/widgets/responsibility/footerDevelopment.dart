import 'package:flutter/material.dart';

import '../../network/sanity.dart';
import '../../utils/constants.dart';
import 'data/developmentdata.dart';
import 'data/footer_companydata.dart';
class FooterCompany extends StatefulWidget {
  const FooterCompany({Key? key}) : super(key: key);

  @override
  State<FooterCompany> createState() => _FooterCompanyState();
}

class _FooterCompanyState extends State<FooterCompany> {
  var cFour="";
  var cOne="";
  var cThree="";
  var cTwo="";
  var header="";
  List<FooterCompanyData> dataList=[];
  final SanityClient sanityClient = SanityClient(
    projectId: projectId,
    dataset: dataSet,
    useCdn: useCdn,
  );
  void getCompany() async {
    // print("tapped");
    const String query = '*[_type == "footerCompany"]';
    List<dynamic> result = await sanityClient.fetch(query: query);
    List<DevelopmentData> dataListTemp = List<DevelopmentData>.from(result.map((e) => DevelopmentData.fromJson(e)));
    setState(() {
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
    getCompany();
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

          ]
      ),
    );
  }
}
