import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homii_v2/component/button/custom_button.dart';
import 'package:homii_v2/component/inputtextform/inputtextform.dart';
import 'package:homii_v2/component/loop/loop_animation.dart';
import 'package:homii_v2/component/text/big_text.dart';
import 'package:homii_v2/logic/Controllers/auth/login_controller.dart';
import 'package:homii_v2/utils/colors.dart';
import '../../../component/Custom_snackpar/show_custom_snackPar_red.dart';
import '../../../routes/routes.dart';
import '../../../service/model/user_signIn_model.dart';

class LoginViewM extends StatelessWidget {
  const LoginViewM({Key? key}) : super(key: key);

  void _loginMethod(LoginController loginController) {
    String email = loginController.emailController.text.trim();
    String password = loginController.passwordController.text.trim();
    if (email.isEmpty) {
      ShowCustomSnackparRed('enter your email ', 'empty field');
    } else if (!email.isEmail) {
      ShowCustomSnackparRed('you need to enter email only', 'not email ');
    } else if (password.isEmpty) {
      ShowCustomSnackparRed('enter your password ', 'empty field');
    } else if (password.length < 8) {
      ShowCustomSnackparRed(
          'short password must more than 8 characters', 'short password');
    } else {
      UserSingInModel userLoginModel =  UserSingInModel(email, password);
      loginController.loginFunction(userLoginModel).then((status) async {
        if (status.isSuccessful!) {
          if (loginController.loginModel.data!.role == 'student') {
            Get.offNamed(AppRoutes.studentmain);
            // await Get.find<HouseIndexController>()
            //     .getMyProduct()
            //     .then((value) => {
            //
            //   await Get.find<HouseIndexController>()
            //            //     .getMyProduct()
            //            //     .then((value) => {
            //            //    Get.toNamed();
            //            //
            //            //   });
            //   });

          } else if (loginController.loginModel.data!.role == 'office') {
            Get.offAllNamed(AppRoutes.officemain);
          } else {
            Get.offAllNamed(AppRoutes.donormain);
          }
        } else {
          ShowCustomSnackparRed('${status.massage}', 'error');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.white,
            body: GetBuilder<LoginController>(builder: (controller) {
              return controller.isLoad?
               const LoopAnimation():SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                          width: width * 0.7,
                          height: height * 0.3,
                          child: Image.asset(
                              'images/Screenshot 2022-09-05 031827.png')),
                    ),
                    InPutTextForm(
                        height: 50,
                        icon: Icons.email,
                        hintColor: AppColors.hintColor,
                        hintText: 'examble@gmail.com',
                        color: AppColors.mainColor,
                        textEditingController: controller.emailController),
                    const SizedBox(
                      height: 25,
                    ),
                    InPutTextForm(
                        isPassword: true,
                        height: 50,
                        icon: Icons.password,
                        hintColor: AppColors.hintColor,
                        hintText: 'your password'.tr,
                        color: AppColors.mainColor,
                        textEditingController: controller.passwordController),
                    const SizedBox(
                      height: 60,
                    ),
                    CustomButton(
                      buttonText: 'Login'.tr,
                      width: 145,
                      height: 60,
                      radius: 16,
                      onPressed: () {
                        _loginMethod(controller);
                      },
                      fontSize: 23,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        children: [
                          Text(
                            'don\'t have account?'.tr,
                            style: const TextStyle(
                                color: AppColors.hintColor, fontSize: 18),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.register);
                            },
                            child: Container(
                              color: AppColors.white,
                              child: BigText(
                                textBody: 'SingUp'.tr,
                                color: AppColors.mainColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            })));
  }
}
