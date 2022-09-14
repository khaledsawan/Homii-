import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homii_v2/component/bottom_sheet/show_bottom-sheet_middleware.dart';
import 'package:homii_v2/component/button/custom_button.dart';
import 'package:homii_v2/component/inputtextform/inputtextform.dart';
import 'package:homii_v2/component/text/big_text.dart';
import 'package:homii_v2/routes/routes.dart';
import 'package:homii_v2/utils/colors.dart';
import '../../../logic/Controllers/auth/register_controller.dart';

class RegisterViewM extends StatelessWidget {
  const RegisterViewM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(child:
        Scaffold(
            backgroundColor: AppColors.white,
            body: GetBuilder<RegisterController>(builder: (controller) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                  width: width * 0.7,
                  height: height * 0.3,
                  child:
                      Image.asset('images/Screenshot 2022-09-05 031827.png')),
            ),
            InPutTextForm(
                height: 50,
                icon: Icons.person,
                hintColor: AppColors.hintColor,
                hintText: 'name'.tr,
                color: AppColors.mainColor,
                textEditingController: controller.nameController),
            const SizedBox(
              height: 25,
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
                height: 50,
                icon: Icons.phone,
                hintColor: AppColors.hintColor,
                hintText: 'phone number'.tr,
                isNumber: true,
                color: AppColors.mainColor,
                textEditingController: controller.phoneController),
            const SizedBox(
              height: 25,
            ),
            InPutTextForm(
                height: 50,
                isPassword: true,
                icon: Icons.password,
                hintColor: AppColors.hintColor,
                hintText: 'your password'.tr,
                color: AppColors.mainColor,
                textEditingController: controller.passwordController),
            const SizedBox(
              height: 60,
            ),
            CustomButton(
              buttonText: 'register'.tr,
              width: 145,
              height: 60,
              radius: 16,
              onPressed: () =>showBottomSheetMiddleWare(context, Get.find()),
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
                    'you have account?'.tr,
                    style: const TextStyle(color: AppColors.hintColor, fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.login);
                    },
                    child: Container(
                      color: AppColors.white,
                      child: BigText(
                        textBody: 'SingIn'.tr,
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
