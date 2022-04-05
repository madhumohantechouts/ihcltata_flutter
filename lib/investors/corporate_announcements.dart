import 'package:flutter/material.dart';

import '../network/sanity.dart';
import '../utils/constants.dart';
import 'json/company_announcements.dart';

class CorporateAnnouncements extends StatefulWidget {
  const CorporateAnnouncements({Key? key}) : super(key: key);

  @override
  State<CorporateAnnouncements> createState() => _CorporateAnnouncementsState();
}

class _CorporateAnnouncementsState extends State<CorporateAnnouncements> {

  final SanityClient sanityClient = SanityClient(
    projectId: projectId,
    dataset: dataSet,
    useCdn: useCdn,
  );
  List<CompanyAnnouncementsJSON> dataList = [];

  void _extractcompanyannouncements() async {
    const String query = '*[_type in ["corporateAnnouncement"]]{headerOne,bodyOne,bodyOneO,headerTwo,bodyTwo}';
    List<dynamic> result = await sanityClient.fetch(query: query);
    List<CompanyAnnouncementsJSON> dataListTemp = List<
        CompanyAnnouncementsJSON>.from(
        result.map((e) => CompanyAnnouncementsJSON.fromJson(e)));

    setState(() {
      dataList = dataListTemp;
    });
  }

  @override
  Widget build(BuildContext context) {
    _extractcompanyannouncements();
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(dataList.length, (index) {
          return Card(
            color: Colors.orange,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  children: [
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
              Text(dataList[index].headerOne ?? ""),
              Text(dataList[index].bodyOne ?? ""),
              Text(dataList[index].bodyOneO ?? ""),
              Text(dataList[index].headerTwo ?? ""),
              Text(dataList[index].bodyTwo ?? ""),
            ]),
            ],
          ),)
          ,
          );
        }));
  }
}
