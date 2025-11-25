class AllGroceryModel {
  String status;
  String message;
  List<ShopData> data;

  AllGroceryModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AllGroceryModel.fromJson(Map<String, dynamic> json) {
    return AllGroceryModel(
      status: json["status"] ?? "",
      message: json["message"] ?? "",
      data: json["data"] == null
          ? []
          : List<ShopData>.from(
              json["data"].map((x) => ShopData.fromJson(x)),
            ),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ShopData {
  int id;
  String shopName;
  String shopImage;
  String shopLicense;
  String shopType;
  String shopAddress;
  double rating;
  int totalRatingCount;
  List<dynamic> subcategories;
  String estimateDeliveryTime;

  ShopData({
    required this.id,
    required this.shopName,
    required this.shopImage,
    required this.shopLicense,
    required this.shopType,
    required this.shopAddress,
    required this.rating,
    required this.totalRatingCount,
    required this.subcategories,
    required this.estimateDeliveryTime,
  });

  factory ShopData.fromJson(Map<String, dynamic> json) {
    return ShopData(
      id: json["id"] ?? 0,
      shopName: json["shop_name"] ?? "",
      shopImage: json["shop_image"] ?? "",
      shopLicense: json["shop_license"] ?? "",
      shopType: json["shop_type"] ?? "",
      shopAddress: json["shop_address"] ?? "",
      rating: (json["rating"] ?? 0).toDouble(),
      totalRatingCount: json["total_rating_count"] ?? 0,
      subcategories: json["subcategories"] ?? [],
      estimateDeliveryTime: json["estimate_delivery_time"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "shop_name": shopName,
        "shop_image": shopImage,
        "shop_license": shopLicense,
        "shop_type": shopType,
        "shop_address": shopAddress,
        "rating": rating,
        "total_rating_count": totalRatingCount,
        "subcategories": subcategories,
        "estimate_delivery_time": estimateDeliveryTime,
      };
}
