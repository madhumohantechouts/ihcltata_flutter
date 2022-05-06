// ignore_for_file: file_names, prefer_const_constructors, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:ihcltata/state/drawer_state_provider.dart';
import 'package:provider/provider.dart';

import 'drawer_list_item.dart';

class DrawerFile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final drawerstate =
        Provider.of<DrawerStateProvider>(context, listen: false);
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(
            height: 100,
          ),
          ListView.builder(
            itemCount: 10,
            // scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return DrawerListItem(drawerstate.drawerList[index].title, () {
                switch (index) {
                  case 0:
                    drawerstate.setCurrentDrawer(0);
                    Navigator.popAndPushNamed(context, "home");
                    break;

                  case 1:
                    drawerstate.setCurrentDrawer(1);
                    Navigator.popAndPushNamed(context, "brands");
                    break;

                  case 2:
                    drawerstate.setCurrentDrawer(2);
                    Navigator.popAndPushNamed(context, "company");
                    break;

                  case 3:
                    drawerstate.setCurrentDrawer(3);
                    Navigator.popAndPushNamed(context, "investors");
                    break;

                  case 4:
                    drawerstate.setCurrentDrawer(4);
                    Navigator.popAndPushNamed(context, "development");
                    break;

                  case 5:
                    drawerstate.setCurrentDrawer(5);
                    Navigator.popAndPushNamed(context, "responsibility");
                    break;

                  case 6:
                    drawerstate.setCurrentDrawer(6);
                    Navigator.popAndPushNamed(context, "careers");
                    break;

                  case 7:
                    drawerstate.setCurrentDrawer(7);
                    Navigator.popAndPushNamed(context, "pressroom");
                    break;

                  case 8:
                    drawerstate.setCurrentDrawer(8);
                    Navigator.popAndPushNamed(context, "contact");
                    break;

                  case 9:
                    drawerstate.setCurrentDrawer(9);
                    Navigator.popAndPushNamed(context, "shoppersStop");
                    break;
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
