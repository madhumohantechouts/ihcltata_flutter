import 'package:flutter/material.dart';

import '../../network/sanity.dart';
import '../../utils/constants.dart';
import 'data/footer_companydata.dart';
class FooterComapny extends StatefulWidget {
  const FooterComapny({Key? key}) : super(key: key);

  @override
  State<FooterComapny> createState() => _FooterComapnyState();
}

class _FooterComapnyState extends State<FooterComapny> {
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
  void getInvestors() async {
    // print("tapped");
    const String query = '*[_type == "footerDevelopment"]';
    List<dynamic> result = await sanityClient.fetch(query: query);
    List<FooterCompanyData> dataListTemp = List<FooterCompanyData>.from(result.map((e) => FooterCompanyData.fromJson(e)));
    setState(() {
      cOne=dataListTemp[0].cOne!;
      cTwo=dataListTemp[0].cTwo!;
      header=dataListTemp[0].header!;
      cThree=dataListTemp[0].cThree!;
      cFour=dataListTemp[0].cFour!;
      // print(header);
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
        child:Text(header.toUpperCase(),style:TextStyle(fontSize: 15,)),
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

          ],
    ),
    );

  }
}
