import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ihcltata/brands/brands_widgets/brands_store.dart';

import '../../../network/sanity.dart';
import '../../../utils/constants.dart';
import '../brands_data/expression_data.dart';

class Expressions extends StatefulWidget {
  const Expressions({
    Key? key,
  }) : super(key: key);
  @override
  State<Expressions> createState() => _ExpressionsState();
}

class _ExpressionsState extends State<Expressions> {
  int current = 0;
  // bool loader=false;

  final expression = BrandsStore();
  @override
  void initState() {
    // TODO: implement initState
    expression.getExpression();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    itemBuild(BuildContext context, int index) {
      return Container(
        height: 600,
        width: 320,
        child: Column(
          children: <Widget>[
            Image(
              fit: BoxFit.fill,
              image: NetworkImage(
                  expression.expressionList[index].coverImage?.url ?? ""),
              height: 300,
              width: 300,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 10),
            //   child: Text(
            //     dataList[index].title ?? "",
            //     style: TextStyle(fontSize: 12),
            //   ),
            // ),
            Row(
              // use whichever suits your need
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 10, top: 10, left: 10),
                      child: Text(
                        expression.expressionList[index].title ?? "",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 5),
                      child: Text(
                        expression.expressionList[index].subtitle ?? "",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 50, top: 5),
                  child: FlatButton(
                    color: Colors.blue[900],
                    child: Text(expression.expressionList[index].info ?? "",
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    var size = MediaQuery.of(context).size;
    return Container(
      height: 450,
      width: 500,
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: 500,
                height: 400,
                child: Observer(
                  builder: (_) => ListView.builder(
                    itemCount: expression.expressionList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return itemBuild(context, index);
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
