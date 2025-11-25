class AllNearbyRestaurantModel {
  final int id;
  final String shopName;
  final String? shopImage;
  final String? shopLicense;
  final String shopType;
  final String? shopAddress;
  final double rating;
  final List<SubCategoryModel> subcategories;
  final String estimateDeliveryTime;

  AllNearbyRestaurantModel({
    required this.id,
    required this.shopName,
    required this.shopImage,
    required this.shopLicense,
    required this.shopType,
    required this.shopAddress,
    required this.rating,
    required this.subcategories,
    required this.estimateDeliveryTime,
  });

  factory AllNearbyRestaurantModel.fromJson(Map<String, dynamic> json) {
    return AllNearbyRestaurantModel(
      id: json['id'] ?? 0,
      shopName: json['shop_name'] ?? "",
      shopImage: json['shop_image'],
      shopLicense: json['shop_license'],
      shopType: json['shop_type'] ?? "",
      shopAddress: json['shop_address'],
      rating: (json['rating'] ?? 0).toDouble(),
      subcategories: json['subcategories'] != null
          ? (json['subcategories'] as List)
              .map((e) => SubCategoryModel.fromJson(e))
              .toList()
          : [],
      estimateDeliveryTime: json['estimate_delivery_time'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "shop_name": shopName,
      "shop_image": shopImage,
      "shop_license": shopLicense,
      "shop_type": shopType,
      "shop_address": shopAddress,
      "rating": rating,
      "subcategories": subcategories.map((e) => e.toJson()).toList(),
      "estimate_delivery_time": estimateDeliveryTime,
    };
  }

}

class SubCategoryModel {
  final int id;
  final String name;
  final int vendor;

  SubCategoryModel({
    required this.id,
    required this.name,
    required this.vendor,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      vendor: json['vendor'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "vendor": vendor,
    };
  }
}

