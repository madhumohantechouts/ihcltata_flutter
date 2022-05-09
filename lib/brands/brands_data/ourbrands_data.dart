class Output {
  String? description;
  String? heading;

  Output({
    required this.description,
    required this.heading,
  });

  Output.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    heading = json['heading'];
  }
}
