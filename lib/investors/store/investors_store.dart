import 'package:mobx/mobx.dart';

import '../../network/sanity.dart';
import '../../utils/constants.dart';
import '../json/agm_json.dart';
import '../json/carousel_images.dart';
import '../json/company_announcements.dart';
import '../json/company_information_json.dart';
import '../json/corporate_action_json.dart';
import '../json/financial_result_json.dart';

part 'investors_store.g.dart';

class InvestorsStore = Investors with _$InvestorsStore;

final SanityClient sanityClient = SanityClient(
  projectId: projectId,
  dataset: dataSet,
  useCdn: useCdn,
);

abstract class Investors with Store {

  @observable
  List<CorporateActionJSON> corporateActionList = [];

  @observable
  List<FinancialResultJSON> financialResultList = [];

  @observable
  List<AGMJSON> agmList = [];

  @observable
  List<CompanyAnnouncementsJSON> companyAnnouncementsList = [];

  @observable
  List<CompanyInformationJSON> companyInformationList = [];

  @observable
  List<CarouselImages> carouselImagesList = [];

  @action
  Future extractCorporateAction() async {
    const String query = '*[_type in ["corporateAction"]]{bodyOneA,bodyOneB,bodyTwoA,bodyTwoB,bodyTwoC,headOne,headOneD,headTwo}';
    List<dynamic> result = await sanityClient.fetch(query: query);
    corporateActionList = List<CorporateActionJSON>.from(
        result.map((e) => CorporateActionJSON.fromJson(e)));
  }

  @action
  Future extractFinancialResult() async {
    const String query = '*[_type in ["financialResult"]]{bodyOneA,bodyOneB,bodyOneC,bodyTwoA,bodyTwoAO,bodyTwoB,bodyTwoBO,footer,headerOne,headerTwo}';
    List<dynamic> result = await sanityClient.fetch(query: query);
    financialResultList = List<FinancialResultJSON>.from(
        result.map((e) => FinancialResultJSON.fromJson(e)));
  }

  @action
  Future extractAGM() async {
    const String query = '*[_type in ["agms"]]{bodyOne,bodyTwo,bodyThree}';
    List<dynamic> result = await sanityClient.fetch(query: query);
    agmList =
    List<AGMJSON>.from(result.map((e) => AGMJSON.fromJson(e)));
  }

  @action
  Future extractCompanyAnnouncements() async {
    const String query = '*[_type in ["corporateAnnouncement"]]{headerOne,bodyOne,bodyOneO,headerTwo,bodyTwo}';
    List<dynamic> result = await sanityClient.fetch(query: query);
    companyAnnouncementsList = List<
        CompanyAnnouncementsJSON>.from(
        result.map((e) => CompanyAnnouncementsJSON.fromJson(e)));
  }

  @action
  Future extractCompanyInfo() async {
    const String query = '*[_type in ["companyInformations"]]{header,bodyOne,bodyTwo,bodyThree,bodyFour,bodyFive,bodySix,bodySeven,image}';
    List<dynamic> result = await sanityClient.fetch(query: query);
    companyInformationList = List<CompanyInformationJSON>.from(
        result.map((e) => CompanyInformationJSON.fromJson(e)));
    for (var element in companyInformationList) {
      var refId = element.image?.asset?.sRef;
      var parts = refId!.split('-');
      var id = parts[1];
      var format = parts[3];
      var size = parts[2];
      element.image?.url =
      "https://cdn.sanity.io/images/$projectId/$dataSet/$id-$size.$format";
    }
  }

  @action
  Future extractCarousel() async {
    const String query = '*[_type in ["carosalImages"]]{carosalImage,title}';
    List<dynamic> result = await sanityClient.fetch(query: query);
    carouselImagesList = List<CarouselImages>.from(
        result.map((e) => CarouselImages.fromJson(e)));
    for (var element in carouselImagesList) {
      var refId = element.carosalImage?.asset?.sRef;
      var parts = refId!.split('-');
      var id = parts[1];
      var format = parts[3];
      var size = parts[2];
      element.carosalImage?.url =
      "https://cdn.sanity.io/images/$projectId/$dataSet/$id-$size.$format";
    }
  }

}