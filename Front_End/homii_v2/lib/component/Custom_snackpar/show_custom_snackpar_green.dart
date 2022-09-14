import 'package:flutter/material.dart';
import 'package:get/get.dart';

void ShowCustomSnackparGreen(String massage, String title,
    {Color backGruondColor = Colors.green, Color textColor = Colors.white}) {
  Get.snackbar(title, massage,
      backgroundColor: backGruondColor, colorText: textColor);
}
