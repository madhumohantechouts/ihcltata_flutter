import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../network/sanity.dart';
import '../../utils/constants.dart';
import '../brands_data/footerintro_data.dart';
import 'brands_store.dart';

class FooterIntro extends StatefulWidget {
  const FooterIntro({Key? key}) : super(key: key);

  @override
  State<FooterIntro> createState() => _FooterIntroState();
}

class _FooterIntroState extends State<FooterIntro> {
  final intro = BrandsStore();
  @override
  void initState() {
    intro.getIntro();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Observer(
          builder: (_) => Row(children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      intro.title,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      intro.brands,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(intro.brandsone,
                        style: TextStyle(color: Colors.black)),
                    Text(intro.brandstwo,
                        style: TextStyle(color: Colors.black)),
                    Text(intro.brandsthree,
                        style: TextStyle(color: Colors.black)),
                    Text(intro.brandsfour,
                        style: TextStyle(color: Colors.black)),
                    Text(intro.brandsfive,
                        style: TextStyle(color: Colors.black)),
                    Text(intro.company,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    Text(intro.companyone,
                        style: TextStyle(color: Colors.black)),
                    Text(intro.companytwo,
                        style: TextStyle(color: Colors.black)),
                    Text(intro.companythree,
                        style: TextStyle(color: Colors.black)),
                    Text(intro.companyfour,
                        style: TextStyle(color: Colors.black)),
                    Text(intro.investors,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    Text(intro.investorsOne,
                        style: TextStyle(color: Colors.black)),
                    Text(intro.investorstwo,
                        style: TextStyle(color: Colors.black)),
                    Text(intro.development,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    Text(intro.developmentone,
                        style: TextStyle(color: Colors.black)),
                  ]
                      .map((e) => Padding(
                            child: e,
                            padding: const EdgeInsets.symmetric(vertical: 5),
                          ))
                      .toList(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(intro.developmenttwo,
                        style: TextStyle(color: Colors.black)),
                    Text(intro.developmentthree,
                        style: TextStyle(color: Colors.black)),
                    Text(intro.developmentfour,
                        style: TextStyle(color: Colors.black)),
                    Text(intro.responsibility,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    Text(intro.responsibilityone,
                        style: TextStyle(color: Colors.black)),
                    Text(intro.responsibilitytwo,
                        style: TextStyle(color: Colors.black)),
                    Text(intro.carrer,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    Text(intro.carrerone,
                        style: TextStyle(color: Colors.black)),
                    Text(intro.carrertwo,
                        style: TextStyle(color: Colors.black)),
                    Text(intro.carrerthree,
                        style: TextStyle(color: Colors.black)),
                    Text(intro.carrerfour,
                        style: TextStyle(color: Colors.black)),
                    Text(intro.pressroom,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    Text(intro.pressroomone,
                        style: TextStyle(color: Colors.black)),
                    Text(intro.pressroomtwo,
                        style: TextStyle(color: Colors.black)),
                    Text(intro.contact,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    Text(intro.contactone,
                        style: TextStyle(color: Colors.black)),
                  ]
                      .map((e) => Padding(
                            child: e,
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 25),
                          ))
                      .toList(),
                )
              ])),
    );
  }
}
