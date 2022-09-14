import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homii_v2/logic/Controllers/student/student_register_controller.dart';
import '../../../../component/appbar/appbar.dart';
import '../../../../component/image/take_image_layout.dart';
import '../../../../component/inputtextform/inputtextform.dart';
import '../../../../utils/colors.dart';

class StudentUpdateProfileViewM extends StatelessWidget {
  const StudentUpdateProfileViewM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GetBuilder<StudentRegisterController>(builder: (controller) {
      return !controller.isLoad
          ? SafeArea(
            child: Scaffold(
            appBar: appBar(Icons.save, 'Save'.tr, (){}, 'Edit Profile'.tr, Icons.adb, (){}),
            body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    takeImageLayout(
                        'Insert a photo of your university card'.tr, controller, context, width, height),

                    Container(
                      margin: const EdgeInsets.only(bottom: 20,top: 20),
                      child: InPutTextForm(
                          icon: Icons.location_on,
                          hintColor: AppColors.hintColor,
                          hintText: 'address'.tr,
                          color: AppColors.mainColor,
                          textEditingController: controller.addressController),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: InPutTextForm(
                          icon: Icons.email,
                          hintColor: AppColors.hintColor,
                          hintText: 'academic year'.tr,
                          color: AppColors.mainColor,
                          textEditingController: controller.academicYearController),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 25),
                      child: InPutTextForm(
                          icon: Icons.email,
                          hintColor: AppColors.hintColor,
                          hintText: 'description'.tr,
                          maxLine: 7,
                          color: AppColors.mainColor,
                          textEditingController:
                          controller.descriptionController),
                    ),

                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ))),
          )
          : Scaffold(
          appBar: appBar(Icons.save, 'Save'.tr, (){}, 'Edit Profile'.tr, Icons.adb, (){}),
          body: const Center(
              child: CircularProgressIndicator(
                color: AppColors.mainColor,
              )));
    });
  }
}
