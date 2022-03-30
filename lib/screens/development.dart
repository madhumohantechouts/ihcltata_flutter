import 'package:flutter/material.dart';

import '../ui_components/drawerfile.dart';

class Development extends StatefulWidget {
  const Development({Key? key}) : super(key: key);

  @override
  State<Development> createState() => _DevelopmentState();
}

class _DevelopmentState extends State<Development> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerFile(),
      appBar: AppBar(title: const Text('DEVELOPMENT')),
      body: const Center(
        child: Text(
          'DEVELOPMENT',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
