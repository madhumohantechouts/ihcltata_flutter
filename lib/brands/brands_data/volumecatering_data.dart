class Volumecatering {
  int? cities;
  String? city;
  CoverImage? coverImage;
  String? day;
  int? days;
  String? description;
  String? info;
  String? information;
  String? market;
  int? markets;
  String? subtitle;
  String? title;

  Volumecatering(
      {required this.cities,
      required this.city,
      required this.coverImage,
      required this.day,
      required this.days,
      required this.description,
      required this.info,
      required this.information,
      required this.market,
      required this.markets,
      required this.subtitle,
      required this.title});

  Volumecatering.fromJson(Map<String, dynamic> json) {
    cities = json['cities'];
    city = json['city'];
    coverImage = json['coverImage'] != null
        ? new CoverImage.fromJson(json['coverImage'])
        : null;
    day = json['day'];
    days = json['days'];
    description = json['description'];
    info = json['info'];
    information = json['information'];
    market = json['market'];
    markets = json['markets'];
    subtitle = json['subtitle'];
    title = json['title'];
  }
}

class CoverImage {
  String? sType;
  Asset? asset;
  String? url;

  CoverImage({required this.sType, required this.asset, this.url});

  CoverImage.fromJson(Map<String, dynamic> json) {
    sType = json['_type'];
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
