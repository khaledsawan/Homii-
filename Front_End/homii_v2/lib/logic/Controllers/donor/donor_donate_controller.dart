import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homii_v2/model/payment_model.dart';
import '../../../utils/colors.dart';

class DonorDonateController extends GetxController {
  final insertProductForKey = GlobalKey<FormState>();

  bool isLoad = false;
  late TextEditingController donateController;

  Payment _paymentMethod =
      Payment(name: 'MTN', image: 'images/MTN-logo.jpg', colors: AppColors.mtn);
  get paymentMethod => _paymentMethod;


  @override
  void dispose() async {
    donateController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    donateController = TextEditingController();
    super.onInit();
  }

  setMethod(Payment payment) {
    _paymentMethod = payment;
    update();
  }

  String? validateString(String value) {
    if (value.isNum) {
      return "not number";
    } else {
      return null;
    }
  }
}
