import 'package:flutter/material.dart';

import '../../network/sanity.dart';
import '../../utils/constants.dart';
import 'data/corporatesocialresponsiblitydata.dart';
class ResponsibilitySoicalDescription extends StatefulWidget {
  const ResponsibilitySoicalDescription({Key? key}) : super(key: key);

  @override
  State<ResponsibilitySoicalDescription> createState() => _ResponsibilitySoicalDescriptionState();
}

class _ResponsibilitySoicalDescriptionState extends State<ResponsibilitySoicalDescription> {

  final SanityClient sanityClient = SanityClient(
    projectId: projectId,
    dataset: dataSet,
    useCdn: useCdn,
  );
  List<CorporateSocialResponsibilityData> dataList = [];

  void getCounter() async {
    const String query = '*[_type == "contact"]';
    /*setState(() {
      // loader=true;
    });*/

    List<dynamic> result = await sanityClient.fetch(query: query);
    /*setState(() {
      // loader=false;
    });*/

    List<CorporateSocialResponsibilityData> dataListTemp = List<
        CorporateSocialResponsibilityData>.from(
        result.map((e) => CorporateSocialResponsibilityData.fromJson(e)));
    dataListTemp.forEach((element) {
      var refId = element.image?.asset?.sRef;
      var parts = refId!.split('-');
      var id = parts[1];
      var format = parts[3];
      var size = parts[2];
      element.image?.url =
      "https://cdn.sanity.io/images/$projectId/$dataSet/$id-$size.$format";
    });

    setState(() {
      dataList = dataListTemp;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    getCounter();
    super.initState();
  }
  itemBuild(BuildContext context, int index) {
    return Column(
      children: [
        Container(
          height: 300,
          width: 390,
          decoration: BoxDecoration(
            image: DecorationImage(

              image: NetworkImage(dataList[index].image?.url ?? ""),
              fit: BoxFit.fill,
            ),
          ),
        ),
              Divider(
                color: Colors.white,
                thickness: 10,
                height: 2,
              ),

        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Align(
            alignment: Alignment.topLeft,
            child:Text(dataList[index].title??"",style:TextStyle(fontSize: 20,)),
          ),
        ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(dataList[index].text ?? "",
                ),
              )
            ],
    );
  }
  @override
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
