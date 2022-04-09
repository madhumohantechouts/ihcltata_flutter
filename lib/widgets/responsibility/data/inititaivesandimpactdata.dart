class InititaivesImpactData {
  String? text;
  String? text1;
  String? text2;
  String? title;

  InititaivesImpactData(
      {
        this.text,
        this.text1,
        this.text2,
        this.title});

  InititaivesImpactData.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    text1 = json['text1'];
    text2 = json['text2'];
    title = json['title'];
  }
}

