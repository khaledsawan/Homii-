import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class RegisterController extends GetxController{
  bool isLoad = false;

  late TextEditingController emailController, passwordController,nameController,phoneController;
  @override
  void dispose() async {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
    nameController = TextEditingController();
    super.onInit();
  }
}