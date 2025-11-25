import 'package:dar_dar_foodd_delivery_app/models/User/shop_banner_model';
import 'package:dar_dar_foodd_delivery_app/services/api_client.dart';
import 'package:get/get.dart';

class ShopController extends GetxController {
  var isLoading = false.obs;

  RxList<ShopBannerData> shopBannerList = <ShopBannerData>[].obs;

  RxInt quantity = 1.obs;
  double basePrice = 98.0;
  double originalPrice = 198.0;

  double get totalPrice => basePrice * quantity.value;
  double get totalOriginalPrice => originalPrice * quantity.value;

  void increaseQuantity() {
    quantity.value++;
  }

  void decreaseQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  Future<void> fetchShopBanner({required int id}) async {
    isLoading(true);

    final response = await ApiClient.getData(
      "/api/v1/auth/banners/vendor/$id/",
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = response.body['data'];

      shopBannerList.value = [ShopBannerData.fromJson(data)];
    } else {
      print("Something we want to wrong ===========> ${response.body}");
    }
    isLoading(false);
  }
}
