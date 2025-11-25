class CategoryModel {
  final int id;
  final String name;
  final String image;
  final int vendor;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.vendor,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      image: json['image'] ?? "",
      vendor: json['vendor'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "image": image,
      "vendor": vendor,
    };
  }
}
