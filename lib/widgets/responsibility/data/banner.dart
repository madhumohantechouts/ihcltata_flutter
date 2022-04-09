class Result {
  Image? image;
  String? text;

  Result(
      {
        this.image,
        this.text});

  Result.fromJson(Map<String, dynamic> json) {
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    text = json['text'];
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

