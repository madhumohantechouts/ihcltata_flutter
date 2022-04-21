import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ihcltata/widgets/responsibility/data/inititaivesandimpactdata.dart';
import 'package:ihcltata/widgets/responsibility/responsibilty_store.dart';

import '../../network/sanity.dart';
import '../../utils/constants.dart';
class InititaivesAndImpact extends StatefulWidget {
  const InititaivesAndImpact({Key? key}) : super(key: key);

  @override
  State<InititaivesAndImpact> createState() => _InititaivesAndImpactState();
}

class _InititaivesAndImpactState extends State<InititaivesAndImpact> {

  final inititatives = ResponsibiltyStore();


  // final SanityClient sanityClient = SanityClient(
  //   projectId: projectId,
  //   dataset: dataSet,
  //   useCdn: useCdn,
  // );
  // List<InititaivesImpactData> dataList = [];
  @override
  void initState() {
    inititatives.getImpact();
    super.initState();
  }

  itemBuild(BuildContext context, int index) {
    return Column(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.topLeft,
              child:Text(inititatives.impactList[index].title??"",style:TextStyle(fontSize: 20,)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 5, 0),
          child: Align(
            // alignment: Alignment.center,
            child: Text(inititatives.impactList[index].text??"", style: TextStyle(fontSize: 15,)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 5, 0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(inititatives.impactList[index].text1??"", style: TextStyle(fontSize: 15,)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 5, 0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(inititatives.impactList[index].text2??"", style: TextStyle(fontSize: 15,)),
          ),
        ),

      ],

    );
  }
  @override
  Widget build(BuildContext context) {
   return Observer(
   builder: (_) =>ListView.builder(
   shrinkWrap: true,
   physics: NeverScrollableScrollPhysics(),
   padding: EdgeInsets.all(10),

   itemCount:inititatives.impactList.length,

   scrollDirection: Axis.vertical,

   itemBuilder: (context, index) {
      return inititatives.impactList.isEmpty ? Container() : itemBuild(context, index);

   }
   ),
   );
  }
}


