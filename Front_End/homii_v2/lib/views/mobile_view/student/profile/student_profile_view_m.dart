import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homii_v2/component/icon_than_text/icon_than_text.dart';
import 'package:homii_v2/logic/Controllers/student/student_register_controller.dart';
import 'package:homii_v2/routes/routes.dart';
import '../../../../component/appbar/appbar.dart';
import '../../../../component/text/big_text.dart';
import '../../../../utils/colors.dart';

class StudentProfileViewM extends StatelessWidget {
  const StudentProfileViewM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return GetBuilder<StudentRegisterController>(builder: (controller) {
      return !controller.isLoad
          ? SafeArea(
              child: Scaffold(
                  appBar: appBar(Icons.edit, 'Edit Profile'.tr, () {
                    Get.toNamed(AppRoutes.studentupdateprofile);
                  }, 'Profile'.tr, Icons.adb, () {}),
                  body: SingleChildScrollView(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        width: width * 0.95,
                        height: height * 0.33,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[300]!,
                                blurRadius: 4,
                                spreadRadius: 1,
                                offset: const Offset(0, 4),
                                blurStyle: BlurStyle.normal)
                          ],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 3, color: AppColors.searchColor),
                          image: const DecorationImage(
                              image: AssetImage('images/me.jpg'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: IconThanText(
                            sizedWidth: 4,
                            icon: Icons.location_on,
                            text: 'syria damascus muzzy ',
                            color: AppColors.white),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 20),
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.mainColor),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[300]!,
                                  blurRadius: 8,
                                  spreadRadius: 2,
                                  offset: const Offset(0, 4),
                                  blurStyle: BlurStyle.normal)
                            ]),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.all(4),
                              child: Image.asset(
                                  width: 22,
                                  height: 22,
                                  fit: BoxFit.cover,
                                  'images/age.png'),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            BigText(
                              color: Colors.black54,
                              textBody: 'address'.tr,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: IconThanText(
                            sizedWidth: 4,
                            icon: Icons.school,
                            text: 'Damascus university',
                            color: AppColors.white),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: IconThanText(
                            height: 70,
                            maxLine: 3,
                            sizedWidth: 4,
                            icon: Icons.description,
                            text: 'software engineering in damascus university',
                            color: AppColors.white),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ))),
            )
          : Scaffold(
              appBar: appBar(Icons.edit, 'Edit Profile'.tr, () {
                Get.toNamed(AppRoutes.studentupdateprofile);
              }, 'Profile'.tr, Icons.adb, () {}),
              body: const Center(
                  child: CircularProgressIndicator(
                color: AppColors.mainColor,
              )));
    });
  }
}
