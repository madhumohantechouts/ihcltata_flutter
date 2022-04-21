class CompanyAnnouncementsJSON {
  String? bodyOne;
  String? bodyOneO;
  String? bodyTwo;
  String? headerOne;
  String? headerTwo;

  CompanyAnnouncementsJSON(
      {this.bodyOne,
        this.bodyOneO,
        this.bodyTwo,
        this.headerOne,
        this.headerTwo});

  CompanyAnnouncementsJSON.fromJson(Map<String, dynamic> json) {
    bodyOne = json['bodyOne'];
    bodyOneO = json['bodyOneO'];
    bodyTwo = json['bodyTwo'];
    headerOne = json['headerOne'];
    headerTwo = json['headerTwo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bodyOne'] = bodyOne;
    data['bodyOneO'] = bodyOneO;
    data['bodyTwo'] = bodyTwo;
    data['headerOne'] = headerOne;
    data['headerTwo'] = headerTwo;
    return data;
  }
}
