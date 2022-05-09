import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ihcltata/brands/brands_widgets/underfooter.dart';
import 'package:ihcltata/brands/brands_widgets/volumecatering.dart';
import 'carousel.dart';
import 'expression.dart';
import 'footerbrands.dart';
import 'footerintro.dart';
import 'hospitability.dart';
import 'newsletter.dart';
import 'otherservices.dart';
import 'ourbrands.dart';

class Ihclbrands extends StatefulWidget {
  @override
  _IhclbrandsState createState() => _IhclbrandsState();
}

class _IhclbrandsState extends State<Ihclbrands> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const <Widget>[
          Brands(),
          OurBrands(),
          Hospitability(),
          VolumeCatering(),
          Expressions(),
          OtherServices(),
          FooterIntro(),
          Divider(
            color: Colors.black,
          ),
          UnderFooter(),
          Divider(
            color: Colors.black,
          ),
          NewsLetter(),
          Divider(
            color: Colors.black,
          ),
          FooterBrands(),
        ],
      ),
    );
  }
}
