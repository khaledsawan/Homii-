import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/AppConstants.dart';
import '../api/api_client.dart';
import '../model/login_model.dart';
import '../model/user_signIn_model.dart';
import '../model/user_signUp_model.dart';

class AuthRepo extends GetxService {
  ApiClient apiClient;
  SharedPreferences sharedPreferences;

  AuthRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });

  Future<Response> getProfileInfo() async {
    return await apiClient.getData(AppConstants.USER_INFO);
  }

  Future<Response> registerFunction(UserSignUpModel userSignUpModel) async {
    Response response = await apiClient.postData(
        AppConstants.REGISTER_URL, userSignUpModel.toJson());
    return response;
  }

  Future<Response> loginFunction(UserSingInModel userLoginModel) async {
    Response response = await apiClient.postData(
        AppConstants.LOGIN_URL, userLoginModel.toJson());
    return response;
  }

  saveUserToken(LoginModel loginModel) async {
    apiClient.token = loginModel.data!.token.toString();
    await sharedPreferences.setString(
        AppConstants.ROLE, loginModel.data!.role.toString());
    await sharedPreferences.setString(
        AppConstants.EMAIL, loginModel.data!.email.toString());
    await sharedPreferences.setString(
        AppConstants.TOKEN, loginModel.data!.token.toString());
    apiClient.updateHeaders(loginModel.data!.token.toString());
  }

  Future<void> saveUserPhoneAndPassword(String email, String password) async {
    await sharedPreferences.setString(AppConstants.EMAIL, email);
    await sharedPreferences.setString(AppConstants.PASSWORD, password);
  }

  bool isAuth() {
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  String getToken() {
    return sharedPreferences.getString(AppConstants.TOKEN).toString();
  }

  Future<bool> clearUserAuth() async {
    if (await sharedPreferences.remove(AppConstants.TOKEN) &&
        await sharedPreferences.remove(AppConstants.PHONE) &&
        await sharedPreferences.remove(AppConstants.PASSWORD)) {
      apiClient.token = '';
      apiClient.updateHeaders('');
      return true;
    } else {
      return false;
    }
  }
}
