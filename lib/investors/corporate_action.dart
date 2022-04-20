import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:ihcltata/investors/json/corporate_action_json.dart';
import 'package:ihcltata/investors/store/investors_store.dart';
// import 'package:ihcltata/network/sanity.dart';
// import 'package:ihcltata/utils/constants.dart';

class CorporateAction extends StatefulWidget {
  const CorporateAction({Key? key}) : super(key: key);

  @override
  State<CorporateAction> createState() => _CorporateActionState();
}

class _CorporateActionState extends State<CorporateAction> {
/*
  final SanityClient sanityClient = SanityClient(
    projectId: projectId,
    dataset: dataSet,
    useCdn: useCdn,
  );
  List<CorporateActionJSON> dataList = [];

  void _extractCorporateAction() async {
    const String query =
        '*[_type in ["corporateAction"]]{bodyOneA,bodyOneB,bodyTwoA,bodyTwoB,bodyTwoC,headOne,headOneD,headTwo}';
    List<dynamic> result = await sanityClient.fetch(query: query);
    List<CorporateActionJSON> dataListTemp = List<CorporateActionJSON>.from(
        result.map((e) => CorporateActionJSON.fromJson(e)));

    setState(() {
      dataList = dataListTemp;
    });
  }
*/

  final investorsStore = InvestorsStore();

  @override
  void initState() {
    investorsStore.extractCorporateAction();
    // _extractCorporateAction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /*_extractCorporateAction();*/
    return Observer(
      builder: (BuildContext context) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(investorsStore.corporateActionList.length,
                (index) {
              //   children: List.generate(dataList.length, (index) {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(8.0),
                  itemCount: investorsStore.corporateActionList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return investorsStore.corporateActionList.isEmpty
                        ? Container()
                        : itemBuild(context, index);
                  });
            }));
      },
    );
  }

  itemBuild(BuildContext context, int index) {
    return Card(
      color: Colors.yellow,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(dataList[index].headTwo ?? ""),
                Text(investorsStore.corporateActionList[index].bodyOneA ?? ""),
                Text(investorsStore.corporateActionList[index].bodyOneB ?? ""),
                Text(investorsStore.corporateActionList[index].bodyTwoA ?? ""),
                Text(investorsStore.corporateActionList[index].bodyTwoB ?? ""),
                Text(investorsStore.corporateActionList[index].bodyTwoC ?? ""),
                Text(investorsStore.corporateActionList[index].headOne ?? ""),
                Text(investorsStore.corporateActionList[index].headOneD ?? ""),
                Text(investorsStore.corporateActionList[index].headTwo ?? ""),
                Text(investorsStore.corporateActionList[index].headTwo ?? ""),
                // Text(dataList[index].headTwo ?? ""),
              ],
            )
          ],
        ),
      ),
    );
  }
}
