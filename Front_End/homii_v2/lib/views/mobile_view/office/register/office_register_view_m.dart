import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homii_v2/component/appbar/appbar.dart';
import 'package:homii_v2/component/image/take_image_layout.dart';
import '../../../../component/custom_radio/gender_custom_radio.dart';
import '../../../../component/inputtextform/inputtextform.dart';
import '../../../../logic/Controllers/donor/donor_register_controller.dart';
import '../../../../utils/colors.dart';

class OfficeRegisterViewM extends StatelessWidget {
  const OfficeRegisterViewM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return GetBuilder<DonorRegisterController>(builder: (controller) {
      return !controller.isLoad
          ? SafeArea(
              child: Scaffold(
                  appBar: appBar(Icons.next_plan, 'Continue'.tr, () {},
                      'fill out a form'.tr, Icons.adb, () {}),
                  body: SingleChildScrollView(
                      child: Container(
                    alignment: Alignment.topCenter,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            opacity: 0.25,
                            image: AssetImage(
                              'images/office.png',
                            ))),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        takeImageLayout('press to set id image'.tr,
                            controller, context, width, height),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 30, right: 30, bottom: 20, top: 35),
                          width: width,
                          height: 50,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: controller.genders.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    splashColor: AppColors.mainColor2,
                                    onTap: () {
                                      controller.genderGenerator(index);
                                    }, //
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
                              textEditingController:
                                  controller.addressController),
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
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ))),
            )
          : SafeArea(
              child: Scaffold(
                  appBar: appBar(Icons.next_plan, 'Continue'.tr, () {},
                      'fill out a form'.tr, Icons.adb, () {}),
                  body: const Center(
                      child: CircularProgressIndicator(
                    color: AppColors.mainColor,
                  ))),
            );
    });
  }
}
