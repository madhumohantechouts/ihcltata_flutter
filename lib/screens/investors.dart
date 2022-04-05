import 'package:flutter/material.dart';

import '../investors/agm.dart';
import '../investors/carousel.dart';
import '../investors/companyinfo.dart';
import '../investors/corporate_action.dart';
import '../investors/corporate_announcements.dart';
import '../investors/financial_result.dart';
import '../ui_components/drawerfile.dart';

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
