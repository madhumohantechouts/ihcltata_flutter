class DevelopmentData {
  String? cFour;
  String? cOne;
  String? cThree;
  String? cTwo;
  String? header;

  DevelopmentData(
      { this.cFour,
        this.cOne,
        this.cThree,
        this.cTwo,
        this.header
      });

  DevelopmentData.fromJson(Map<String, dynamic> json) {
    cFour = json['cFour'];
    cOne = json['cOne'];
    cThree = json['cThree'];
    cTwo = json['cTwo'];
    header = json['header'];
  }
}

