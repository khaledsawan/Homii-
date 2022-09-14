import 'package:flutter/material.dart';
import 'package:get/get.dart';

void ShowCustomSnackpar(String massage, String title,
    {Color backGruondColor = Colors.red, Color textColor = Colors.white}) {
  Get.snackbar(title, massage,
      backgroundColor: backGruondColor, colorText: textColor);
}
