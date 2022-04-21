class Responsibility {
  String? descripition;
  String? title;

  Responsibility({this.descripition, this.title});

  Responsibility.fromJson(Map<String, dynamic> json) {
    descripition = json['descripition'];
    title = json['title'];
  }
}
