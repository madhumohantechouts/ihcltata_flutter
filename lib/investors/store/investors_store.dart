import 'package:mobx/mobx.dart';

import '../../network/sanity.dart';
import '../../utils/constants.dart';
import '../json/corporate_action_json.dart';

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

  @action
  Future extractCorporateAction() async {
    const String query = '*[_type in ["corporateAction"]]{bodyOneA,bodyOneB,bodyTwoA,bodyTwoB,bodyTwoC,headOne,headOneD,headTwo}';
    List<dynamic> result = await sanityClient.fetch(query: query);
    List<CorporateActionJSON> corporateActionList = List<CorporateActionJSON>.from(
        result.map((e) => CorporateActionJSON.fromJson(e)));
  }

}