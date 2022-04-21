class FooterSiteMapData {
  String? headerFive;
  String? headerFour;
  String? headerOne;
  String? headerThree;
  String? headerTwo;

  FooterSiteMapData(
      { this.headerFive,
        this.headerFour,
        this.headerOne,
        this.headerThree,
        this.headerTwo});

  FooterSiteMapData.fromJson(Map<String, dynamic> json) {
    headerFive = json['headerFive'];
    headerFour = json['headerFour'];
    headerOne = json['headerOne'];
    headerThree = json['headerThree'];
    headerTwo = json['headerTwo'];
  }
}





