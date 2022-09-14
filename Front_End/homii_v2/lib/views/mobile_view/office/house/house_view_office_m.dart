import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homii_v2/component/appbar/appbar.dart';
import 'package:homii_v2/component/dialog/confirm_dialog.dart';
import '../../../../component/icon_than_text/icon_than_text.dart';
import '../../../../component/image/page_view_image.dart';
import '../../../../logic/Controllers/office/house_view_office_controller.dart';
import '../../../../utils/colors.dart';

class HouseViewOfficeM extends StatelessWidget {
  const HouseViewOfficeM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: GetBuilder<HouseViewOfficeController>(builder: (controller) {
      return Scaffold(
        appBar: appBar(
            Icons.adb, 'add house'.tr, () {}, 'house view'.tr, Icons.delete,
            () {
          confirmDialog('are you sure ?'.tr, AppColors.dialogBackground,
              Container(), () {}, () {});
        }),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: width,
                height: height * 0.33,
                margin: const EdgeInsets.fromLTRB(8, 30, 8, 0),
                child: PageView.builder(
                    controller: controller.pageController,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return pageViewImage(index, 'images/me.jpg', controller);
                    }),
              ),
              const Divider(),
              Container(
                margin: const EdgeInsets.all(6),
                child: IconThanText(
                  maxLine: 2,
                  icon: Icons.location_on,
                  color: AppColors.white,
                  text: 'syria damascus muzzy MTN',
                ),
              ),
              Container(
                margin: const EdgeInsets.all(6),
                child: IconThanText(
                  icon: Icons.bedroom_parent_sharp,
                  color: AppColors.white,
                  text: '4 rooms',
                ),
              ),
              Container(
                margin: const EdgeInsets.all(6),
                child: IconThanText(
                  icon: Icons.school,
                  color: AppColors.white,
                  text: '3 student',
                ),
              ),
              Container(
                margin: const EdgeInsets.all(6),
                child: IconThanText(
                  icon: Icons.money,
                  color: AppColors.white,
                  text: '33 \$ after discount',
                ),
              ),
              Container(
                margin: const EdgeInsets.all(6),
                child: IconThanText(
                  maxLine: 10,
                  icon: Icons.description,
                  color: AppColors.white,
                  text:
                      '33 \$ after discount33 \$ after discount33 \$ after discount33 \$ after discount33 \$ after discount33 \$ after discount33 \$ after discount33 \$ after discount33 \$ after discount',
                ),
              ),
            ],
          ),
        ),
      );
    }));
  }
}
