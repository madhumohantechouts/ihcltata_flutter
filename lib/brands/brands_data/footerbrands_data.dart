class Underbrands {
  String? ama;
  String? copyright;
  String? ginger;
  String? qmin;
  String? seleqtions;
  String? subtitle;
  String? taj;
  String? tajsats;
  String? title;
  String? vivanta;

  Underbrands(
      {this.ama,
      this.copyright,
      this.ginger,
      this.qmin,
      this.seleqtions,
      this.subtitle,
      this.taj,
      this.tajsats,
      this.title,
      this.vivanta});

  Underbrands.fromJson(Map<String, dynamic> json) {
    ama = json['ama'];
    copyright = json['copyright'];
    ginger = json['ginger'];
    qmin = json['qmin'];
    seleqtions = json['seleqtions'];
    subtitle = json['subtitle'];
    taj = json['taj'];
    tajsats = json['tajsats'];
    title = json['title'];
    vivanta = json['vivanta'];
  }
}
