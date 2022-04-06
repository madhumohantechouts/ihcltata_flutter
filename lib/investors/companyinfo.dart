import 'package:flutter/material.dart';

import '../network/sanity.dart';
import '../utils/constants.dart';
import 'json/company_information_json.dart';


class CompanyInformation extends StatefulWidget {
  const CompanyInformation({Key? key}) : super(key: key);

  @override
  State<CompanyInformation> createState() => _CompanyInformationState();
}

class _CompanyInformationState extends State<CompanyInformation> {
  final SanityClient sanityClient = SanityClient(
    projectId: projectId,
    dataset: dataSet,
    useCdn: useCdn,
  );
  List<CompanyInformationJSON> dataList = [];

  void _extractcompanyinfo() async {
    const String query = '*[_type in ["companyInformations"]]{header,bodyOne,bodyTwo,bodyThree,bodyFour,bodyFive,bodySix,bodySeven,image}';
    List<dynamic> result = await sanityClient.fetch(query: query);
    List<CompanyInformationJSON> dataListTemp = List<CompanyInformationJSON>.from(
        result.map((e) => CompanyInformationJSON.fromJson(e)));
    for (var element in dataListTemp) {
      var refId = element.image?.asset?.sRef;
      var parts = refId!.split('-');
      var id = parts[1];
      var format = parts[3];
      var size = parts[2];
      element.image?.url =
      "https://cdn.sanity.io/images/$projectId/$dataSet/$id-$size.$format";
    }

    setState(() {
      dataList = dataListTemp;
    });
  }

  @override
  Widget build(BuildContext context) {
    _extractcompanyinfo();
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(dataList.length, (index) {
          return Card(
            color: Colors.yellow,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(dataList[index].header ?? ""),
                      Text(dataList[index].bodyOne ?? ""),
                      Text(dataList[index].bodyTwo ?? ""),
                      Text(dataList[index].bodyThree ?? ""),
                      Text(dataList[index].bodyFour ?? ""),
                      Text(dataList[index].bodyFive ?? ""),
                      Text(dataList[index].bodySix ?? ""),
                      Text(dataList[index].bodySeven ?? ""),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(height: 250, width: 500, child: Image.network(dataList[index].image?.url ?? "")),
                ],
              ),
            ),
          );
        }));
  }
}
