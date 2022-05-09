import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ihcltata/brands/brands_widgets/brands_store.dart';

import '../../network/sanity.dart';
import '../../utils/constants.dart';
import '../brands_data/underfooter_data.dart';

class UnderFooter extends StatefulWidget {
  const UnderFooter({Key? key}) : super(key: key);

  @override
  State<UnderFooter> createState() => _UnderFooterState();
}

class _UnderFooterState extends State<UnderFooter> {
  final under = BrandsStore();
  @override
  void initState() {
    under.getUnder();
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
                      under.sitemap,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(under.accessibility,
                        style: TextStyle(color: Colors.black)),
                    Text(under.language, style: TextStyle(color: Colors.black)),
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
                    Text(under.privacypolicy,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    Text(under.termsofuse,
                        style: TextStyle(color: Colors.black)),
                  ]
                      .map((e) => Padding(
                            child: e,
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 75),
                          ))
                      .toList(),
                )
              ])),
    );
  }
}
