import 'package:flutter/material.dart';
import 'package:ihcltata/widgets/responsibility/bannercarousel.dart';
import 'package:ihcltata/widgets/responsibility/data/footer_joinusdata.dart';
import 'package:ihcltata/widgets/responsibility/data/footer_responsibilitydata.dart';
import 'package:ihcltata/widgets/responsibility/footer_Investors.dart';
import 'package:ihcltata/widgets/responsibility/footer_brands.dart';
import 'package:ihcltata/widgets/responsibility/footer_comapny.dart';
import 'package:ihcltata/widgets/responsibility/footer_joinUs.dart';
import 'package:ihcltata/widgets/responsibility/footer_responsibility.dart';
import 'package:ihcltata/widgets/responsibility/footer_sitemap.dart';
import 'package:ihcltata/widgets/responsibility/footerDevelopment.dart';
import 'package:ihcltata/widgets/responsibility/inititaivesandimpact.dart';
import 'package:ihcltata/widgets/responsibility/pdfdownload.dart';
import 'package:ihcltata/widgets/responsibility/responsibilitydescription.dart';
import 'package:ihcltata/widgets/responsibility/responsibilitysocialdescription.dart';
class BodyOne extends StatefulWidget {
  const BodyOne({Key? key}) : super(key: key);

  @override
  State<BodyOne> createState() => _BodyOneState();
}

class _BodyOneState extends State<BodyOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(child: ListView(
        children:  <Widget>[
          BannerCarousel(),
          ResponsibilityDescription() ,
          ResponsibilitySoicalDescription(),
          InititaivesAndImpact(),
          PdfDownload(),
          FooterBrands(),
          FooterCompany(),
          FooterInvestors(),
          FooterComapny(),
          FooterResponsibility(),
          Divider(
            height: 2,
            color: Colors.black,
          ),
          FooterSiteMap(),
          Divider(
            height: 2,
            color: Colors.black,
          ),
          FooterjoinUs(),
        ],
      ),

      ),
    );
  }
}
