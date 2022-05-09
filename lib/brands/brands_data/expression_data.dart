class Retail {
  CoverImage? coverImage;
  String? info;
  String? subtitle;
  String? title;

  Retail({this.coverImage, this.info, this.subtitle, this.title});

  Retail.fromJson(Map<String, dynamic> json) {
    coverImage = json['coverImage'] != null
        ? new CoverImage.fromJson(json['coverImage'])
        : null;
    info = json['info'];
    subtitle = json['subtitle'];
    title = json['title'];
  }
}

class CoverImage {
  String? sType;
  Asset? asset;
  String? url;
  CoverImage({this.sType, this.asset, this.url});

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
