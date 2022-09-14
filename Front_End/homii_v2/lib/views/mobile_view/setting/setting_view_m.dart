import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homii_v2/component/appbar/appbar.dart';
import 'package:homii_v2/component/container/custom_container.dart';
import 'package:homii_v2/component/image/back_ground_image.dart';
import 'package:homii_v2/logic/Controllers/setting/setting_controller.dart';
import 'package:homii_v2/routes/routes.dart';
import '../../../component/App_Icons/app_icons.dart';
import '../../../component/dialog/choose_language.dart';
import '../../../component/flutter_switch/night_mode_switch.dart';
import '../../../component/text/big_text.dart';
import '../../../init/init.dart';
import '../../../utils/colors.dart';
import '../contact_us/about_us_page.dart';

class SettingViewM extends StatelessWidget {
  const SettingViewM({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            appBar: appBar(
                Icons.adb, 'tooltip', () {}, 'Setting'.tr, Icons.adb, () {}),
            body: GetBuilder<SettingController>(builder: (controller) {
              return BackGroundImage(
                image: 'images/setting.png',
                widget: Container(
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: width,
                        margin:
                            const EdgeInsets.only(left: 25, right: 25, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const AppIcons(
                              iconColor: AppColors.white,
                              icon: Icons.mode_night,
                              containerSize: 34,
                              backgruondcolor: AppColors.mainColor,
                              iconSize: 22,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            BigText(
                              color: AppColors.text2Color,
                              fontWeight: FontWeight.w500,
                              textBody: 'Night mode'.tr,
                              size: 22,
                            ),
                            nightModeSwitch(controller),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        indent: 15,
                        endIndent: 15,
                        color: AppColors.black,
                      ),
                      Container(
                        width: width,
                        margin:
                            const EdgeInsets.only(left: 25, right: 25, top: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const AppIcons(
                              iconColor: AppColors.white,
                              icon: Icons.language,
                              containerSize: 35,
                              backgruondcolor: AppColors.mainColor,
                              iconSize: 26,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            BigText(
                              color: AppColors.text2Color,
                              fontWeight: FontWeight.w500,
                              textBody: 'Language'.tr,
                              size: 22,
                            ),
                            GestureDetector(
                              onTap: () {
                                changeLanguageAlertDialog(width, context);
                                // Get.to();
                              },
                              child: CustomContainer(
                                width: 75,
                                height: 35,
                                backgroundColor: AppColors.white,
                                border: 2,
                                borderColor: AppColors.mainColor,
                                radius: 12,
                                alignment: Alignment.center,
                                widget:
                                    BigText(textBody: Get.locale.toString()),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        indent: 15,
                        endIndent: 15,
                        color: AppColors.dropBackGround,
                      ),
                      Container(
                        width: width,
                        margin:
                            const EdgeInsets.only(left: 25, right: 25, top: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const AppIcons(
                              iconColor: AppColors.white,
                              icon: Icons.group,
                              containerSize: 35,
                              backgruondcolor: AppColors.mainColor,
                              iconSize: 26,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            BigText(
                              color: AppColors.text2Color,
                              fontWeight: FontWeight.w500,
                              textBody: 'About us'.tr,
                              size: 22,
                            ),
                            GestureDetector(
                                onTap: () {
                                  //gentoo
                                  Get.to(const AboutUsPage());
                                },
                                child: const Icon(Icons.arrow_forward_ios)),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        indent: 15,
                        endIndent: 15,
                        color: AppColors.dropBackGround,
                      ),
                      GestureDetector(
                        onTap: () => controller.nextView(),
                        child: Container(
                          width: width,
                          margin: const EdgeInsets.only(
                              left: 25, right: 25, top: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const AppIcons(
                                iconColor: AppColors.white,
                                icon: Icons.person,
                                containerSize: 35,
                                backgruondcolor: AppColors.mainColor,
                                iconSize: 26,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              BigText(
                                color: AppColors.text2Color,
                                fontWeight: FontWeight.w500,
                                textBody: 'Edit Profile'.tr,
                                size: 22,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    //gentoo
                                    // Get.to();
                                  },
                                  child: const Icon(Icons.arrow_forward_ios)),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        indent: 15,
                        endIndent: 15,
                        color: AppColors.dropBackGround,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await controller.authRepo.clearUserAuth();

                          Get.offAllNamed(AppRoutes.login);
                          await init();
                        },
                        child: CustomContainer(
                          alignment: Alignment.center,
                          width: width * 0.45,
                          height: 50,
                          radius: 16,
                          border: 2,
                          backgroundColor: AppColors.mainColorOpa,
                          borderColor: AppColors.red,
                          widget: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const AppIcons(
                                icon: Icons.logout,
                                iconSize: 30,
                                iconColor: AppColors.red,
                                backgruondcolor: AppColors.mainColorOpa,
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              BigText(
                                textBody: 'Logout'.tr,
                                color: AppColors.red,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
                ),
              );
            })));
  }
}
