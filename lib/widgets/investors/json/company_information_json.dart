class CompanyInformationJSON {
  String? bodyFive;
  String? bodyFour;
  String? bodyOne;
  String? bodySeven;
  String? bodySix;
  String? bodyThree;
  String? bodyTwo;
  String? header;
  Imagee? image;

  CompanyInformationJSON(
      {this.bodyFive,
        this.bodyFour,
        this.bodyOne,
        this.bodySeven,
        this.bodySix,
        this.bodyThree,
        this.bodyTwo,
        this.header,
        this.image});

  CompanyInformationJSON.fromJson(Map<String, dynamic> json) {
    bodyFive = json['bodyFive'];
    bodyFour = json['bodyFour'];
    bodyOne = json['bodyOne'];
    bodySeven = json['bodySeven'];
    bodySix = json['bodySix'];
    bodyThree = json['bodyThree'];
    bodyTwo = json['bodyTwo'];
    header = json['header'];
    image = json['image'] != null ? Imagee.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bodyFive'] = bodyFive;
    data['bodyFour'] = bodyFour;
    data['bodyOne'] = bodyOne;
    data['bodySeven'] = bodySeven;
    data['bodySix'] = bodySix;
    data['bodyThree'] = bodyThree;
    data['bodyTwo'] = bodyTwo;
    data['header'] = header;
    if (image != null) {
      data['image'] = image?.toJson();
    }
    return data;
  }
}

class Imagee {
  String? sType;
  Asset? asset;
  String? url;

  Imagee({this.sType, this.asset});

  Imagee.fromJson(Map<String, dynamic> json) {
    sType = json['_type'];
    asset = json['asset'] != null ? Asset.fromJson(json['asset']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_type'] = sType;
    if (asset != null) {
      data['asset'] = asset?.toJson();
    }
    return data;
  }
}

class Asset {
  String? sRef;
  String? sType;

  Asset({this.sRef, this.sType});

  Asset.fromJson(Map<String, dynamic> json) {
    sRef = json['_ref'];
    sType = json['_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_ref'] = sRef;
    data['_type'] = sType;
    return data;
  }
}
