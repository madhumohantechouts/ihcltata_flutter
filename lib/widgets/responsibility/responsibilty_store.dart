import 'package:mobx/mobx.dart';

import '../../network/sanity.dart';
import '../../utils/constants.dart';
import 'data/banner.dart';
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
  String title="";
   @observable
   String descrip="";
   @observable
   List<Result> bannerList = [];


   @action
  Future getDescription() async {
    // print("tapped");
    const String query = '*[_type == "bordernone"]';
    List<dynamic> result = await sanityClient.fetch(query: query);
    List<Responsibility> dataListTemp = List<Responsibility>.from(result.map((e) => Responsibility.fromJson(e)));

      title = dataListTemp[0].title!;
    descrip = dataListTemp[0].descripition!;
      print("mad..."+descrip);
    print("mad..."+title);

  }
  @action
   void getBanner() async {

     const String query = '*[_type == "banner"] ';

     List<dynamic> result = await sanityClient.fetch(query: query);

      bannerList = List<Result>.from(result.map((e) => Result.fromJson(e)));
      bannerList.forEach((element) {
       var refId = element.image?.asset?.sRef;
       var parts = refId!.split('-');
       var id = parts[1];
       var format = parts[3];
       var size = parts[2];
       element.image?.url = "https://cdn.sanity.io/images/$projectId/$dataSet/$id-$size.$format";
     });


   }
}