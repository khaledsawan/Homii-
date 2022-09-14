import 'package:flutter/material.dart';
import 'package:homii_v2/component/image/back_ground_image.dart';
import 'package:homii_v2/component/inputtextform/inputtextform.dart';
import 'package:homii_v2/logic/Controllers/student/houser_search%20_controller.dart';
import 'package:homii_v2/utils/colors.dart';
import 'package:get/get.dart';
import '../../../../component/custom_radio/gender_custom_radio.dart';

class HouseSearchViewM extends StatelessWidget {
  const HouseSearchViewM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: GetBuilder<HouseSearchController>(builder: (controller) {
        return Container(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 8),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InPutTextForm(
                    height: 55,
                    icon: Icons.search_rounded,
                    hintColor: AppColors.hintColor,
                    hintText: 'Enter the search word'.tr,
                    color: AppColors.mainColor,
                    textEditingController: controller.searchWordController),
                Container(
                  margin: const EdgeInsets.only(
                      left: 35, right: 10, bottom: 10, top: 20),
                  width: width,
                  height: 30,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: controller.genders.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                            splashColor: AppColors.mainColor,
                            onTap: () {
                              controller.genderGenerator(index);
                            },
                            child: GenderCustomRadio(
                                width: 110, true, controller.genders[index]));
                      }),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  child: const Divider(
                    thickness: 2,
                    color: AppColors.innerShadow,
                  ),
                ),
               BackGroundImage(  widget: SizedBox(width: width,height: height*0.5,), image: 'images/empyt box.png',)
               
              ],
            ),
          ),
        );
      }),
    ));
  }
}
