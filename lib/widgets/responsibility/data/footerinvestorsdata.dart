class FooterInvestorsData {
  String? cOne;
  String? cTwo;
  String? header;

  FooterInvestorsData(
      { this.cOne,
        this.cTwo,
        this.header});

  FooterInvestorsData.fromJson(Map<String, dynamic> json) {
    cOne = json['cOne'];
    cTwo = json['cTwo'];
    header = json['header'];
  }


}
