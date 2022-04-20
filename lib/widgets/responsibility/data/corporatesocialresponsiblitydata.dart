class CorporateSocialResponsibilityData{
  Image? image;
  String? text;
  String? title;

  CorporateSocialResponsibilityData(
      {this.image,
        this.text,
        this.title});

  CorporateSocialResponsibilityData.fromJson(Map<String, dynamic> json) {
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    text = json['text'];
    title = json['title'];
  }

  @override
  String toString() {
    return 'CorporateSocialResponsibilityData{image: $image, text: $text, title: $title}';
  }
}

class Image {
  String? url;
  Asset? asset;

  Image({this.url, this.asset});

  Image.fromJson(Map<String, dynamic> json) {
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
