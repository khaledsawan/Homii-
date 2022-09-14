import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homii_v2/component/animation/list_view_animation.dart';
import 'package:homii_v2/component/appbar/appbar.dart';
import 'package:homii_v2/logic/Controllers/office/house_index_office_controller.dart';

class HouseIndexOfficeViewM extends StatelessWidget {
  const HouseIndexOfficeViewM({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HouseIndexOfficeController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          appBar: appBar(Icons.search, 'Search'.tr, () {}, 'house list'.tr,Icons.adb,(){}),
          body: ListViewAnimation(
              design: ''),
        ),
      );
    });
  }
}
