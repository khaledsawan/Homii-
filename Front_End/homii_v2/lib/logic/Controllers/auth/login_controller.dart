import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../component/Custom_snackpar/show_custom_snackPar_red.dart';
import '../../../service/model/login_model.dart';
import '../../../service/model/response_model.dart';
import '../../../service/model/user_signIn_model.dart';
import '../../../service/repository/auth_repo.dart';

class LoginController extends GetxController implements GetxService {
  bool isLoad = false;
  late LoginModel loginModel;
  late AuthRepo authRepo;
  late SharedPreferences prefs;
  late TextEditingController emailController, passwordController;

  LoginController({required this.prefs, required this.authRepo});
  @override
  void dispose() async {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  Future<ResponseModel> loginFunction(UserSingInModel userSingInModel) async {
    isLoad = true;
    ResponseModel responseModel;
    Response response = await authRepo.loginFunction(userSingInModel);

    if (response.statusCode == 200) {
      isLoad = false;
      responseModel =
          ResponseModel(massage: response.statusText, isSuccessful: true);
      loginModel = LoginModel.fromJson(response.body);
      await authRepo.saveUserToken(loginModel);
    } else {
      ShowCustomSnackparRed('not done ', 'error');
      responseModel =
          ResponseModel(massage: response.statusText!, isSuccessful: false);
    }
    isLoad = false;
    update();
    return responseModel;
  }
}
