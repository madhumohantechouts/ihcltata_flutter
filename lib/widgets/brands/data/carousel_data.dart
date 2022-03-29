class DataResponse {

  CarosalImage? carosalImage;
  String? title;

  DataResponse({required this.carosalImage,
    required this.title});

  DataResponse.fromJson(Map<String, dynamic> json) {
    carosalImage = json['carosalImage'] != null
        ? new CarosalImage.fromJson(json['carosalImage'])
        : null;
    title = json['title'];
  }
}

class CarosalImage {
  Asset? asset;
  String? url;
  CarosalImage({required this.asset,this.url});

  CarosalImage.fromJson(Map<String, dynamic> json) {
    asset = json['asset'] != null ? new Asset.fromJson(json['asset']) : null;
  }

}

class Asset {
  String? sRef;
  String? sType;

  Asset({required this.sRef, required this.sType});

  Asset.fromJson(Map<String, dynamic> json) {
    sRef = json['_ref'];
    sType = json['_type'];
  }
}