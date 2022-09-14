import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homii_v2/component/image/back_ground_image.dart';
import 'package:homii_v2/logic/Controllers/student/student_register_controller.dart';
import '../../../../component/appbar/appbar.dart';
import '../../../../component/image/take_image_layout.dart';
import '../../../../component/inputtextform/inputtextform.dart';
import '../../../../utils/colors.dart';

class ProfileUpdateDonorViewM extends StatelessWidget {
  const ProfileUpdateDonorViewM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return GetBuilder<StudentRegisterController>(builder: (controller) {
      return !controller.isLoad
          ? SafeArea(
        child: Scaffold(
            appBar: appBar(Icons.save, 'save'.tr, () {},
                'Edit Profile'.tr, Icons.adb, () {}),
            body: BackGroundImage(image: 'images/update-profile.png',widget:  SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    takeImageLayout(
                        'Enter id image'.tr, controller, context, width, height),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20, top: 50),
                      child: InPutTextForm(
                          icon: Icons.location_on,
                          hintColor: AppColors.hintColor,
                          hintText: 'address'.tr,
                          color: AppColors.mainColor,
                          textEditingController:
                          controller.addressController),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: InPutTextForm(
                          icon: Icons.email,
                          hintColor: AppColors.hintColor,
                          hintText: 'khaled963sawan@gmail.com',
                          color: AppColors.mainColor,
                          textEditingController:
                          controller.academicYearController),
                    ),
                    InPutTextForm(
                        icon: Icons.phone,
                        hintColor: AppColors.hintColor,
                        hintText: '0967184204',
                        color: AppColors.mainColor,
                        textEditingController:
                        controller.descriptionController),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                )),)),
      )
          : Scaffold(
          appBar: appBar(Icons.save, 'save'.tr, () {},
              'Edit Profile'.tr, Icons.adb, () {}),
          body: const Center(
              child: CircularProgressIndicator(
                color: AppColors.mainColor,
              )));
    });
  }
}
