import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homii_v2/logic/Controllers/student/student_register_controller.dart';
import '../../../../component/appbar/appbar.dart';
import '../../../../component/button/custom_button.dart';
import '../../../../component/custom_radio/gender_custom_radio.dart';
import '../../../../component/image/take_image_layout.dart';
import '../../../../component/inputtextform/inputtextform.dart';
import '../../../../utils/colors.dart';

class StudentRegisterViewM extends StatelessWidget {
  const StudentRegisterViewM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return GetBuilder<StudentRegisterController>(builder: (controller) {
      return !controller.isLoad
          ? Scaffold(
              appBar: appBar(
                  Icons.adb, '', () {}, 'fill out a form'.tr, Icons.adb, () {}),
              body: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: width * 0.5,
                    height: height * 0.22,
                    child: Image.asset('images/add_student.png'),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 30, right: 30, bottom: 20, top: 40),
                    width: width,
                    height: 75,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: controller.genders.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              splashColor: AppColors.mainColor2,
                              onTap: () {
                                controller.genderGenerator(index);
                              },
                              child: GenderCustomRadio(
                                  false, controller.genders[index]));
                        }),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: InPutTextForm(
                        icon: Icons.email,
                        hintColor: AppColors.hintColor,
                        hintText: 'city'.tr,
                        color: AppColors.mainColor,
                        textEditingController: controller.cityController),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: InPutTextForm(
                        icon: Icons.email,
                        hintColor: AppColors.hintColor,
                        hintText: 'age'.tr,
                        color: AppColors.mainColor,
                        textEditingController: controller.ageController),
                  ),

                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: InPutTextForm(
                        icon: Icons.email,
                        hintColor: AppColors.hintColor,
                        hintText: 'academic Year'.tr,
                        color: AppColors.mainColor,
                        textEditingController:
                            controller.academicYearController),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: InPutTextForm(
                        icon: Icons.email,
                        hintColor: AppColors.hintColor,
                        hintText: 'university College'.tr,
                        color: AppColors.mainColor,
                        textEditingController:
                            controller.universityCollegeController),
                  ), //add your university card hear!
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
                  takeImageLayout('add your university card hear!'.tr,
                      controller, context, width, height),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    width: 140,
                    height: 80,
                    buttonText: 'Register'.tr,
                    radius: 15,
                    fontSize: 26,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              )))
          : Scaffold(
              appBar: appBar(
                  Icons.adb, '', () {}, 'fill out a form'.tr, Icons.adb, () {}),
              body: const Center(
                  child: CircularProgressIndicator(
                color: AppColors.mainColor,
              )));
    });
  }
}
