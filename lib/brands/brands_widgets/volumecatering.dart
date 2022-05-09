// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ihcltata/brands/brands_widgets/brands_store.dart';
import '../../../network/sanity.dart';
import '../../../utils/constants.dart';
import '../brands_data/volumecatering_data.dart';

class VolumeCatering extends StatefulWidget {
  const VolumeCatering({
    Key? key,
  }) : super(key: key);
  @override
  State<VolumeCatering> createState() => _VolumeCateringState();
}

class _VolumeCateringState extends State<VolumeCatering> {
  int current = 0;
  // bool loader=false;
  final volume = BrandsStore();
  @override
  void initState() {
    // TODO: implement initState
    volume.getVolume();
    super.initState();
  }


  itemBuild(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height:5),
          Text(volume.volumeList[index].title ?? "",style:TextStyle(fontSize:20,fontWeight: FontWeight.bold)),
          SizedBox(height:5),
          const Divider(
            thickness: 2, // thickness of the line
            indent: 120, // empty space to the leading edge of divider.
            endIndent: 145, // empty space to the trailing edge of the divider.
            color: Colors.black, // The color to use when painting the line.
            height: 1, // The divider's height extent.
          ),
          Container(
            height: 200,
            width: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    volume.volumeList[index].coverImage?.url ??
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
                 volume.volumeList[index].subtitle ?? "",
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
                 volume.volumeList[index].description ?? "",
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
                              volume.volumeList[index].cities
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(volume.volumeList[index].city ?? "",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            Text(
                                volume.volumeList[index].days
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.bold)),
                            Text(volume.volumeList[index].day?? "",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            Text(
                                volume.volumeList[index].markets
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.bold)),
                            Text(
                                volume
                                    .volumeList[index].market ??
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
                child: Text(volume.volumeList[index].info ?? "",
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
        itemCount: volume.volumeList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return volume.volumeList.isEmpty
              ? Container()
              : itemBuild(context, index);
        },
      ),
    );
  }
}


