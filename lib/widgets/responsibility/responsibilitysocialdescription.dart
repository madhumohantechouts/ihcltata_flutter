import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ihcltata/widgets/responsibility/responsibilty_store.dart';

import '../../network/sanity.dart';
import '../../utils/constants.dart';
import 'data/corporatesocialresponsiblitydata.dart';
class ResponsibilitySoicalDescription extends StatefulWidget {
  const ResponsibilitySoicalDescription({Key? key}) : super(key: key);

  @override
  State<ResponsibilitySoicalDescription> createState() => _ResponsibilitySoicalDescriptionState();
}

class _ResponsibilitySoicalDescriptionState extends State<ResponsibilitySoicalDescription> {
  final responsibilitydescrip = ResponsibiltyStore();


  @override
  void initState() {
    // TODO: implement initState
    responsibilitydescrip.getResData();
    super.initState();
  }

  itemBuild(BuildContext context, int index) {
    return Column(
      children: [
        Container(
          height: 300,
          width: 390,
          decoration: BoxDecoration(
            image: DecorationImage(

              image: NetworkImage(
                  responsibilitydescrip.dataList[index].image?.url ?? ""),
              fit: BoxFit.fill,
            ),
          ),
        ),
        const Divider(
          color: Colors.white,
          thickness: 10,
          height: 2,
        ),

        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(responsibilitydescrip.dataList[index].title ?? "",
                style: TextStyle(fontSize: 20,)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(responsibilitydescrip.dataList[index].text ?? "",
          ),
        )
      ],
    );
  }

    @override
    Widget build(BuildContext context) {
      return Observer(
      builder: (_) =>ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(10),
      itemCount: responsibilitydescrip.dataList.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return responsibilitydescrip.dataList.isEmpty
            ? Container()
            : itemBuild(context, index);
      }
      ),
      );
    }
  }


