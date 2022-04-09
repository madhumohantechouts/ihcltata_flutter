import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ihcltata/widgets/responsibility/data/responsibility.dart';

import '../../network/sanity.dart';
import '../../utils/constants.dart';
import 'data/banner.dart';
class ResponsibilityDescription extends StatefulWidget {
  const ResponsibilityDescription({Key? key}) : super(key: key);
  // final String title;
  @override
  State<ResponsibilityDescription> createState() => _ResponsibilityDescriptionState();
}

class _ResponsibilityDescriptionState extends State<ResponsibilityDescription> {
  // bool loader=false;
  var title = "";
  var descripition = "";

  final SanityClient sanityClient = SanityClient(
    projectId: projectId,
    dataset: dataSet,
    useCdn: useCdn,
  );
  List<Responsibility> dataList = [];
  void getDescription() async {
    // print("tapped");
    const String query = '*[_type == "bordernone"]';
    List<dynamic> result = await sanityClient.fetch(query: query);
    List<Responsibility> dataListTemp = List<Responsibility>.from(result.map((e) => Responsibility.fromJson(e)));
    setState(() {
      title = dataListTemp[0].title!;
      descripition = dataListTemp[0].descripition!;
      print(descripition);
    });
  }
@override
  void initState() {
    getDescription();
    super.initState();
  }
  double thickness = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0,30,0,0),
              child: Align(
                alignment: Alignment.center,
                child:Text(title,style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),


              ),



              ),
            Divider(

              thickness: 2, // thickness of the line

              indent: 170, // empty space to the leading edge of divider.

              endIndent: 135, // empty space to the trailing edge of the divider.

              color: Colors.black, // The color to use when painting the line.

              height: 20, // The divider's height extent.

            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0,10,5,5),
              child: Align(
                alignment: Alignment.topLeft,
                child:Text(descripition,style:TextStyle(fontSize: 15,
                    height:1.5 ,// the height between text, default is 1.0
                     )),
              ),
            ),
            // Text(descripition),
          ]
        // Text("Id :.." + id),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.

    );
  }
}
