class CarouselImages {
  CarosalImage? carosalImage;
  String? title;

  CarouselImages({this.carosalImage, this.title});

  CarouselImages.fromJson(Map<String, dynamic> json) {
    carosalImage = json['carosalImage'] != null
        ? new CarosalImage.fromJson(json['carosalImage'])
        : null;
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.carosalImage != null) {
      data['carosalImage'] = this.carosalImage?.toJson();
    }
    data['title'] = this.title;
    return data;
  }
}

class CarosalImage {
  String? sType;
  Asset? asset;
  String? url;

  CarosalImage({this.sType, this.asset, this.url});

  CarosalImage.fromJson(Map<String, dynamic> json) {
    sType = json['_type'];
    asset = json['asset'] != null ? Asset.fromJson(json['asset']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_type'] = this.sType;
    if (this.asset != null) {
      data['asset'] = this.asset?.toJson();
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_ref'] = this.sRef;
    data['_type'] = this.sType;
    return data;
  }
}
