import 'package:flutter/material.dart';

import '../ui_components/drawerfile.dart';
import '../widgets/shoppersStop/main_carousel.dart';


class ShoppersStop extends StatefulWidget {
  const ShoppersStop({Key? key}) : super(key: key);

  @override
  State<ShoppersStop> createState() => _ShoppersStopState();
}

class _ShoppersStopState extends State<ShoppersStop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerFile(),
      appBar: AppBar(
        title: const Text('SHOPPERS STOP'),),
      body: ListView(
        children: const <Widget>[
          MainCarousel(),
        ],
      ),
    );
  }
}
