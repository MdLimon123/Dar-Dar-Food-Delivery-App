import 'package:dar_dar_foodd_delivery_app/utils/commond_data.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataController extends GetxController {
  /// user data
  var id = "".obs;
  var role = "".obs;
  var fullName = "".obs;
  var email = "".obs;
  var profileImage = "".obs;
  var currentLocation = "".obs;
  var phone = "".obs;



/// vendor data


  var vendorId = "".obs;
  var vendorName = "".obs;
  var vendorEmail = "".obs;
  var vendorImage = "".obs;
  var vendorRole = "".obs;

  var vendorCurrentLocation = "".obs;
  var currentAddress = "".obs;

  var shopName = "".obs;
  var shopImage = "".obs;
  var shopLicense = "".obs;
  var shopType = "".obs;
  var shopAddress = "".obs;

  var ratting = "".obs;

  var bankName = "".obs;
  var accountName = "".obs;
  var accountNumber = "".obs;
  var branch = "".obs;



  late SharedPreferences preferences;

  /// get user data
  getData() async {
    preferences = await SharedPreferences.getInstance();
    id.value = preferences.getString(CommonData.id) ?? "";
    email.value = preferences.getString(CommonData.email) ?? "";
    fullName.value = preferences.getString(CommonData.fullName) ?? "";
    role.value = preferences.getString(CommonData.role) ?? "";
    currentLocation.value = preferences.getString(CommonData.address) ?? "";
    profileImage.value = preferences.getString(CommonData.profileImage) ?? "";
  }

  /// set user data

  setData({
    required String idD,
    required String emailD,
    required String nameD,
    required String phoneD,
    required String roldD,
    required String currentLocationD,
  }) async {
    id.value = idD;
    email.value = emailD;
    fullName.value = nameD;
    phone.value = phoneD;
    role.value = roldD;
    currentLocation.value = currentLocationD;

    preferences = await SharedPreferences.getInstance();
    preferences.setString(CommonData.id, idD);
    preferences.setString(CommonData.email, emailD);
    preferences.setString(CommonData.fullName, nameD);
    preferences.setString(CommonData.role, roldD);
    preferences.setString(CommonData.phone, phoneD);
    preferences.setString(CommonData.address, currentLocationD);
  }



  /// SET VENDOR DATA

  Future<void> setVendorData({
    required String vendorIdD,
    required String vendorNameD,
    required String vendorEmailD,
    required String vendorImageD,
    required String vendorRoleD,
    required String currentLocationD,
    required String currentAddressD,
    required String shopNameD,
    required String shopImageD,
    required String shopLicenseD,
    required String shopTypeD,
    required String shopAddressD,
    required String rattingD,
    required String bankNameD,
    required String accountNameD,
    required String accountNumberD,
    required String branchD,
  }) async {
    preferences = await SharedPreferences.getInstance();

    vendorId.value = vendorIdD;
    vendorName.value = vendorNameD;
    vendorEmail.value = vendorEmailD;
    vendorImage.value = vendorImageD;
    vendorRole.value = vendorRoleD;

    currentLocation.value = currentLocationD;
    currentAddress.value = currentAddressD;

    shopName.value = shopNameD;
    shopImage.value = shopImageD;
    shopLicense.value = shopLicenseD;
    shopType.value = shopTypeD;
    shopAddress.value = shopAddressD;

    ratting.value = rattingD;

    bankName.value = bankNameD;
    accountName.value = accountNameD;
    accountNumber.value = accountNumberD;
    branch.value = branchD;

    // save in SharedPreferences
    preferences.setString(CommonData.vendorId, vendorIdD);
    preferences.setString(CommonData.vendorName, vendorNameD);
    preferences.setString(CommonData.vendorEmail, vendorEmailD);
    preferences.setString(CommonData.vendorImage, vendorImageD);
    preferences.setString(CommonData.vendorRole, vendorRoleD);

    preferences.setString(CommonData.currentLocation, currentLocationD);
    preferences.setString(CommonData.currentAddress, currentAddressD);

    preferences.setString(CommonData.shopName, shopNameD);
    preferences.setString(CommonData.shopImage, shopImageD);
    preferences.setString(CommonData.shopLicense, shopLicenseD);
    preferences.setString(CommonData.shopType, shopTypeD);
    preferences.setString(CommonData.shopAddress, shopAddressD);

    preferences.setString(CommonData.ratting, rattingD);

    preferences.setString(CommonData.bankName, bankNameD);
    preferences.setString(CommonData.accountName, accountNameD);
    preferences.setString(CommonData.accountNumber, accountNumberD);
    preferences.setString(CommonData.branch, branchD);
  }



  /// GET VENDOR DATA

  Future<void> getVendorData() async {
    preferences = await SharedPreferences.getInstance();

    vendorId.value = preferences.getString(CommonData.vendorId) ?? "";
    vendorName.value = preferences.getString(CommonData.vendorName) ?? "";
    vendorEmail.value = preferences.getString(CommonData.vendorEmail) ?? "";
    vendorImage.value = preferences.getString(CommonData.vendorImage) ?? "";
    vendorRole.value = preferences.getString(CommonData.vendorRole) ?? "";

    currentLocation.value = preferences.getString(CommonData.currentLocation) ?? "";
    currentAddress.value = preferences.getString(CommonData.currentAddress) ?? "";

    shopName.value = preferences.getString(CommonData.shopName) ?? "";
    shopImage.value = preferences.getString(CommonData.shopImage) ?? "";
    shopLicense.value = preferences.getString(CommonData.shopLicense) ?? "";
    shopType.value = preferences.getString(CommonData.shopType) ?? "";
    shopAddress.value = preferences.getString(CommonData.shopAddress) ?? "";

    ratting.value = preferences.getString(CommonData.ratting) ?? "";

    bankName.value = preferences.getString(CommonData.bankName) ?? "";
    accountName.value = preferences.getString(CommonData.accountName) ?? "";
    accountNumber.value = preferences.getString(CommonData.accountNumber) ?? "";
    branch.value = preferences.getString(CommonData.branch) ?? "";
  }


  updateProfileImage(String profileImageD) async {
    preferences = await SharedPreferences.getInstance();
    profileImage.value = profileImageD;
    preferences.setString(CommonData.profileImage, profileImageD);
  }
}
