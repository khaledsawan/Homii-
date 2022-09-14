import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homii_v2/component/animation/list_view_animation.dart';
import '../../../../component/appbar/appbar.dart';
import '../../../../component/dialog/default_dialog.dart';
import '../../../../utils/colors.dart';

class DonationHistoryViewM extends StatelessWidget {
  const DonationHistoryViewM({Key? key}) : super(key: key);
  dialogDesign() {
    return defaultDialog(
        'Note!'.tr,
        AppColors.blue,
        'if you have any problem just contact with us'.tr,
        Container());
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: appBar(Icons.question_mark, 'Note!'.tr, () =>dialogDesign() ,
                'Donation Register'.tr, Icons.adb, () {}),
            body: Container(
              margin: const EdgeInsets.only(top: 20),
              child: ListViewAnimation(design: 'historyLayout'),
            )));
  }
}
