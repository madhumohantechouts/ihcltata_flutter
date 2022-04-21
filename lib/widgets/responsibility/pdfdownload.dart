
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ihcltata/widgets/responsibility/responsibilty_store.dart';

import '../../network/sanity.dart';
import '../../utils/constants.dart';
import 'data/pdfdownloaddata.dart';
class PdfDownload extends StatefulWidget {
  const PdfDownload({Key? key}) : super(key: key);

  @override
  State<PdfDownload> createState() => _PdfDownloadState();
}

class _PdfDownloadState extends State<PdfDownload> {
  // var yeardata = "";
  // var download = "";
  final pdfdownloads = ResponsibiltyStore();
  // List<InititaivesImpactData> dataList = [];
 itemBuild(BuildContext context,int index){
    return Container(
      height: 80,
      width: 200,
      color: Colors.white ,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 200,
                // color: Colors.white ,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30.0,0,0,10),
                      child: Align(

                        alignment: Alignment.topLeft,
                        child:Text(pdfdownloads.pdfList[index].yeardata ??"",style:TextStyle(fontSize: 15,)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                child: RaisedButton(
                  color:Colors.blueAccent,
                  // alignment: Alignment.center,
                  onPressed: () {  },
                  child: Text(pdfdownloads.pdfList[index].download ??"", style: TextStyle(fontSize: 10,color: Colors.white)),
                ),
              ),
            ],
          ),
         ],
      ),
    );

}
  @override
  void initState() {
    pdfdownloads.getPdf();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Observer(
    builder: (_) =>ListView.separated(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    padding: EdgeInsets.all(10),
    itemCount:pdfdownloads.pdfList.length,
    scrollDirection: Axis.vertical,
    itemBuilder: (context, index) {
      return pdfdownloads.pdfList.isEmpty ? Container() : itemBuild(context, index);
    },
    separatorBuilder: (context, index) {
       Spacer(

      );
      return Container(
        height: 20,
        width: double.infinity,
        // color: Colors.grey,
      );
    }
    ),
    );
  }
}

