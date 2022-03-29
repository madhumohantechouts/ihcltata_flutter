import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'screens/homescreen.dart';
import 'state/drawer_state_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: providers,
    child: const MyApp(),
  ),);
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<DrawerStateProvider>(create: (_) => DrawerStateProvider()),
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IHCL',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}