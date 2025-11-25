import 'package:dar_dar_foodd_delivery_app/models/User/all_grocery_model.dart';
import 'package:dar_dar_foodd_delivery_app/models/User/all_nearby_restaurant_model.dart';
import 'package:dar_dar_foodd_delivery_app/models/User/banner_model.dart';
import 'package:dar_dar_foodd_delivery_app/models/User/category_model.dart';
import 'package:dar_dar_foodd_delivery_app/models/User/polular_food_and_grocery_model.dart';
import 'package:dar_dar_foodd_delivery_app/services/api_client.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLaoding = false.obs;

  var isPopularMealLoading = false.obs;

  RxList<CategoryModel> allCategoryList = <CategoryModel>[].obs;
  RxList<AllNearbyRestaurantModel> allNearbyRestaurantList =
      <AllNearbyRestaurantModel>[].obs;

  RxList<ShopData> allGroceryDataList = <ShopData>[].obs;
  RxList<ProductData> propularAllFoodList = <ProductData>[].obs;
  RxList<VendorSubcategory> vendorCategoryList = <VendorSubcategory>[].obs;

  RxList<BannerData> bannerList = <BannerData>[].obs;

  /// all category
  Future<void> fetchCategory() async {
    isLaoding(true);

    final response = await ApiClient.getData("/api/v1/products/categories/");
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<dynamic> data = response.body['data'];
      allCategoryList.value = data
          .map((e) => CategoryModel.fromJson(e))
          .toList();
    } else {
      print("something we want wrong =========> ${response.statusCode}");
    }
    isLaoding(false);
  }

  /// all nearby resturant
  Future<void> fetchAllNearbyRestaurant() async {
    isLaoding(true);

    final response = await ApiClient.getData("/api/v1/auth/all_shop/");
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<dynamic> data = response.body['data'];
      allNearbyRestaurantList.value = data
          .map((e) => AllNearbyRestaurantModel.fromJson(e))
          .toList();
    } else {
      print("something we want wrong ==========> ${response.statusCode}");
    }
    isLaoding(false);
  }

  /// fetch all grocery data
  Future<void> fetchAllGrocery() async {
    isLaoding(true);

    final response = await ApiClient.getData('/api/v1/auth/all_grocery/');
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<dynamic> data = response.body['data'];
      allGroceryDataList.value = data.map((e) => ShopData.fromJson(e)).toList();
    } else {
      print("Something we want wronge ==========> ${response.body}");
    }

    isLaoding(false);
  }

  RxDouble totalRating = 0.0.obs;
  var currentAddress = "".obs;
  var phoneNumber = "".obs;

  Future<void> fetchPopularFood({required int id}) async {
    isPopularMealLoading(true);

    final response = await ApiClient.getData("/api/v1/products/products/$id/");

    if (response.statusCode == 200 || response.statusCode == 201) {
      List<dynamic> data = response.body['data'];
      totalRating.value =
          (response.body['data'][0]['shop_info']['rating'] as num).toDouble();
      currentAddress.value =
          response.body['data'][0]['shop_info']['shop_address'] ?? '';
      phoneNumber.value =
          response.body['data'][0]['shop_info']['phone_number'] ?? '';

      propularAllFoodList.value = data
          .map((e) => ProductData.fromJson(e))
          .toList();

      vendorCategoryList.value = data
          .expand(
            (product) =>
                (product['vendor_subcategories'] as List<dynamic>?)?.map(
                  (sub) => VendorSubcategory.fromJson(sub),
                ) ??
                [],
          )
          .cast<VendorSubcategory>()
          .toList();
    } else {
      print("Something we want wronge =======> ${response.body}");
    }
    isPopularMealLoading(false);
  }

  Future<void> fetchAllBanner() async {
    isLaoding(true);

    final response = await ApiClient.getData("/api/v1/auth/banners/");
    if (response.statusCode == 200 || response.statusCode == 201) {
      final List<dynamic> data = response.body['data'];

      bannerList.value = data.map((e) => BannerData.fromJson(e)).toList();
    } else {
      print("Something we want wrong ==========> ${response.body}");
    }
    isLaoding(false);
  }
}
