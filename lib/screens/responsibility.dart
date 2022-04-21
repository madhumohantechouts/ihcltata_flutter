import 'package:flutter/material.dart';
import 'package:ihcltata/ui_components/drawerfile.dart';
import 'package:ihcltata/widgets/responsibility/bannercarousel.dart';
// import 'package:ihcltata/widgets/responsibility/data/footer_joinusdata.dart';
// import 'package:ihcltata/widgets/responsibility/data/footer_responsibilitydata.dart';
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
class Responsibility extends StatefulWidget {
  const   Responsibility({Key? key}) : super(key: key);

  @override
  State<Responsibility> createState() => _ResponsibilityState();
}

class _ResponsibilityState extends State<Responsibility> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerFile(),
      appBar: AppBar(title: const Text('Responsibility'),),
      body: SizedBox(child: ListView(
        children:  <Widget>[
          BannerCarousel(),
          const ResponsibilityDescription() ,
          const ResponsibilitySoicalDescription(),
          const InititaivesAndImpact(),
          const PdfDownload(),
          const FooterBrands(),
          const FooterCompany(),
          const FooterInvestors(),
          const FooterComapny(),
          const  FooterResponsibility(),
          const Divider(
            height: 2,
            color: Colors.black,
          ),
          const FooterSiteMap(),
          const Divider(
            height: 2,
            color: Colors.black,
          ),
          const FooterjoinUs(),
        ],
      ),

      ),
    );
  }
}
