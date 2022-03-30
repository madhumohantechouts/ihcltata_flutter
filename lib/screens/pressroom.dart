import 'package:flutter/material.dart';

import '../ui_components/drawerfile.dart';

class PressRoom extends StatefulWidget {
  const PressRoom({Key? key}) : super(key: key);

  @override
  State<PressRoom> createState() => _PressRoomState();
}

class _PressRoomState extends State<PressRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerFile(),
      appBar: AppBar(title: const Text('PRESSROOM')),
      body: const Center(
        child: Text(
          'PRESSROOM',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
