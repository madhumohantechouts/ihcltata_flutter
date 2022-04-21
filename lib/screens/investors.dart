import 'package:flutter/material.dart';

import '../ui_components/drawerfile.dart';
import '../widgets/investors/agm.dart';
import '../widgets/investors/carousel.dart';
import '../widgets/investors/companyinfo.dart';
import '../widgets/investors/corporate_action.dart';
import '../widgets/investors/corporate_announcements.dart';
import '../widgets/investors/financial_result.dart';

class Investors extends StatefulWidget {
  const Investors({Key? key}) : super(key: key);

  @override
  State<Investors> createState() => _InvestorsState();
}

class _InvestorsState extends State<Investors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerFile(),
      appBar: AppBar(title: const Text('INVESTORS')),
      body: ListView(
        children: const <Widget>[
          Carousel(),
          CompanyInformation(),
          CorporateAnnouncements(),
          AGM(),
          FinancialResult(),
          CorporateAction(),
        ],
      ),
    );
  }
}
