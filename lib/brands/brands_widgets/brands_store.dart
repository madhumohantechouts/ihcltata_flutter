import 'package:mobx/mobx.dart';

import '../../network/sanity.dart';
import '../../utils/constants.dart';
import '../brands_data/carousel_data.dart';
import '../brands_data/expression_data.dart';
import '../brands_data/footerbrands_data.dart';
import '../brands_data/footerintro_data.dart';
import '../brands_data/hosbitability_data.dart';
import '../brands_data/newsletter_data.dart';
import '../brands_data/otherservices_data.dart';
import '../brands_data/ourbrands_data.dart';
import '../brands_data/underfooter_data.dart';
import '../brands_data/volumecatering_data.dart';
part 'brands_store.g.dart';

class BrandsStore = _BrandsStore with _$BrandsStore;

// The store-class
final SanityClient sanityClient = SanityClient(
  projectId: projectId,
  dataset: dataSet,
  useCdn: useCdn,
);

abstract class _BrandsStore with Store {
  @observable
  String heading = "";
  @observable
  String description = "";
  @observable
  List<DataResponse> carouselList = [];
  @observable
  List<HospitabilityData> hospitabilityList = [];
  @observable
  List<Volumecatering> volumeList = [];
  @observable
  List<Retail> expressionList = [];
  @observable
  List<Services> otherserviceList = [];
  @observable
  String brands = " ";
  @observable
  String brandsfive = " ";
  @observable
  String brandsfour = " ";
  @observable
  String brandsone = " ";
  @observable
  String brandsthree = "";
  @observable
  String brandstwo = "";
  @observable
  String carrer = "";
  @observable
  String carrerfour = "";
  @observable
  String carrerone = "";
  @observable
  String carrerthree = "";
  @observable
  String carrertwo = "";
  @observable
  String company = "";
  @observable
  String companyfour = "";
  @observable
  String companyone = "";
  @observable
  String companythree = "";
  @observable
  String companytwo = "";
  @observable
  String contact = " ";
  @observable
  String contactone = "";
  @observable
  String development = "";
  @observable
  String developmentfour = "";
  @observable
  String developmentone = "";
  @observable
  String developmentthree = "";
  @observable
  String developmenttwo = "";
  @observable
  String investors = "";
  @observable
  String investorsOne = "";
  @observable
  String investorstwo = "";
  @observable
  String pressroom = "";
  @observable
  String pressroomone = "";
  @observable
  String pressroomtwo = "";
  @observable
  String responsibility = "";
  @observable
  String responsibilityone = "";
  @observable
  String responsibilitytwo = "";
  @observable
  String title = "";
  @observable
  String accessibility = "";
  @observable
  String language = "";
  @observable
  String privacypolicy = "";
  @observable
  String sitemap = "";
  @observable
  String termsofuse = "";
  @observable
  String newsButton = "";
  @observable
  String news = "";
  @observable
  String ama = "";
  @observable
  String copyright = "";
  @observable
  String ginger = "";
  @observable
  String qmin = "";
  @observable
  String seleqtions = "";
  @observable
  String subtitle = "";
  @observable
  String taj = "";
  @observable
  String tajsats = "";
  @observable
  String footertitle = "";
  @observable
  String vivanta = "";
  @action
  Future getDescription() async {
    String query = '*[_type == "movie"]';
    List<dynamic> result = await sanityClient.fetch(query: query);
    List<Output> dataListTemp =
        List<Output>.from(result.map((e) => Output.fromJson(e)));
    heading = dataListTemp[0].heading!;
    description = dataListTemp[0].description!;
  }

  @action
  Future getBrands() async {
    const String query = '*[_type == "carosalImages"] ';

    List<dynamic> result = await sanityClient.fetch(query: query);

    carouselList =
        List<DataResponse>.from(result.map((e) => DataResponse.fromJson(e)));
    carouselList.forEach((element) {
      var refId = element.carosalImage?.asset?.sRef;
      var parts = refId!.split('-');
      var id = parts[1];
      var format = parts[3];
      var size = parts[2];
      element.carosalImage?.url =
          "https://cdn.sanity.io/images/$projectId/$dataSet/$id-$size.$format";
    });
    print(carouselList);
  }

  @action
  Future getHospital() async {
    const String query = '*[_type == "author1"]';
    List<dynamic> result = await sanityClient.fetch(query: query);
    hospitabilityList = List<HospitabilityData>.from(
        result.map((e) => HospitabilityData.fromJson(e)));
    hospitabilityList.forEach((element) {
      var refId = element.coverImage?.asset?.sRef;
      var parts = refId!.split('-');
      var id = parts[1];
      var format = parts[3];
      var size = parts[2];
      element.coverImage?.url =
          "https://cdn.sanity.io/images/$projectId/$dataSet/$id-$size.$format";
    });
    print(hospitabilityList);
  }

  @action
  Future getVolume() async {
    // print("tapped");
    const String query = '*[_type == "avatar"]';
    List<dynamic> result = await sanityClient.fetch(query: query);
    volumeList = List<Volumecatering>.from(
        result.map((e) => Volumecatering.fromJson(e)));
    // print(impactList);
    volumeList.forEach((element) {
      var refId = element.coverImage?.asset?.sRef;
      var parts = refId!.split('-');
      var id = parts[1];
      var format = parts[3];
      var size = parts[2];
      element.coverImage?.url =
          "https://cdn.sanity.io/images/$projectId/$dataSet/$id-$size.$format";
    });
    print(volumeList);
  }

  @action
  Future getExpression() async {
    // print("tapped");
    const String query = '*[_type == "authorIntro"]';
    List<dynamic> result = await sanityClient.fetch(query: query);
    expressionList = List<Retail>.from(result.map((e) => Retail.fromJson(e)));
    expressionList.forEach((element) {
      var refId = element.coverImage?.asset?.sRef;
      var parts = refId!.split('-');
      var id = parts[1];
      var format = parts[3];
      var size = parts[2];
      element.coverImage?.url =
          "https://cdn.sanity.io/images/$projectId/$dataSet/$id-$size.$format";
    });
    print(expressionList);
  }

  @action
  Future getService() async {
    // print("tapped");
    const String query = '*[_type == "featuresInfo"]';
    List<dynamic> result = await sanityClient.fetch(query: query);
    otherserviceList =
        List<Services>.from(result.map((e) => Services.fromJson(e)));
    otherserviceList.forEach((element) {
      var refId = element.coverImage?.asset?.sRef;
      var parts = refId!.split('-');
      var id = parts[1];
      var format = parts[3];
      var size = parts[2];
      element.coverImage?.url =
          "https://cdn.sanity.io/images/$projectId/$dataSet/$id-$size.$format";
    });
    print(otherserviceList);
  }

  void getIntro() async {
    const String query = '*[_type == "footerIntro"]';
    List<dynamic> result = await sanityClient.fetch(query: query);
    List<Intro> dataListTemp =
        List<Intro>.from(result.map((e) => Intro.fromJson(e)));
    brands = dataListTemp[0].brands!;
    brandsfive = dataListTemp[0].brandsfive!;
    brandsfour = dataListTemp[0].brandsfour!;
    brandsone = dataListTemp[0].brandsone!;
    brandstwo = dataListTemp[0].brandstwo!;
    brandsthree = dataListTemp[0].brandsthree!;
    carrer = dataListTemp[0].carrer!;
    carrerone = dataListTemp[0].carrerone!;
    carrertwo = dataListTemp[0].carrertwo!;
    carrerthree = dataListTemp[0].carrerthree!;
    carrerfour = dataListTemp[0].carrerfour!;
    company = dataListTemp[0].company!;
    companyone = dataListTemp[0].companyone!;
    companytwo = dataListTemp[0].companytwo!;
    companythree = dataListTemp[0].companythree!;
    companyfour = dataListTemp[0].companyfour!;
    contact = dataListTemp[0].contact!;
    contactone = dataListTemp[0].contactone!;
    development = dataListTemp[0].development!;
    developmentone = dataListTemp[0].developmentone!;
    developmenttwo = dataListTemp[0].developmenttwo!;
    developmentthree = dataListTemp[0].developmentthree!;
    developmentfour = dataListTemp[0].developmentfour!;
    investors = dataListTemp[0].investors!;
    investorsOne = dataListTemp[0].investorsOne!;
    investorstwo = dataListTemp[0].investorstwo!;
    pressroom = dataListTemp[0].pressroom!;
    pressroomone = dataListTemp[0].pressroomone!;
    pressroomtwo = dataListTemp[0].pressroomtwo!;
    responsibility = dataListTemp[0].responsibility!;
    responsibilityone = dataListTemp[0].responsibilityone!;
    responsibilitytwo = dataListTemp[0].responsibilitytwo!;
    title = dataListTemp[0].title!;
    print(title);
  }

  void getUnder() async {
    // print("tapped");
    const String query = '*[_type == "underfooter"]';
    List<dynamic> result = await sanityClient.fetch(query: query);
    List<Under> dataListTemp =
        List<Under>.from(result.map((e) => Under.fromJson(e)));
    accessibility = dataListTemp[0].accessibility!;
    language = dataListTemp[0].language!;
    privacypolicy = dataListTemp[0].privacypolicy!;
    sitemap = dataListTemp[0].sitemap!;
    termsofuse = dataListTemp[0].termsofuse!;
    print(termsofuse);
  }

  void getNews() async {
    // print("tapped");
    const String query = '*[_type == "newsLetter"]';
    List<dynamic> result = await sanityClient.fetch(query: query);
    List<Letter> dataListTemp =
        List<Letter>.from(result.map((e) => Letter.fromJson(e)));
    newsButton = dataListTemp[0].newsButton!;
    news = dataListTemp[0].title!;
    print(newsButton);
  }

  void getFooterbrands() async {
    // print("tapped");
    const String query = '*[_type == "brands"]';
    List<dynamic> result = await sanityClient.fetch(query: query);
    List<Underbrands> dataListTemp =
        List<Underbrands>.from(result.map((e) => Underbrands.fromJson(e)));
    ama = dataListTemp[0].ama!;
    copyright = dataListTemp[0].copyright!;
    ginger = dataListTemp[0].ginger!;
    qmin = dataListTemp[0].qmin!;
    seleqtions = dataListTemp[0].seleqtions!;
    subtitle = dataListTemp[0].subtitle!;
    taj = dataListTemp[0].taj!;
    tajsats = dataListTemp[0].tajsats!;
    footertitle = dataListTemp[0].title!;
    vivanta = dataListTemp[0].vivanta!;
    print(footertitle);
//       dataList=dataListTemp;
    // print(dataList);
  }
}
