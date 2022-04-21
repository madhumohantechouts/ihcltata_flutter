class FooterResponsibilityData {
  String? cOne;
  String? cTwo;
  String? header;

  FooterResponsibilityData(
      {
        this.cOne,
        this.cTwo,
        this.header});

  FooterResponsibilityData.fromJson(Map<String, dynamic> json) {
    cOne = json['cOne'];
    cTwo = json['cTwo'];
    header = json['header'];
  }


}
