class ShopBannerModel {
  final String status;
  final ShopBannerData? data;

  ShopBannerModel({
    required this.status,
    this.data,
  });

  factory ShopBannerModel.fromJson(Map<String, dynamic> json) {
    return ShopBannerModel(
      status: json['status'] ?? '',
      data: json['data'] != null
          ? ShopBannerData.fromJson(json['data'])
          : null,
    );
  }
}

class ShopBannerData {
  final int id;
  final int vendor;
  final String image;
  final String createdAt;
  final String updatedAt;

  ShopBannerData({
    required this.id,
    required this.vendor,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ShopBannerData.fromJson(Map<String, dynamic> json) {
    return ShopBannerData(
      id: json['id'] ?? 0,
      vendor: json['vendor'] ?? 0,
      image: json['image'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}
