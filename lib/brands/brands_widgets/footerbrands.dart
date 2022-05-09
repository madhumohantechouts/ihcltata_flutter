import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../network/sanity.dart';
import '../../utils/constants.dart';

import '../brands_data/footerbrands_data.dart';
import 'brands_store.dart';
import 'gradient.dart';

class FooterBrands extends StatefulWidget {
  const FooterBrands({Key? key}) : super(key: key);

  @override
  State<FooterBrands> createState() => _FooterBrandsState();
}

class _FooterBrandsState extends State<FooterBrands> {
  final footerbrands = BrandsStore();

  @override
  void initState() {
    footerbrands.getFooterbrands();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Observer(
        builder: (_) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(footerbrands.subtitle,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Container(
              height: 30,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  GradientText(
                    footerbrands.taj,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    gradient: LinearGradient(colors: [
                      Colors.amber.shade400,
                      Colors.amber.shade900,
                    ]),
                  ),
                  GradientText(
                    footerbrands.seleqtions,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    gradient: LinearGradient(colors: [
                      Colors.blueAccent.shade400,
                      Colors.blueGrey.shade900,
                    ]),
                  ),
                  GradientText(
                    footerbrands.vivanta,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    gradient: LinearGradient(colors: [
                      Colors.indigo.shade700,
                      Colors.indigo.shade400,
                    ]),
                  ),
                  GradientText(
                    footerbrands.ginger,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    gradient: LinearGradient(colors: [
                      Colors.yellow.shade400,
                      Colors.deepOrangeAccent,
                      Colors.pinkAccent,
                    ]),
                  ),
                  GradientText(
                    footerbrands.ama,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    gradient: LinearGradient(colors: [
                      Colors.brown.shade400,
                      Colors.brown.shade900,
                    ]),
                  ),
                  GradientText(
                    footerbrands.qmin,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    gradient: LinearGradient(colors: [
                      Colors.redAccent.shade400,
                      Colors.redAccent.shade700,
                    ]),
                  ),
                  GradientText(
                    footerbrands.tajsats,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    gradient: LinearGradient(colors: [
                      Colors.amber.shade400,
                      Colors.amber.shade900,
                    ]),
                  ),
                ]
                    .map((e) => Padding(
                          child: e,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                        ))
                    .toList(),
              ),
            ),
            Text(
              footerbrands.footertitle,
              style: TextStyle(
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                footerbrands.copyright,
                style: TextStyle(color: Colors.black, height: 1.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
