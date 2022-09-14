import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homii_v2/service/repository/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../routes/routes.dart';

class SettingController extends GetxController {
  late AuthRepo authRepo;
  SettingController({required this.prefs, required this.authRepo});

  bool _nightMode = false;
  get nightMode => _nightMode;

  late SharedPreferences prefs;
  void nextView() {
    String? user = prefs.getString('user');
    if (user == 'Donor') {
      Get.toNamed(AppRoutes.profileupdatedonor);
    } else if (user == 'Office') {
      Get.toNamed(AppRoutes.officeupdateprofile);
    } else {
      Get.toNamed(AppRoutes.studentupdateprofile);
    }
  }

  changeMode(bool val) {
    Get.changeTheme(
      Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
    );

    _nightMode = val;
    update();
  }
}
