class BannerModel {
  String? status;
  List<BannerData>? data;

  BannerModel({this.status, this.data});

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      status: json['status'],
      data: (json['data'] as List)
          .map((item) => BannerData.fromJson(item))
          .toList(),
    );
  }
}

class BannerData {
  int? id;
  int? vendor;
  String? image;
  String? createdAt;
  String? updatedAt;

  BannerData({
    this.id,
    this.vendor,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory BannerData.fromJson(Map<String, dynamic> json) {
    return BannerData(
      id: json['id'],
      vendor: json['vendor'],
      image: json['image'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'vendor': vendor,
      'image': image,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
