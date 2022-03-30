import 'package:flutter/material.dart';

import '../ui_components/drawerfile.dart';

class Company extends StatefulWidget {
  const Company({Key? key}) : super(key: key);

  @override
  State<Company> createState() => _CompanyState();
}

class _CompanyState extends State<Company> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerFile(),
      appBar: AppBar(title: const Text('COMPANY')),
      body: const Center(
        child: Text(
          'COMPANY',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
