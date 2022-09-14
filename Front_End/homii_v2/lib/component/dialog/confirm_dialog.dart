import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:homii_v2/component/container/custom_container.dart';
import 'package:homii_v2/component/text/big_text.dart';
import '../../utils/colors.dart';

Future<dynamic> confirmDialog(
    String title, Color backGroundColor, Widget widget,Function confirm,Function cancel) {
  return Get.defaultDialog(
      title: title,
      backgroundColor: backGroundColor,
      titleStyle: const TextStyle(color: AppColors.textColor, fontSize: 24),
      barrierDismissible: true,
      radius: 15,
      onCancel: () {cancel();},
      onConfirm: () {confirm();},
      cancel: CustomContainer(
        radius: 8,
        border: 2,
        borderColor: AppColors.innerShadow,
        backgroundColor: AppColors.dialogBackground,
        widget: Center(
            child: BigText(textBody: 'Cancel', color: AppColors.textColor)),
      ),
      confirm: CustomContainer(
        radius: 8,
        border: 2,
        borderColor: AppColors.innerShadow,
        backgroundColor: AppColors.dialogBackground,
        widget: Center(
            child: BigText(
          textBody: 'Confirm',
          color: AppColors.textColor,
        )),
      ),
      content: widget
  );
}
