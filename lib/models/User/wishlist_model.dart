class WishlistModel {
  final String status;
  final List<WishlistItem> data;

  WishlistModel({required this.status, required this.data});

  factory WishlistModel.fromJson(Map<String, dynamic> json) {
    return WishlistModel(
      status: json['status'],
      data: (json['data'] as List)
          .map((item) => WishlistItem.fromJson(item))
          .toList(),
    );
  }
}

class WishlistItem {
  final int id;
  final int user;
  final WishlistProduct product;
  final String createdAt;
  final String updatedAt;

  WishlistItem({
    required this.id,
    required this.user,
    required this.product,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WishlistItem.fromJson(Map<String, dynamic> json) {
    return WishlistItem(
      id: json['id'],
      user: json['user'],
      product: WishlistProduct.fromJson(json['product']),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class WishlistProduct {
  final int id;
  final String name;
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
  final ShopInfo? shopInfo;
  final List<VendorSubcategory> vendorSubcategories;

  WishlistProduct({
    required this.id,
    required this.name,
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
    this.shopInfo,
    required this.vendorSubcategories,
  });

  factory WishlistProduct.fromJson(Map<String, dynamic> json) {
    return WishlistProduct(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'],
      shopName: json['shop_name'],
      shopImage: json['shop_image'],
      category: json['category'],
      subcategory: json['subcategory'],
      image1: json['image_1'],
      image2: json['image_2'],
      image3: json['image_3'],
      currency: json['currency'],
      price: json['price'],
      quantity: json['quantity'],
      deliveryFee: json['delivery_fee'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      vendor: json['vendor'],
      shopInfo: json['shop_info'] != null
          ? ShopInfo.fromJson(json['shop_info'])
          : null,
      vendorSubcategories: json['vendor_subcategories'] != null
          ? (json['vendor_subcategories'] as List)
                .map((item) => VendorSubcategory.fromJson(item))
                .toList()
          : [],
    );
  }
}

class ShopInfo {
  final int id;
  final String shopName;
  final String shopImage;
  final String shopLicense;
  final String shopType;
  final String shopAddress;
  final String phoneNumber;
  final double rating;
  final int totalRatingCount;

  ShopInfo({
    required this.id,
    required this.shopName,
    required this.shopImage,
    required this.shopLicense,
    required this.shopType,
    required this.shopAddress,
    required this.phoneNumber,
    required this.rating,
    required this.totalRatingCount,
  });

  factory ShopInfo.fromJson(Map<String, dynamic> json) {
    return ShopInfo(
      id: json['id'],
      shopName: json['shop_name'],
      shopImage: json['shop_image'],
      shopLicense: json['shop_license'],
      shopType: json['shop_type'],
      shopAddress: json['shop_address'],
      phoneNumber: json['phone_number'],
      rating: (json['rating'] as num).toDouble(),
      totalRatingCount: json['total_rating_count'],
    );
  }
}

class VendorSubcategory {
  final int id;
  final String name;
  final String image;
  final int vendor;
  final int category;
  final String categoryName;

  VendorSubcategory({
    required this.id,
    required this.name,
    required this.image,
    required this.vendor,
    required this.category,
    required this.categoryName,
  });

  factory VendorSubcategory.fromJson(Map<String, dynamic> json) {
    return VendorSubcategory(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      vendor: json['vendor'],
      category: json['category'],
      categoryName: json['category_name'],
    );
  }
}
