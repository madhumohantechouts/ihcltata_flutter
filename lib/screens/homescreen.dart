import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/drawer_state_provider.dart';
import '../ui_components/drawer_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final drawerstate = Provider.of<DrawerStateProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('IHCL')),
      body: const Center(
          child: Text(
        'A drawer is an invisible side screen.',
        style: TextStyle(fontSize: 20.0),
      )),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            const SizedBox(
              height: 100,
            ),
            ListView.builder(
              itemCount: 8,
              // scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return DrawerListItem(drawerstate.drawerList[index].title, ontap);
              },
            ),
          ],
        ),
      ),
    );
  }
}