import 'package:flutter/material.dart';

import '../network/sanity.dart';
import '../utils/constants.dart';
import 'json/agm_json.dart';

class AGM extends StatefulWidget {
  const AGM({Key? key}) : super(key: key);

  @override
  State<AGM> createState() => _AGMState();
}

class _AGMState extends State<AGM> {
  final SanityClient sanityClient = SanityClient(
    projectId: projectId,
    dataset: dataSet,
    useCdn: useCdn,
  );
  List<AGMJSON> dataList = [];

  void _extractAGM() async {
    const String query = '*[_type in ["agms"]]{bodyOne,bodyTwo,bodyThree}';
    List<dynamic> result = await sanityClient.fetch(query: query);
    List<AGMJSON> dataListTemp =
        List<AGMJSON>.from(result.map((e) => AGMJSON.fromJson(e)));

    setState(() {
      dataList = dataListTemp;
    });
  }

  @override
  Widget build(BuildContext context) {
    _extractAGM();
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(dataList.length, (index) {
          return Card(
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(dataList[index].bodyOne ?? ""),
                      Text(dataList[index].bodyTwo ?? ""),
                      Text(dataList[index].bodyThree ?? ""),
                    ],
                  )
                ],
              ),
            ),
          );
        }));
  }
}
