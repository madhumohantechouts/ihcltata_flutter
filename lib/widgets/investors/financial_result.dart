import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'store/investors_store.dart';

class FinancialResult extends StatefulWidget {
  const FinancialResult({Key? key}) : super(key: key);

  @override
  State<FinancialResult> createState() => _FinancialResultState();
}

class _FinancialResultState extends State<FinancialResult> {

  final investorsStore = InvestorsStore();

  @override
  void initState() {
    investorsStore.extractFinancialResult();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(investorsStore.financialResultList.length, (index) {
              return Card(
                color: Colors.cyanAccent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(investorsStore.financialResultList[index].bodyOneA ?? ""),
                          Text(investorsStore.financialResultList[index].bodyOneB ?? ""),
                          Text(investorsStore.financialResultList[index].bodyOneC ?? ""),
                          Text(investorsStore.financialResultList[index].bodyTwoA ?? ""),
                          Text(investorsStore.financialResultList[index].bodyTwoAO ?? ""),
                          Text(investorsStore.financialResultList[index].bodyTwoB ?? ""),
                          Text(investorsStore.financialResultList[index].bodyTwoBO ?? ""),
                          Text(investorsStore.financialResultList[index].footer ?? ""),
                          Text(investorsStore.financialResultList[index].headerOne ?? ""),
                          Text(investorsStore.financialResultList[index].headerTwo ?? ""),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }));
      },
    );
  }
}
