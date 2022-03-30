import 'package:flutter/material.dart';

import '../ui_components/drawerfile.dart';

class Responsibility extends StatefulWidget {
  const Responsibility({Key? key}) : super(key: key);

  @override
  State<Responsibility> createState() => _ResponsibilityState();
}

class _ResponsibilityState extends State<Responsibility> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerFile(),
      appBar: AppBar(title: const Text('RESPONSIBILITY')),
      body: const Center(
        child: Text(
          'RESPONSIBILITY',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
