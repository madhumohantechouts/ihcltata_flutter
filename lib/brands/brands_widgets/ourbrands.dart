import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ihcltata/brands/brands_widgets/brands_store.dart';
import '../../../network/sanity.dart';
import '../../../utils/constants.dart';
import '../brands_data/ourbrands_data.dart';

class OurBrands extends StatefulWidget {
  const OurBrands({Key? key}) : super(key: key);
  // final String title;
  @override
  State<OurBrands> createState() => _OurBrandsState();
}

class _OurBrandsState extends State<OurBrands> {
  // bool loader=false;
  final brands = BrandsStore();

  @override
  void initState() {
    brands.getDescription();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: [
        //Padding(
        //padding: const EdgeInsets.fromLTRB(10, 15, 0, 5),
        //child:
        Align(
          alignment: Alignment.center,
          child: Observer(
            builder: (_) => Text(brands.heading,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
        ),
        SizedBox(height:5),
        const Divider(
          thickness: 2, // thickness of the line
          indent: 150, // empty space to the leading edge of divider.
          endIndent: 155, // empty space to the trailing edge of the divider.
          color: Colors.black, // The color to use when painting the line.
          height: 1, // The divider's height extent.
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10, 5, 10),
          child: Align(
            alignment: Alignment.topLeft,
            child: Observer(
              builder: (_) => Text(brands.description,
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.5,
                  )),
            ),
          ),
        ),
      ]),
    );
  }
}
