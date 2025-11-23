class UserInfoModel {
  final int? id;
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final String? image;
  final String? role;
  final String? currentLocation;
  final String? currentAddress;
  final String? deliveryAddress;

  UserInfoModel({
    this.id,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.image,
    this.role,
    this.currentLocation,
    this.currentAddress,
    this.deliveryAddress,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      id: json['id'] ?? '0',
      fullName: json['full_name'] ?? '',
      email: json['email'],
      phoneNumber: json['phone_number'] ?? '',
      image: json['image'] ?? '',
      role: json['role'] ?? '',
      currentLocation: json['current_location'] ?? '',
      currentAddress: json['current_address'],
      deliveryAddress: json['delivery_address'] ?? '',
    );
  }

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
      'delivery_address': deliveryAddress,
    };
  }
}
