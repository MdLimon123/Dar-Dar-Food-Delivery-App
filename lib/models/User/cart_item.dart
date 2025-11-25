import 'package:get/get.dart';

class CartItem {
  int id;
  String name;
  String image;
  double price;
  RxInt quantity; // Reactive quantity
  String gm;

  CartItem({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required int quantity,
    required this.gm,
  }) : quantity = quantity.obs;

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        price: (json['price'] as num).toDouble(),
        quantity: json['quantity'],
        gm: json['gm'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'price': price,
        'quantity': quantity.value,
        'gm': gm,
      };
}
