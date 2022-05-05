import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'store/investors_store.dart';

class CompanyInformation extends StatefulWidget {
  const CompanyInformation({Key? key}) : super(key: key);

  @override
  State<CompanyInformation> createState() => _CompanyInformationState();
}

class _CompanyInformationState extends State<CompanyInformation> {
  final investorsStore = InvestorsStore();

  @override
  void initState() {
    investorsStore.extractCompanyInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
                investorsStore.companyInformationList.length, (index) {
              return Card(
                color: Colors.blueAccent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: [
                            Text(investorsStore.companyInformationList[index].header ??""),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(investorsStore
                                  .companyInformationList[index].bodyOne ??
                              ""),
                          Text(investorsStore
                                  .companyInformationList[index].bodyTwo ??
                              ""),
                          Text(investorsStore
                                  .companyInformationList[index].bodyThree ??
                              ""),
                          Text(investorsStore
                                  .companyInformationList[index].bodyFour ??
                              ""),
                          Text(investorsStore
                                  .companyInformationList[index].bodyFive ??
                              ""),
                          Text(investorsStore
                                  .companyInformationList[index].bodySix ??
                              ""),
                          Text(investorsStore
                                  .companyInformationList[index].bodySeven ??
                              ""),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          height: 250,
                          width: 500,
                          child: Image.network(investorsStore
                                  .companyInformationList[index].image?.url ??
                              "")),
                    ],
                  ),
                ),
              );
            }));
      },
    );
  }
}
