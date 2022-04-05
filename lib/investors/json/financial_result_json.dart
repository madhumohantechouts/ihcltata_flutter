class FinancialResultJSON {
  String? bodyOneA;
  String? bodyOneB;
  String? bodyOneC;
  String? bodyTwoA;
  String? bodyTwoAO;
  String? bodyTwoB;
  String? bodyTwoBO;
  String? footer;
  String? headerOne;
  String? headerTwo;

  FinancialResultJSON(
      {this.bodyOneA,
        this.bodyOneB,
        this.bodyOneC,
        this.bodyTwoA,
        this.bodyTwoAO,
        this.bodyTwoB,
        this.bodyTwoBO,
        this.footer,
        this.headerOne,
        this.headerTwo});

  FinancialResultJSON.fromJson(Map<String, dynamic> json) {
    bodyOneA = json['bodyOneA'];
    bodyOneB = json['bodyOneB'];
    bodyOneC = json['bodyOneC'];
    bodyTwoA = json['bodyTwoA'];
    bodyTwoAO = json['bodyTwoAO'];
    bodyTwoB = json['bodyTwoB'];
    bodyTwoBO = json['bodyTwoBO'];
    footer = json['footer'];
    headerOne = json['headerOne'];
    headerTwo = json['headerTwo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bodyOneA'] = bodyOneA;
    data['bodyOneB'] = bodyOneB;
    data['bodyOneC'] = bodyOneC;
    data['bodyTwoA'] = bodyTwoA;
    data['bodyTwoAO'] = bodyTwoAO;
    data['bodyTwoB'] = bodyTwoB;
    data['bodyTwoBO'] = bodyTwoBO;
    data['footer'] = footer;
    data['headerOne'] = headerOne;
    data['headerTwo'] = headerTwo;
    return data;
  }
}
