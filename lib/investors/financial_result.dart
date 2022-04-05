import 'package:flutter/material.dart';

import '../network/sanity.dart';
import '../utils/constants.dart';
import 'json/financial_result_json.dart';

class FinancialResult extends StatefulWidget {
  const FinancialResult({Key? key}) : super(key: key);

  @override
  State<FinancialResult> createState() => _FinancialResultState();
}

class _FinancialResultState extends State<FinancialResult> {
  final SanityClient sanityClient = SanityClient(
    projectId: projectId,
    dataset: dataSet,
    useCdn: useCdn,
  );
  List<FinancialResultJSON> dataList = [];

  void _extractfinancialresult() async {
    const String query = '*[_type in ["financialResult"]]{bodyOneA,bodyOneB,bodyOneC,bodyTwoA,bodyTwoAO,bodyTwoB,bodyTwoBO,footer,headerOne,headerTwo}';
    List<dynamic> result = await sanityClient.fetch(query: query);
    List<FinancialResultJSON> dataListTemp = List<FinancialResultJSON>.from(
        result.map((e) => FinancialResultJSON.fromJson(e)));

    setState(() {
      dataList = dataListTemp;
    });
  }

  @override
  Widget build(BuildContext context) {
    _extractfinancialresult();
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(dataList.length, (index) {
          return Card(
            color: Colors.cyanAccent,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(dataList[index].bodyOneA ?? ""),
                      Text(dataList[index].bodyOneB ?? ""),
                      Text(dataList[index].bodyOneC ?? ""),
                      Text(dataList[index].bodyTwoA ?? ""),
                      Text(dataList[index].bodyTwoAO ?? ""),
                      Text(dataList[index].bodyTwoB ?? ""),
                      Text(dataList[index].bodyTwoBO ?? ""),
                      Text(dataList[index].footer ?? ""),
                      Text(dataList[index].headerOne ?? ""),
                      Text(dataList[index].headerTwo ?? ""),
                    ],
                  )
                ],
              ),
            ),
          );
        }));
  }
}
