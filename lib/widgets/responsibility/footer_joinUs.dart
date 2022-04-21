import 'package:flutter/material.dart';

import '../../network/sanity.dart';
import '../../utils/constants.dart';
import 'data/footer_joinusdata.dart';
class FooterjoinUs extends StatefulWidget {
  const FooterjoinUs({Key? key}) : super(key: key);

  @override
  State<FooterjoinUs> createState() => _FooterjoinUsState();
}

class _FooterjoinUsState extends State<FooterjoinUs> {
  var btn="";
  var content="";
  List<FooterJoinusData> dataList=[];
  final SanityClient sanityClient = SanityClient(
    projectId: projectId,
    dataset: dataSet,
    useCdn: useCdn,
  );
  void getJoinus() async {
    // print("tapped");
    const String query = '*[_type == "joinUs"]';
    List<dynamic> result = await sanityClient.fetch(query: query);
    List<FooterJoinusData> dataListTemp = List<FooterJoinusData>.from(result.map((e) => FooterJoinusData.fromJson(e)));
    setState(() {
      btn=dataListTemp[0].btn!;
      content=dataListTemp[0].content!;

    });
  }
  @override
  void initState() {
    getJoinus();
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
                child:Text(content,style:TextStyle(fontSize: 15,)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 200, 0),
              child: RaisedButton(
                color:Colors.blueAccent,

                // alignment: Alignment.center,
                onPressed: () {  },
                child: Text(btn, style: TextStyle(fontSize: 10,color: Colors.white)),
              ),
            ),
            Divider(
              height: 2,
              color: Colors.black,
            )

          ]
      ),
    );
  }
}
