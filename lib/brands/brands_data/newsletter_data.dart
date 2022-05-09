class Letter {
  String? newsButton;
  String? title;

  Letter({this.newsButton, this.title});

  Letter.fromJson(Map<String, dynamic> json) {
    newsButton = json['newsButton'];
    title = json['title'];
  }
}
