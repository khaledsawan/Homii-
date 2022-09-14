import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homii_v2/component/animation/list_view_animation.dart';
import 'package:homii_v2/component/appbar/appbar.dart';
import 'package:homii_v2/component/loop/loop_animation.dart';
import 'package:homii_v2/logic/Controllers/student/house_index_controller.dart';


class HouseIndexViewM extends StatelessWidget {
  const HouseIndexViewM({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GetBuilder<HouseIndexController>(builder: (controller) {

      return SafeArea(
        child: Scaffold(
            appBar: appBar(Icons.adb, 'Search'.tr, () {}, 'house list'.tr,
                Icons.adb, () {}),
            body: controller.isLoad
                ? const LoopAnimation()
                : Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: ListViewAnimation(design:'designStudentHouse' ,controller:controller,),
                  )),
      );
    });
  }
}
