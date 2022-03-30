import 'package:flutter/material.dart';

import '../ui_components/drawerfile.dart';

class Careers extends StatefulWidget {
  const Careers({Key? key}) : super(key: key);

  @override
  State<Careers> createState() => _CareersState();
}

class _CareersState extends State<Careers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerFile(),
      appBar: AppBar(title: const Text('CAREERS')),
      body: const Center(
        child: Text(
          'CAREERS',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
