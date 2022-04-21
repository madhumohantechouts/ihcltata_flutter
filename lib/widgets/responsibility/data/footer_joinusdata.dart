class FooterJoinusData {

  String? btn;
  String? content;

  FooterJoinusData(
      {
        this.btn,
        this.content});

  FooterJoinusData.fromJson(Map<String, dynamic> json) {

    btn = json['btn'];
    content = json['content'];
  }


}
