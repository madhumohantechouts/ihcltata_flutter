import 'package:flutter/material.dart';
import 'package:ihcltata/widgets/responsibility/data/inititaivesandimpactdata.dart';

import '../../network/sanity.dart';
import '../../utils/constants.dart';
class InititaivesAndImpact extends StatefulWidget {
  const InititaivesAndImpact({Key? key}) : super(key: key);

  @override
  State<InititaivesAndImpact> createState() => _InititaivesAndImpactState();
}

class _InititaivesAndImpactState extends State<InititaivesAndImpact> {
  var text = "";
  var text1 = "";
  var text2= "";
  var title="";
  List<InititaivesImpactData> dataList=[];


  final SanityClient sanityClient = SanityClient(
    projectId: projectId,
    dataset: dataSet,
    useCdn: useCdn,
  );
  // List<InititaivesImpactData> dataList = [];
  void getDescription() async {
    // print("tapped");
    const String query = '*[_type == "hrcard"]';
    List<dynamic> result = await sanityClient.fetch(query: query);
    List<InititaivesImpactData> dataListTemp = List<InititaivesImpactData>.from(result.map((e) => InititaivesImpactData.fromJson(e)));
  //  print(dataListTemp);
    setState(() {
      dataList=dataListTemp;
    });
  }
  itemBuild(BuildContext context, int index) {
    return Column(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.topLeft,
              child:Text(dataList[index].title??"",style:TextStyle(fontSize: 20,)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 5, 0),
          child: Align(
            // alignment: Alignment.center,
            child: Text(dataList[index].text??"", style: TextStyle(fontSize: 15,)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 5, 0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(dataList[index].text1??"", style: TextStyle(fontSize: 15,)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 5, 0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(dataList[index].text2??"", style: TextStyle(fontSize: 15,)),
          ),
        ),

      ],

    );
  }
  @override
  void initState() {
    getDescription();
    super.initState();
  }  @override
  Widget build(BuildContext context) {
   return ListView.builder(
       shrinkWrap: true,
       physics: NeverScrollableScrollPhysics(),
       padding: EdgeInsets.all(10),

       itemCount:dataList.length,

       scrollDirection: Axis.vertical,

       itemBuilder: (context, index) {
          return dataList.isEmpty ? Container() : itemBuild(context, index);

       }
   );
  }
}


