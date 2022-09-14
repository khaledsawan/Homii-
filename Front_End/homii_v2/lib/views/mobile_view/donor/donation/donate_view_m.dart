import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homii_v2/component/appbar/appbar.dart';
import 'package:homii_v2/component/dialog/default_dialog.dart';
import 'package:homii_v2/component/image/back_ground_image.dart';
import 'package:homii_v2/component/inputtextform/inputtextform.dart';
import 'package:homii_v2/utils/colors.dart';
import '../../../../component/dropdown/payment_method_drop_down.dart';
import '../../../../logic/Controllers/donor/donor_donate_controller.dart';

class DonateViewM extends StatelessWidget {
  const DonateViewM({Key? key}) : super(key: key);
  dialogDesign() {
    return defaultDialog(
        'Note!'.tr,
        AppColors.blue,
        'We will contact you when a donation request is received, thank you'.tr,
        Container());
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: GetBuilder<DonorDonateController>(builder: (controller) {
      return Scaffold(
        appBar: appBar(Icons.adb, 'Donation Register'.tr, () {}, 'donate money'.tr,
            Icons.question_mark, () {
          dialogDesign();
        }),
        body: BackGroundImage(
          image: 'images/donation page.png',

          widget: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.2,
              ),
              Center(
                child: InPutTextForm(
                    width: width * 0.6,
                    isNumber: true,
                    iconSize: 35,
                    height: 60,
                    icon: Icons.attach_money,
                    hintColor: AppColors.hintColor,
                    hintText: 'Enter the donation amount'.tr,
                    color: AppColors.mainColor3,
                    isCenter: true,
                    textEditingController: controller.donateController),
              ),
              const SizedBox(
                height: 25,
              ),
                 PaymentMethodDropDown(controller: controller),
            ],
          ),
        ),
      );
    }));
  }
}
