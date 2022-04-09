import 'package:flutter/material.dart';

import '../../network/sanity.dart';
import '../../utils/constants.dart';
import 'data/footerinvestorsdata.dart';
class FooterInvestors extends StatefulWidget {
  const FooterInvestors({Key? key}) : super(key: key);

  @override
  State<FooterInvestors> createState() => _FooterInvestorsState();
}

class _FooterInvestorsState extends State<FooterInvestors> {
  var cOne="";
  var cTwo="";
  var header="";
  List<FooterInvestorsData> dataList=[];
  final SanityClient sanityClient = SanityClient(
    projectId: projectId,
    dataset: dataSet,
    useCdn: useCdn,
  );
  void getInvestors() async {
    // print("tapped");
    const String query = '*[_type == "footerInvestors"]';
    List<dynamic> result = await sanityClient.fetch(query: query);
    List<FooterInvestorsData> dataListTemp = List<FooterInvestorsData>.from(result.map((e) => FooterInvestorsData.fromJson(e)));
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
