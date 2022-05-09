class Under {
  String? accessibility;
  String? language;
  String? privacypolicy;
  String? sitemap;
  String? termsofuse;

  Under(
      {this.accessibility,
      this.language,
      this.privacypolicy,
      this.sitemap,
      this.termsofuse});

  Under.fromJson(Map<String, dynamic> json) {
    accessibility = json['accessibility'];
    language = json['language'];
    privacypolicy = json['privacypolicy'];
    sitemap = json['sitemap'];
    termsofuse = json['termsofuse'];
  }
}
