import 'package:flutter/material.dart';

class DrawerListItem extends StatelessWidget {
  DrawerListItem(this.title, this.param1);
String title;
Function() param1;


  // final VoidCallback onPresssed;
  // final void Function()? onPresssed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget>[
        ListTile(
          title: Text(title),
         onTap:param1,
        ),
        const Divider(
          thickness: 0.5, // thickness of the line
          indent: 20, // empty space to the leading edge of divider.
          endIndent: 20, // empty space to the trailing edge of the divider.
          color: Colors.black, // The color to use when painting the line.
          height: 1, // The divider's height extent.
        ),
      ],
    );
  }
}
