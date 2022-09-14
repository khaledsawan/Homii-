import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../../utils/colors.dart';

Widget nightModeSwitch(dynamic controller){
  return
    FlutterSwitch(
      width: 55.0,
      height: 30.0,
      toggleSize: 20.0,
      value: controller.nightMode,
      borderRadius: 15.0,
      padding: 1.0,
      activeToggleColor: AppColors.nightMode1,
      inactiveToggleColor: AppColors.iconColor2,
      activeSwitchBorder: Border.all(
        color: AppColors.nightMode1,
        width: 3.0,
      ),
      inactiveSwitchBorder: Border.all(
        color: AppColors.mainColor,
        width: 3.0,
      ),
      activeColor: AppColors.purple,
      inactiveColor: AppColors.mainColor,
      activeIcon: const Icon(Icons.mode_night),
      inactiveIcon: const Icon(Icons.sunny),
      onToggle: (val) {
        controller.changeMode(val);
      },
    );
}