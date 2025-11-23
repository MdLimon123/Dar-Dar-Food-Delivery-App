class ApiConstant {
  static String baseUrl = "http://10.10.12.49:8001"; // test server
  static String imageBaseUrl = "http://10.10.12.49:8001";
  static String userSignupEndPoint = "/api/v1/auth/signup/";
  static String userEmailVerifedEndPoint = "/api/v1/auth/verify-otp/";
  static String userLoignEndPoint = "/api/v1/auth/login/";
  static String userForgetPasswordEndPoint = "/api/v1/auth/resend-otp/";
  static String userResetPasswordEndPoint = "/api/v1/auth/reset-password/";

  /// user

  static String userProfileEndPoint = "/api/v1/auth/user_profile/";

  /// google api key
  static String? googleApiKey = "AIzaSyDEOhUOUDVMYiBOHqEtCnyrztCrlOqZ6bo";
  static String googleBaseUrl =
      "https://maps.googleapis.com/maps/api/place/autocomplete/json";
  static String findPlaceApiUrl =
      "https://maps.googleapis.com/maps/api/place/findplacefromtext/json";
}
