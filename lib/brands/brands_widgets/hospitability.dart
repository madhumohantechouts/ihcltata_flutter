import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ihcltata/brands/brands_widgets/brands_store.dart';
import '../../../network/sanity.dart';
import '../../../utils/constants.dart';
import '../brands_data/hosbitability_data.dart';

class Hospitability extends StatefulWidget {
  const Hospitability({
    Key? key,
  }) : super(key: key);
  @override
  State<Hospitability> createState() => _HospitabilityState();
}

class _HospitabilityState extends State<Hospitability> {
  int current = 0;
  // bool loader=false;
  final hospitability = BrandsStore();
  @override
  void initState() {
    // TODO: implement initState
    hospitability.getHospital();
    super.initState();
  }

  itemBuild(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    hospitability.hospitabilityList[index].coverImage?.url ??
                        ""),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  hospitability.hospitabilityList[index].subtitle ?? "",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: EdgeInsets.only(
                  left: 15,
                ),
                child: Text(
                  hospitability.hospitabilityList[index].description ?? "",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      height: 1.5,
                      letterSpacing: 1.0),
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
              child: Column(
            children: <Widget>[
              Table(
                defaultColumnWidth: FixedColumnWidth(100.0),
                border: TableBorder.all(
                    color: Colors.black, style: BorderStyle.solid, width: 2),
                children: [
                  TableRow(
                    children: [
                      Column(children: [
                        Text(
                          hospitability.hospitabilityList[index].hotels
                              .toString(),
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(hospitability.hospitabilityList[index].hotel ?? "",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold))
                      ]),
                      Column(children: [
                        Text(
                            hospitability.hospitabilityList[index].keys
                                .toString(),
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.indigo,
                                fontWeight: FontWeight.bold)),
                        Text(hospitability.hospitabilityList[index].key ?? "",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold))
                      ]),
                      Column(children: [
                        Text(
                            hospitability.hospitabilityList[index].destinations
                                .toString(),
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.indigo,
                                fontWeight: FontWeight.bold)),
                        Text(
                            hospitability
                                    .hospitabilityList[index].destination ??
                                "",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold))
                      ]),
                    ]
                        .map((e) => Padding(
                              child: e,
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ],
          )),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: FlatButton(
                color: Colors.blue[900],
                child: Text(hospitability.hospitabilityList[index].info ?? "",
                    style: TextStyle(color: Colors.white)),
                onPressed: () {
                  setState(() {});
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Observer(
      builder: (_) => ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 10,
          );
        },
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(20),
        itemCount: hospitability.hospitabilityList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return hospitability.hospitabilityList.isEmpty
              ? Container()
              : itemBuild(context, index);
        },
      ),
    );
  }
}
