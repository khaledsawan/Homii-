import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homii_v2/component/appbar/appbar.dart';
import 'package:homii_v2/component/image/back_ground_image.dart';
import 'package:homii_v2/component/image/take_image_layout.dart';
import 'package:homii_v2/logic/Controllers/office/add_house_office_controller.dart';
import '../../../../component/inputtextform/inputtextform.dart';
import '../../../../utils/colors.dart';

class AddHouseViewM extends StatelessWidget {
  const AddHouseViewM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GetBuilder<AddHouseOfficeController>(builder: (controller) {
      return !controller.isLoad
          ? SafeArea(
              child: Scaffold(
                  appBar: appBar(Icons.add_home, 'add home'.tr, () {},
                      'add home'.tr, Icons.adb, () {}),
                  body: BackGroundImage(
                      image: 'images/office.png',
                      widget: SingleChildScrollView(
                          child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          takeImageLayout(
                              '', controller, context, width, height),
                          Container(
                            margin: const EdgeInsets.only(bottom: 20, top: 20),
                            child: InPutTextForm(
                                height: 55,
                                icon: Icons.location_on,
                                hintColor: AppColors.hintColor,
                                hintText: 'address'.tr,
                                color: AppColors.mainColor,
                                textEditingController:
                                    controller.addressController),
                          ),
                          SizedBox(
                            width: width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 20),
                                  child: InPutTextForm(
                                      padding: const EdgeInsets.all(0),
                                      height: 55,
                                      width: width * 0.46,
                                      isNumber: true,
                                      icon: Icons.bedroom_child_sharp,
                                      hintColor: AppColors.hintColor,
                                      hintText: 'The number of rooms'.tr,
                                      color: AppColors.mainColor,
                                      textEditingController:
                                          controller.roomCountController),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 20),
                                  child: InPutTextForm(

                                      padding:
                                          const EdgeInsets.only(left: 0, right: 0),
                                      height: 55,
                                      isNumber: true,
                                      width: width * 0.44,
                                      icon: Icons.school,
                                      hintColor: AppColors.hintColor,
                                      hintText: 'عدد الاقصى للنزلاء'.tr,
                                      color: AppColors.mainColor,
                                      textEditingController:
                                          controller.studentCountController),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: InPutTextForm(
                                isNumber: true,
                                height: 55,
                                icon: Icons.money,
                                hintColor: AppColors.hintColor,
                                hintText: 'rant'.tr,
                                color: AppColors.mainColor,
                                textEditingController:
                                    controller.rantController),
                          ),
                          InPutTextForm(
                              icon: Icons.description,
                              height: 120,
                              hintColor: AppColors.hintColor,
                              hintText: 'description'.tr,
                              maxLine: 4,
                              color: AppColors.mainColor,
                              textEditingController:
                                  controller.descriptionController),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      )))),
            )
          : Scaffold(
              appBar: appBar(Icons.add_home, 'add home'.tr, () {},
                  'add home'.tr, Icons.adb, () {}),
              body: const Center(
                  child: CircularProgressIndicator(
                color: AppColors.mainColor,
              )));
    });
  }
}
