import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homii_v2/component/App_Icons/app_icons.dart';
import 'package:homii_v2/component/text/big_text.dart';
import 'package:homii_v2/utils/colors.dart';
import 'package:homii_v2/views/mobile_view/donor/main_view/donor_main_view_m.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../../views/mobile_view/office/main_view/office_main_view_m.dart';
import '../../views/mobile_view/student/main_view/student_main_view_m.dart';

showBottomSheetMiddleWare(context, SharedPreferences prefs) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;

  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.fromLTRB(2.w, 1.h, 1.w, 1.h),
          height: height * 0.05.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(
                textBody: "Please Choose User".tr,
                size: 23,
                fontWeight: FontWeight.w500,
              ),
              Container(
                margin: const EdgeInsets.only(left: 4, right: 4),
                height: 1,
                width: width,
                color: AppColors.hintColor,
              ),
              InkWell(
                onTap: () async {
                  await prefs.setString('user', 'Student');
                   Get.to(const StudentMainViewM());
                },
                child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(1.w, 1.h, 1.w, 1.h),
                    child: Row(
                      children: [
                        const AppIcons(
                          icon: Icons.school,
                          iconSize: 35,
                          iconColor: AppColors.mainColor,
                        ),
                        SizedBox(width: 5.w),
                        BigText(textBody: "Student".tr),
                      ],
                    )),
              ),
              InkWell(
                onTap: () async {
                  await prefs.setString('user', 'Office');

                  Get.to(const OfficeMainViewM());
                },
                child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(1.w, 1.h, 1.w, 1.h),
                    child: Row(
                      children: [
                        const AppIcons(
                          icon: Icons.desk,
                          iconSize: 35,
                          iconColor: AppColors.mainColor2,
                        ),
                        SizedBox(width: 5.w),
                        BigText(textBody: "Office".tr),
                      ],
                    )),
              ),
              InkWell(
                onTap: () async {
                  await prefs.setString('user', 'Donor');

                  Get.to(const DonorMainViewM());
                },
                child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(1.w, 1.h, 1.w, 1.h),
                    child: Row(
                      children: [
                        const AppIcons(
                          icon: Icons.handshake_outlined,
                          iconSize: 35,
                          iconColor: AppColors.mainColor3,
                        ),
                        SizedBox(width: 5.w),
                        BigText(textBody: "Donor".tr),
                      ],
                    )),
              ),
            ],
          ),
        );
      });
}
