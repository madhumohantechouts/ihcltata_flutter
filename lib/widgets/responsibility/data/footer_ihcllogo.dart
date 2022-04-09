class Result {
  TajIcon? tajIcon;
  String? brands;
  String? content;
  TajIcon? expressionsIcon;
  TajIcon? gingerIcon;
  TajIcon? logo;
  TajIcon? seleqtionsBrandIcon;
  TajIcon? tajSatsIcon;
  TajIcon? vivantaIcon;

  Result(
      {this.tajIcon,
        this.brands,
        this.content,
        this.expressionsIcon,
        this.gingerIcon,
        this.logo,
        this.seleqtionsBrandIcon,
        this.tajSatsIcon,
        this.vivantaIcon});

  Result.fromJson(Map<String, dynamic> json) {
    tajIcon =
    json['TajIcon'] != null ? new TajIcon.fromJson(json['TajIcon']) : null;
    brands = json['brands'];
    content = json['content'];
    expressionsIcon = json['expressionsIcon'] != null
        ? new TajIcon.fromJson(json['expressionsIcon'])
        : null;
    gingerIcon = json['gingerIcon'] != null
        ? new TajIcon.fromJson(json['gingerIcon'])
        : null;
    logo = json['logo'] != null ? new TajIcon.fromJson(json['logo']) : null;
    seleqtionsBrandIcon = json['seleqtionsBrandIcon'] != null
        ? new TajIcon.fromJson(json['seleqtionsBrandIcon'])
        : null;
    tajSatsIcon = json['tajSatsIcon'] != null
        ? new TajIcon.fromJson(json['tajSatsIcon'])
        : null;
    vivantaIcon = json['vivantaIcon'] != null
        ? new TajIcon.fromJson(json['vivantaIcon'])
        : null;
  }


}

class TajIcon {
  String? url;
  Asset? asset;

  TajIcon({this.url, this.asset});

  TajIcon.fromJson(Map<String, dynamic> json) {
    asset = json['asset'] != null ? new Asset.fromJson(json['asset']) : null;
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
}

