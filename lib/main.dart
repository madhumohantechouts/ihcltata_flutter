import 'package:flutter/material.dart';
import 'package:ihcltata/resposibility.dart';
import 'package:ihcltata/widgets/responsibility/responsibilitydescription.dart';
import '../widgets/responsibility/bannercarousel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IHCL',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ihcl'.toUpperCase()),
          backgroundColor: Colors.indigo,
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 0, 0, 0),
            child: new IconButton(
                onPressed: () {}, icon: new Icon(Icons.format_align_justify)),
          ),
        ),
        body: Responsibility());
  }
}
