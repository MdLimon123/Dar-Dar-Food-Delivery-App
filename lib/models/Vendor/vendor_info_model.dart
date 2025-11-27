class VendorInfoModel {
  final int? id;
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final String? image;
  final String?role;
  final String? currentLocation;
  final String? currentAddress;
  final bool? isApproved;
  final String? shopName;
  final String? shopImage;
  final String? shopLicense;
  final String? shopType;
  final String? shopAddress;
  final double? rating;
  final int? totalRatingCount;
  final String? bankName;
  final String? accountName;
  final String? accountNumber;
  final String? branch;

  VendorInfoModel({
     this.id,
     this.fullName,
     this.email,
     this.phoneNumber,
    this.image,
     this.role,
    this.currentLocation,
     this.currentAddress,
    this.isApproved,
    this.shopName,
    this.shopImage,
    this.shopLicense,
    this.shopType,
    this.shopAddress,
    this.rating,
    this.totalRatingCount,
    this.bankName,
    this.accountName,
    this.accountNumber,
    this.branch,
  });

  // From JSON
  factory VendorInfoModel.fromJson(Map<String, dynamic> json) {
    return VendorInfoModel(
      id: json['id'] ?? 0,
      fullName: json['full_name'] ?? "",
      email: json['email'] ?? "",
      phoneNumber: json['phone_number'] ?? "",
      image: json['image'],
      role: json['role'] ?? "",
      currentLocation: json['current_location'],
      currentAddress: json['current_address'] ?? "",
      isApproved: json['is_approved'] ?? false,
      shopName: json['shop_name'] ?? "",
      shopImage: json['shop_image'] ?? "",
      shopLicense: json['shop_license'] ?? "",
      shopType: json['shop_type'] ?? "",
      shopAddress: json['shop_address'] ?? "",
      rating: (json['rating'] ?? 0).toDouble(),
      totalRatingCount: json['total_rating_count'] ?? 0,
      bankName: json['bank_name'] ?? "",
      accountName: json['account_name'] ?? "",
      accountNumber: json['account_number'] ?? "",
      branch: json['branch'] ?? "",
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'email': email,
      'phone_number': phoneNumber,
      'image': image,
      'role': role,
      'current_location': currentLocation,
      'current_address': currentAddress,
      'is_approved': isApproved,
      'shop_name': shopName,
      'shop_image': shopImage,
      'shop_license': shopLicense,
      'shop_type': shopType,
      'shop_address': shopAddress,
      'rating': rating,
      'total_rating_count': totalRatingCount,
      'bank_name': bankName,
      'account_name': accountName,
      'account_number': accountNumber,
      'branch': branch,
    };
  }
}
