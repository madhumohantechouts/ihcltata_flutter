import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ihcltata/widgets/investors/store/investors_store.dart';


class CorporateAction extends StatefulWidget {
  const CorporateAction({Key? key}) : super(key: key);

  @override
  State<CorporateAction> createState() => _CorporateActionState();
}

class _CorporateActionState extends State<CorporateAction> {
  final investorsStore = InvestorsStore();

  @override
  void initState() {
    investorsStore.extractCorporateAction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(investorsStore.corporateActionList.length,
                (index) {
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
