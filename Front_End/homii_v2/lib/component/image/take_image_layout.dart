import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../bottom_sheet/show_bottom_sheet_image.dart';
import '../text/smail_text.dart';

Widget takeImageLayout(
    String text, dynamic controller, context, double width, double height) {
  return controller.imageName == ''
      ? GestureDetector(
          onTap: () {
            showBottomSheetImage(context, controller);
          },
          child: Container(
            width: width * 0.80,
            height: height * 0.25,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(width: 3, color: AppColors.mainColor),
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[400]!,
                      blurRadius: 8,
                      spreadRadius: 1,
                      offset: const Offset(0, 4),
                      blurStyle: BlurStyle.normal)
                ]),
            child: Column(
              children: [
                SizedBox(
                    height: height * 0.21,
                    child: const Icon(
                      Icons.add_a_photo,
                      size: 100,
                      color: AppColors.innerShadow,
                    )),
                SmailText(
                  color: AppColors.hintColor,
                  textBody: text,
                  size: 16,
                )
              ],
            ),
          ),
        )
      : Stack(
          children: [
            Container(
              width: width * 0.95,
              height: height * 0.33,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[400]!,
                      blurRadius: 8,
                      spreadRadius: 1,
                      offset: const Offset(0, 4),
                      blurStyle: BlurStyle.normal)
                ],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3, color: AppColors.mainColor),
                image: DecorationImage(
                    image: FileImage(controller.file), fit: BoxFit.fill),
              ),
            ),
            Positioned(
                left: width * 0.95 - 50,
                top: 20,
                child: GestureDetector(
                  onTap: () {
                    controller.clearImage();
                  },
                  child: Column(
                    children: [
                      const Icon(
                        Icons.close,
                        size: 35,
                        color: AppColors.white70,
                      ),
                      Text(
                        'أزالة'.tr,
                        style: const TextStyle(
                            color: AppColors.white70, fontSize: 16),
                      )
                    ],
                  ),
                ))
          ],
        );
}
