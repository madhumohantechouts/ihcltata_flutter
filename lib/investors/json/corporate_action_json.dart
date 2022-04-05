class CorporateActionJSON {
  String? bodyOneA;
  String? bodyOneB;
  String? bodyTwoA;
  String? bodyTwoB;
  String? bodyTwoC;
  String? headOne;
  String? headOneD;
  String? headTwo;

  CorporateActionJSON(
      {this.bodyOneA,
        this.bodyOneB,
        this.bodyTwoA,
        this.bodyTwoB,
        this.bodyTwoC,
        this.headOne,
        this.headOneD,
        this.headTwo});

  CorporateActionJSON.fromJson(Map<String, dynamic> json) {
    bodyOneA = json['bodyOneA'];
    bodyOneB = json['bodyOneB'];
    bodyTwoA = json['bodyTwoA'];
    bodyTwoB = json['bodyTwoB'];
    bodyTwoC = json['bodyTwoC'];
    headOne = json['headOne'];
    headOneD = json['headOneD'];
    headTwo = json['headTwo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bodyOneA'] = bodyOneA;
    data['bodyOneB'] = bodyOneB;
    data['bodyTwoA'] = bodyTwoA;
    data['bodyTwoB'] = bodyTwoB;
    data['bodyTwoC'] = bodyTwoC;
    data['headOne'] = headOne;
    data['headOneD'] = headOneD;
    data['headTwo'] = headTwo;
    return data;
  }
}
