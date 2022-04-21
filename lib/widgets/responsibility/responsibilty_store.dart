import 'package:mobx/mobx.dart';

import '../../network/sanity.dart';
import '../../utils/constants.dart';
import 'data/banner.dart';
import 'data/corporatesocialresponsiblitydata.dart';
import 'data/inititaivesandimpactdata.dart';
import 'data/pdfdownloaddata.dart';
import 'data/responsibility.dart';

// Include generated file
part 'responsibilty_store.g.dart';

// This is the class used by rest of your codebase
class ResponsibiltyStore = _ResponsibiltyStore with _$ResponsibiltyStore;

// The store-class
final SanityClient sanityClient = SanityClient(
  projectId: projectId,
  dataset: dataSet,
  useCdn: useCdn,
);
abstract class _ResponsibiltyStore with Store {
  @observable
  String title = "";
  @observable
  String descrip = "";
  @observable
  List<Result> bannerList = [];
  @observable
  List<CorporateSocialResponsibilityData> dataList = [];
  @observable
  List<InititaivesImpactData> impactList=[];
  @observable
  List<PdfDownloadData> pdfList=[];




  @action
  Future getDescription() async {
    // print("tapped");
    const String query = '*[_type == "bordernone"]';
    List<dynamic> result = await sanityClient.fetch(query: query);
    List<Responsibility> dataListTemp = List<Responsibility>.from(
        result.map((e) => Responsibility.fromJson(e)));

    title = dataListTemp[0].title!;
    descrip = dataListTemp[0].descripition!;
  }

  @action
  Future getBanner() async {
    const String query = '*[_type == "banner"] ';

    List<dynamic> result = await sanityClient.fetch(query: query);

    bannerList = List<Result>.from(result.map((e) => Result.fromJson(e)));
    bannerList.forEach((element) {
      var refId = element.image?.asset?.sRef;
      var parts = refId!.split('-');
      var id = parts[1];
      var format = parts[3];
      var size = parts[2];
      element.image?.url =
      "https://cdn.sanity.io/images/$projectId/$dataSet/$id-$size.$format";
    });
  }

  @action
  Future getResData() async {
    const String query = '*[_type == "contact"]';
    /*setState(() {
      // loader=true;
    });*/

    List<dynamic> result = await sanityClient.fetch(query: query);
    /*setState(() {
      // loader=false;
    });*/

     dataList = List<
        CorporateSocialResponsibilityData>.from(
        result.map((e) => CorporateSocialResponsibilityData.fromJson(e)));
    dataList.forEach((element) {
      var refId = element.image?.asset?.sRef;
      var parts = refId!.split('-');
      var id = parts[1];
      var format = parts[3];
      var size = parts[2];
      element.image?.url =
      "https://cdn.sanity.io/images/$projectId/$dataSet/$id-$size.$format";
    });
    print(dataList);
  }
  @action
  Future getImpact() async {
    // print("tapped");
    const String query = '*[_type == "hrcard"]';
    List<dynamic> result = await sanityClient.fetch(query: query);
    impactList = List<InititaivesImpactData>.from(result.map((e) => InititaivesImpactData.fromJson(e)));
  // print(impactList);
  }
  @action
  Future getPdf() async {
    // print("tapped");
    const String query = '*[_type == "pdfData"]';
    List<dynamic> result = await sanityClient.fetch(query: query);
    pdfList = List<PdfDownloadData>.from(result.map((e) => PdfDownloadData.fromJson(e)));
     print(pdfList);

  }
}


