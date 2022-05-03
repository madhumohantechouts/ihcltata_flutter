import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:ihcltata/widgets/responsibility/data/responsibility.dart';
import 'package:ihcltata/widgets/responsibility/responsibilty_store.dart';

// import '../../network/sanity.dart';
// import '../../utils/constants.dart';
// import 'data/banner.dart';

class ResponsibilityDescription extends StatefulWidget {
  const ResponsibilityDescription({Key? key}) : super(key: key);

  // final String title;
  @override
  State<ResponsibilityDescription> createState() =>
      _ResponsibilityDescriptionState();
}

class _ResponsibilityDescriptionState extends State<ResponsibilityDescription> {
  // bool loader=false;
  // var title = "";
  // var descripition = "";

  // List<Responsibility> dataList = [];
  final responsibility = ResponsibiltyStore();

  @override
  void initState() {
    responsibility.getDescription();
    super.initState();
  }

  double thickness = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 30, 0, 0),
          child: Align(
            alignment: Alignment.center,
            // child: Text(
            //   title,
            //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            // ),
            child: Observer(
              builder: (_) => Text(
                responsibility.title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        const Divider(
          thickness: 2,
          // thickness of the line

          indent: 170,
          // empty space to the leading edge of divider.

          endIndent: 135,
          // empty space to the trailing edge of the divider.

          color: Colors.black,
          // The color to use when painting the line.

          height: 20, // The divider's height extent.
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10, 5, 5),
          child: Align(
            alignment: Alignment.topLeft,

            // Text(descripition),
            child: Observer(
              builder: (_) => Text(
                responsibility.descrip,
                style: const TextStyle(fontSize: 15),
              ),
            ),
          ),
        ),
      ]
          // Text("Id :.." + id),
          ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
