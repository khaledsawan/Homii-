import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:homii_v2/component/icon_than_text/icon_than_text.dart';
import 'package:sizer/sizer.dart';

import '../../utils/colors.dart';
import '../container/custom_container.dart';
import '../image/image_in_container.dart';
import '../text/big_text.dart';
import '../text/smail_text.dart';
import '../text/text_in_Container.dart';

class ListViewAnimation extends StatelessWidget {
  dynamic controller;
  String? design;
  ListViewAnimation({this.controller, this.design, Key? key}) : super(key: key);
  double width = Get.width;
  double height = Get.height;
  Widget designStudentHouse(int index, dynamic controller) {
    return Container(
      margin: EdgeInsets.only(bottom: Get.width / 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            spreadRadius: 4,
          ),
        ],
      ),
      child: Column(
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 4, top: 4, right: 4),
                child: ImageInContainer(
                  image: 'images/house.jpg',
                  width: width,
                  border: 2,
                  borderColor: AppColors.mainColor,
                  height: height * 0.3,
                ),
              ),
              Column(
                children: [
                  IconThanText(
                      margin: const EdgeInsets.only(right: 2, top: 4, left: 4),
                      icon: Icons.money,
                      width: width*0.45,
                      text: controller.productList[index].price,
                      color: AppColors.white),
                  TextInContainer(
                    border: 1,
                    borderColor: AppColors.mainColor,
                    icon: Icons.location_on,
                    text: controller.productList[0].address,
                  ),
                ],
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 4, top: 3, right: 4, bottom: 4),
            child: TextInContainer(
              border: 1,
              textSize: 18,
              isCenter: true,
              borderColor: AppColors.mainColor,
              textHeight: 1.6,
              icon: Icons.description,
              text: controller.productList[0].description,
              maxLine: 2,
              width: width,
              height: height * 0.068,
            ),
          ),
        ],
      ),
    );
  }

  Widget designHouseOrderViewM() {
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 4, 8, 4),
      child: CustomContainer(
        radius: 10,
        borderColor: AppColors.borderCamera,
        border: 1,
        height: 14.h,
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

  Widget historyLayout() {
    double width = Get.width;
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(4),
      child: CustomContainer(
        backgroundColor: AppColors.white,
        borderColor: AppColors.innerShadow,
        border: 1,
        radius: 15,
        width: width,
        height: 15.5.h,
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                BigText(
                  textBody: '  money amount:'.tr,
                ),
                BigText(
                  textBody: '60\$',
                  size: 22,
                ),
              ],
            ),
            Container(
              height: 1,
              margin: EdgeInsets.only(left: 8, right: width * 0.25),
              color: AppColors.innerShadow,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                BigText(
                  textBody: '  Payment method:'.tr,
                ),
                BigText(
                  textBody: 'MTN',
                  size: 22,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              height: 1,
              color: AppColors.innerShadow,
            ),
            Container(
                alignment: Alignment.bottomRight,
                margin:
                    const EdgeInsets.only(top: 8, bottom: 2, right: 8, left: 8),
                child: SmailText(
                  color: AppColors.black,
                  textBody: '2022/11/1 14:11',
                ))
          ],
        ),
      ),
    );
  }

  // GestureDetector(
  // onLongPress: (){
  // // confirmDialog('اختار العملية',AppColors.dialogBackground, Container());
  // },onTap: (){
  // Get.to(const HouseViewOfficeM());
  // },child: const ListHouseLayout())
  Widget selectedDesign(int index, dynamic controller) {
    return designStudentHouse(index, controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            delay: const Duration(milliseconds: 100),
            child: SlideAnimation(
              duration: const Duration(milliseconds: 2500),
              curve: Curves.fastLinearToSlowEaseIn,
              horizontalOffset: -300,
              verticalOffset: -850,
              child: selectedDesign(index, controller),
            ),
          );
        },
      ),
    );
  }
}
