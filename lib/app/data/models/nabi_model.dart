class NabiModel {
  String? name, description, imageUrl;

  NabiModel({required this.name, required this.description});

  NabiModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    imageUrl = json['image_url'];
  }
}
