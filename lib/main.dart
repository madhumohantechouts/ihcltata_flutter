import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'screens/brands.dart';
import 'screens/careers.dart';
import 'screens/company.dart';
import 'screens/contact.dart';
import 'screens/development.dart';
import 'screens/homescreen.dart';
import 'screens/investors.dart';
import 'screens/pressroom.dart';
import 'screens/responsibility.dart';
import 'screens/shoppers_stop.dart';

import 'state/drawer_state_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: providers,
      child: const MyApp(),
    ),
  );
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<DrawerStateProvider>(
      create: (_) => DrawerStateProvider()),
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'IHCL',
        home: const HomeScreen(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          "home": (_) => const HomeScreen(),
          "brands": (_) => const Brands(),
          "company": (_) => const Company(),
          "investors": (_) => const Investors(),
          "development": (_) => const Development(),
          "responsibility": (_) => const Responsibility(),
          "careers": (_) => const Careers(),
          "pressroom": (_) => const PressRoom(),
          "contact": (_) => const Contact(),
          "shoppersStop": (_) => const ShoppersStop(),
        });
  }
}