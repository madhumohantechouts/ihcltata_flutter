class HospitabilityData {
  CoverImage? coverImage;
  String? description;
  String? destination;
  int? destinations;
  String? hotel;
  int? hotels;
  String? info;
  String? key;
  int? keys;
  String? subtitle;

  HospitabilityData(
      {required this.coverImage,
      required this.description,
      required this.destination,
      required this.destinations,
      required this.hotel,
      required this.hotels,
      required this.info,
      required this.key,
      required this.keys,
      required this.subtitle});

  HospitabilityData.fromJson(Map<String, dynamic> json) {
    coverImage = (json['coverImage'] != null
        ? new CoverImage.fromJson(json['coverImage'])
        : null);
    description = json['description'];
    destination = json['destination'];
    destinations = json['destinations'];
    hotel = json['hotel'];
    hotels = json['hotels'];
    info = json['info'];
    key = json['key'];
    keys = json['keys'];
    subtitle = json['subtitle'];
  }
}

class CoverImage {
  String? sType;
  Asset? asset;
  String? url;
  CoverImage({required this.sType, required this.asset, required this.url});

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
