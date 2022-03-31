import 'package:flutter/material.dart';

import '../investors/carousel.dart';
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
        ],
      ),
    );
  }
}
