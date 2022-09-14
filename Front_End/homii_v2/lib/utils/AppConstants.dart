class AppConstants {
                   /*  for app   */
  static const String APP_NAME = "homii";
  static const int APP_VERSION = 2;

                   /*  for api   */

  //for base Uri
  static const String BASE_URL = "http://192.168.1.6:8000";

  //for product
  static const String STUDENTHOUSEINDEX = "/api/student/house/index";
  static const String RECOMMENDED_PRODUCT_URL = "/api/v1/products/recommended";

  //for Auth
  static const String REGISTER_URL = "/api/v1/auth/register";
  static const String LOGIN_URL = "/api/login";
  static const String USER_INFO = "/api/v1/customer/info?con";
  static const String UPDATE_USER_PROFILE = "/api/v1/customer/update-profile";

  //for Address
  static const String GEOCODE_URI = '/api/v1/config/geocode-api';
  static const String ZONE_URI = '/api/v1/config/get-zone-id';
  static const String ADD_USER_ADDRESS = "/api/v1/customer/address/add";
  static const String ADDRESS_LIST_URI = "/api/v1/customer/address/list";
  static const String SEARCH_LOCATION_URI = '/api/v1/config/place-api-autocomplete';
  static const String PLACE_DETATLS_URI = '/api/v1/config/place-api-details';
 /*
 Order config
  */
  static const String PLACE_ORDER_URI = '/api/v1/customer/order/place';

  /*  for local storage   */

  //for Auth
  static const String TOKEN = "token";
  static const String ROLE = "role";
  static const String PHONE = "phone";
  static const String PASSWORD = "password";
  static const String EMAIL = "email";

  //for address
  static const String USER_ADDRESS = "user_address";

  //for user cart
  static const String INTRO = "intro";
  static const String CART_HISTORY_KEY = "cart_history_key";
}
