import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'store/investors_store.dart';

class AGM extends StatefulWidget {
  const AGM({Key? key}) : super(key: key);

  @override
  State<AGM> createState() => _AGMState();
}

class _AGMState extends State<AGM> {

  final investorsStore = InvestorsStore();

  @override
  void initState() {
    investorsStore.extractAGM();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(investorsStore.agmList.length, (index) {
              return Card(
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(investorsStore.agmList[index].bodyOne ?? ""),
                          Text(investorsStore.agmList[index].bodyTwo ?? ""),
                          Text(investorsStore.agmList[index].bodyThree ?? ""),
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
