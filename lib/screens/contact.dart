import 'package:flutter/material.dart';

import '../ui_components/drawerfile.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerFile(),
      appBar: AppBar(title: const Text('CONTACT')),
      body: const Center(
        child: Text(
          'CONTACT',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
