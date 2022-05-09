class Services {
  CoverImage? coverImage;
  String? description;
  String? details;
  String? title;
  Services({this.coverImage, this.description, this.details, this.title});

  Services.fromJson(Map<String, dynamic> json) {
    coverImage = json['coverImage'] != null
        ? new CoverImage.fromJson(json['coverImage'])
        : null;
    description = json['description'];
    details = json['details'];
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
