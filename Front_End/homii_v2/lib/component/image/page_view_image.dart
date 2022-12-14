import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';

pageViewImage(int index, String image, dynamic controller) {
  double scaleFactor = 0.8;
  double height2 = Get.height * 0.47;
  Matrix4 matrix = Matrix4.identity();
  if (index == controller.currPageValue.floor()) {
    num currScale = 1 - (controller.currPageValue - index) * (1 - scaleFactor);
    double currTrans = height2 * (1 - currScale) / 2;
    matrix = Matrix4.diagonal3Values(1.0, currScale.toDouble(), 1.0)
      ..setTranslationRaw(0, currTrans, 0);
  } else if (index == controller.currPageValue.floor() + 1) {
    var currScale = scaleFactor +
        (controller.currPageValue - index + 1) * (1 - scaleFactor);
    var currTrans = height2 * (1 - currScale) / 2;
    matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)
      ..setTranslationRaw(0, currTrans, 0);
  } else if (index == controller.currPageValue.floor() - 1) {
    var currScale = 1 - (controller.currPageValue - index) * (1 - scaleFactor);
    var currTrans = height2 * (1 - currScale) / 2;
    matrix = Matrix4.diagonal3Values(1.0, currScale.toDouble(), 1.0)
      ..setTranslationRaw(0, currTrans, 0);
  } else {
    var currScale = 0.8;
    matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)
      ..setTranslationRaw(0, height2 * (1 - scaleFactor) / 2, 0);
  }

  return Transform(
    transform: matrix,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: Get.height * 0.33,
          width: Get.width,
          margin: const EdgeInsets.only(right: 2, left: 2, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(
                    1.0,
                    1.0,
                  ),
                  blurRadius: 4.0,
                  spreadRadius: 1.0,
                ),
                BoxShadow(
                  color: AppColors.hintColor,
                  offset: Offset(0.0, 12.0),
                  blurRadius: 8.0,
                  spreadRadius: 0.0,
                ),
              ],
              color: index.isEven
                  ? const Color(0xFF69c5df)
                  : const Color(0xFF9294cc),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  image,
                ),
              )),
        ),
      ),
    ),
  );
}
