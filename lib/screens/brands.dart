import 'package:flutter/material.dart';

import '../ui_components/drawerfile.dart';

class Brands extends StatefulWidget {
  const Brands({Key? key}) : super(key: key);

  @override
  State<Brands> createState() => _BrandsState();
}

class _BrandsState extends State<Brands> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerFile(),
      appBar: AppBar(title: const Text('BRANDS')),
      body: const Center(
        child: Text(
          'BRANDS',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
