class AGMJSON {
  String? bodyOne;
  String? bodyThree;
  String? bodyTwo;

  AGMJSON({this.bodyOne, this.bodyThree, this.bodyTwo});

  AGMJSON.fromJson(Map<String, dynamic> json) {
    bodyOne = json['bodyOne'];
    bodyThree = json['bodyThree'];
    bodyTwo = json['bodyTwo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bodyOne'] = bodyOne;
    data['bodyThree'] = bodyThree;
    data['bodyTwo'] = bodyTwo;
    return data;
  }
}
