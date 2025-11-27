import 'package:dar_dar_foodd_delivery_app/models/User/wishlist_model.dart';
import 'package:dar_dar_foodd_delivery_app/services/api_client.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  var isLoading = false.obs;

  RxList<WishlistProduct> wishListProduct = <WishlistProduct>[].obs;

Future<void> fetchWishListProduct() async {
  isLoading(true);

  final response = await ApiClient.getData("/api/v1/wishlist/");

  if (response.statusCode == 200) {
    List<dynamic> data = response.body['data'];

  
    final List<WishlistItem> items = data
        .map((item) => WishlistItem.fromJson(item))
        .toList();

    
    wishListProduct.value = items.map((e) => e.product).toList();

  } else {
    print("Error fetching wishlist products: ${response.statusCode}");
  }

  isLoading(false);
}

}
