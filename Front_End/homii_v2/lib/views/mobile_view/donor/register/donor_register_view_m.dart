import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homii_v2/component/appbar/appbar.dart';
import '../../../../component/button/custom_button.dart';
import '../../../../component/custom_radio/gender_custom_radio.dart';
import '../../../../component/image/take_image_layout.dart';
import '../../../../component/inputtextform/inputtextform.dart';
import '../../../../logic/Controllers/donor/donor_register_controller.dart';
import '../../../../utils/colors.dart';

class DonorRegisterViewM extends StatelessWidget {
  const DonorRegisterViewM({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GetBuilder<DonorRegisterController>(builder: (controller) {
      return !controller.isLoad
          ? Scaffold(
              appBar:
                  appBar(Icons.adb, '', () {}, 'register'.tr, Icons.adb, () {}),
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
                    child: Image.asset('images/donor-grope2.png'),
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
                        icon: Icons.location_on,
                        hintColor: AppColors.hintColor,
                        hintText: 'address'.tr,
                        maxLine: 1,
                        color: AppColors.mainColor,
                        textEditingController: controller.addressController),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    child: InPutTextForm(
                        icon: Icons.work_history,
                        hintColor: AppColors.hintColor,
                        hintText: 'work details'.tr,
                        maxLine: 7,
                        color: AppColors.mainColor,
                        textEditingController:
                            controller.workDetailsController),
                  ),
                  takeImageLayout(
                      'Enter id image'.tr, controller, context, width, height),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    width: 140,
                    height: 70,
                    buttonText: 'Continue'.tr,
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
                  Icons.adb, ''.tr, () {}, 'Register'.tr, Icons.adb, () {}),
              body: const Center(
                  child: CircularProgressIndicator(
                color: AppColors.mainColor,
              )));
    });
  }
}
