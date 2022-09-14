import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homii_v2/component/container/custom_container.dart';
import 'package:homii_v2/logic/Controllers/student/house_order_controller.dart';
import 'package:sizer/sizer.dart';
import '../../../../component/animation/list_view_animation.dart';
import '../../../../component/appbar/appbar.dart';
import '../../../../component/dialog/default_dialog.dart';
import '../../../../component/image/image_in_container.dart';
import '../../../../component/text/big_text.dart';
import '../../../../component/text/smail_text.dart';
import '../../../../utils/colors.dart';

class HouseOrderViewM extends StatelessWidget {
  const HouseOrderViewM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Widget design() {
      return Container(
        margin: const EdgeInsets.fromLTRB(8, 4, 8, 4),
        child: CustomContainer(

          radius: 10,
          borderColor: AppColors.borderCamera,
          border: 1,
          height:14.h,
          width: width,
          widget: Row(
            children: [

              ImageInContainer(
                image: "images/house.jpg",
                height: 14.h - 8,
                width: width * 0.3,
                border: 2,
                borderColor: AppColors.mainColor,
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: height * 0.05,
                  ),
                  BigText(
                    textBody: 'عدد طلاب المتبقي 2',
                    maxLine: 3,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 4, 0, 8),
                    width: width * 0.62,
                    height: 2,
                    color: AppColors.searchColor,
                  ),
                  Container(
                      width: width * 0.56,
                      height: 10,
                      alignment: Alignment.topLeft,
                      child: SmailText(
                        textBody: '2022/8/1 12:00',
                      ))
                ],
              ),
            ],
          ),
        ),
      );
    }

    return GetBuilder<HouseOrderController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
            appBar: appBar(Icons.question_mark, 'more information'.tr, () {
              defaultDialog('note!!!'.tr, AppColors.dialogBackground,
                  'We will contact you when the number is full'.tr, Container());
            }, 'Home rental requests'.tr, Icons.adb, () {}),
            body: Container(
              margin: const EdgeInsets.only(top: 20),
              width: width,
              height: height - 90,
              child: SingleChildScrollView(
                child: ListViewAnimation(
                  design: 'designHouseOrderViewM()',
                ),
              ),
            )),
      );
    });
  }
}
