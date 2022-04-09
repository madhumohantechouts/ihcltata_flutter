class FooterBrandsData {
  String? cFive;
  String? cFour;
  String? cOne;
  String? cThree;
  String? cTwo;
  String? header;

  FooterBrandsData(
      { this.cFive,
        this.cFour,
        this.cOne,
        this.cThree,
        this.cTwo,
        this.header
      });

  FooterBrandsData.fromJson(Map<String, dynamic> json) {
    cFive = json['cFive'];
    cFour = json['cFour'];
    cOne = json['cOne'];
    cThree = json['cThree'];
    cTwo = json['cTwo'];
    header = json['header'];
  }

}
