class PopularFoodAndGroceryModel {
  final String? status;
  final int? productsCount;
  final List<ProductData>? data;

  PopularFoodAndGroceryModel({
    this.status,
    this.productsCount,
    this.data,
  });

  factory PopularFoodAndGroceryModel.fromJson(Map<String, dynamic> json) {
    return PopularFoodAndGroceryModel(
      status: json["status"],
      productsCount: json["products_count"],
      data: json["data"] == null
          ? null
          : List<ProductData>.from(
              json["data"].map((x) => ProductData.fromJson(x))),
    );
  }
}
class ProductData {
  final ShopInfo? shopInfo;
  final List<VendorSubcategory>? vendorSubcategories;
  final int? id;
  final String? name;
  final String? description;
  final String? shopName;
  final String? shopImage;
  final int? category;
  final int? subcategory;
  final String? image1;
  final String? image2;
  final String? image3;
  final String? currency;
  final String? price;
  final String? quantity;
  final String? deliveryFee;
  final String? createdAt;
  final String? updatedAt;
  final int? vendor;

  ProductData({
    this.shopInfo,
    this.vendorSubcategories,
    this.id,
    this.name,
    this.description,
    this.shopName,
    this.shopImage,
    this.category,
    this.subcategory,
    this.image1,
    this.image2,
    this.image3,
    this.currency,
    this.price,
    this.quantity,
    this.deliveryFee,
    this.createdAt,
    this.updatedAt,
    this.vendor,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      shopInfo: json["shop_info"] == null
          ? null
          : ShopInfo.fromJson(json["shop_info"]),

      vendorSubcategories: json["vendor_subcategories"] == null
          ? null
          : List<VendorSubcategory>.from(json["vendor_subcategories"]
              .map((x) => VendorSubcategory.fromJson(x))),

      id: json["id"],
      name: json["name"],
      description: json["description"],
      shopName: json["shop_name"],
      shopImage: json["shop_image"],
      category: json["category"],
      subcategory: json["subcategory"],
      image1: json["image_1"],
      image2: json["image_2"],
      image3: json["image_3"],
      currency: json["currency"],
      price: json["price"],
      quantity: json["quantity"],
      deliveryFee: json["delivery_fee"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
      vendor: json["vendor"],
    );
  }
}
class ShopInfo {
  final int? id;
  final String? shopName;
  final String? shopImage;
  final String? shopLicense;
  final String? shopType;
  final String? shopAddress;
  final String? phoneNumber;
  final double? rating;
  final int? totalRatingCount;

  ShopInfo({
    this.id,
    this.shopName,
    this.shopImage,
    this.shopLicense,
    this.shopType,
    this.shopAddress,
    this.phoneNumber,
    this.rating,
    this.totalRatingCount,
  });

  factory ShopInfo.fromJson(Map<String, dynamic> json) => ShopInfo(
        id: json["id"],
        shopName: json["shop_name"],
        shopImage: json["shop_image"],
        shopLicense: json["shop_license"],
        shopType: json["shop_type"],
        shopAddress: json["shop_address"],
        phoneNumber: json["phone_number"],
        rating: (json["rating"] ?? 0).toDouble(),
        totalRatingCount: json["total_rating_count"],
      );
}
class VendorSubcategory {
  final int? id;
  final String? name;
  final String? image;
  final int? vendor;
  final int? category;
  final String? categoryName;

  VendorSubcategory({
    this.id,
    this.name,
    this.image,
    this.vendor,
    this.category,
    this.categoryName,
  });

  factory VendorSubcategory.fromJson(Map<String, dynamic> json) {
    return VendorSubcategory(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      vendor: json["vendor"],
      category: json["category"],
      categoryName: json["category_name"],
    );
  }
}
