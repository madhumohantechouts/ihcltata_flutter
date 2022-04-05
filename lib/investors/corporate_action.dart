import 'package:flutter/material.dart';

import '../network/sanity.dart';
import '../utils/constants.dart';
import 'json/corporate_action_json.dart';

class CorporateAction extends StatefulWidget {
  const CorporateAction({Key? key}) : super(key: key);

  @override
  State<CorporateAction> createState() => _CorporateActionState();
}

class _CorporateActionState extends State<CorporateAction> {
  final SanityClient sanityClient = SanityClient(
    projectId: projectId,
    dataset: dataSet,
    useCdn: useCdn,
  );
  List<CorporateActionJSON> dataList = [];

  void _extractCorporateAction() async {
    const String query = '*[_type in ["corporateAction"]]{bodyOneA,bodyOneB,bodyTwoA,bodyTwoB,bodyTwoC,headOne,headOneD,headTwo}';
    List<dynamic> result = await sanityClient.fetch(query: query);
    List<CorporateActionJSON> dataListTemp = List<CorporateActionJSON>.from(
        result.map((e) => CorporateActionJSON.fromJson(e)));

    setState(() {
      dataList = dataListTemp;
    });
  }

  @override
  Widget build(BuildContext context) {
    _extractCorporateAction();
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(dataList.length, (index) {
          return Card(
            color: Colors.yellow,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(dataList[index].bodyOneA ?? ""),
                      Text(dataList[index].bodyOneB ?? ""),
                      Text(dataList[index].bodyTwoA ?? ""),
                      Text(dataList[index].bodyTwoB ?? ""),
                      Text(dataList[index].bodyTwoC ?? ""),
                      Text(dataList[index].headOne ?? ""),
                      Text(dataList[index].headOneD ?? ""),
                      Text(dataList[index].headTwo ?? ""),
                    ],
                  )
                ],
              ),
            ),
          );
        }));
  }
}
