import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ihcltata/investors/store/investors_store.dart';

class CorporateAnnouncements extends StatefulWidget {
  const CorporateAnnouncements({Key? key}) : super(key: key);

  @override
  State<CorporateAnnouncements> createState() => _CorporateAnnouncementsState();
}

class _CorporateAnnouncementsState extends State<CorporateAnnouncements> {

  final investorsStore = InvestorsStore();

  @override
  void initState() {
    investorsStore.extractCompanyAnnouncements();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(investorsStore.companyAnnouncementsList.length, (index) {
              return Card(
                color: Colors.orange,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(investorsStore.companyAnnouncementsList[index].headerOne ?? ""),
                            Text(investorsStore.companyAnnouncementsList[index].bodyOne ?? ""),
                            Text(investorsStore.companyAnnouncementsList[index].bodyOneO ?? ""),
                            Text(investorsStore.companyAnnouncementsList[index].headerTwo ?? ""),
                            Text(investorsStore.companyAnnouncementsList[index].bodyTwo ?? ""),
                          ]),
                    ],
                  ),)
                ,
              );
            }));
      },
    );
  }
}
