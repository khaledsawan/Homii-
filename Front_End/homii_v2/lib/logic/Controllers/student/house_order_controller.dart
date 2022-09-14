import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/gender.dart';
import '../../../service/model/student_house_model.dart';
import '../../../service/repository/student_house_repo.dart';

class HouseOrderController extends GetxController {
  late TextEditingController searchWordController, typeSearchController;
  bool isLoad = false;
  late StudentHouseRepo studentHouseRepo;
  List<Gender> genders = <Gender>[];
  late final List<Data> _productList = [];
  List<Data> get productList => _productList;

  genderGenerator(int index){
    genders.forEach((gender) => gender.isSelected = false);
    genders[index].isSelected = true;
    update();
  }

  @override
  void dispose() async {
    searchWordController.dispose();
    typeSearchController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    genders.add( Gender("price", Icons.monetization_on, false));
    genders.add( Gender("address", Icons.location_on, false));
    genders.add( Gender("rooms", Icons.house, false));
    searchWordController = TextEditingController();
    typeSearchController = TextEditingController();
    super.onInit();
  }

  String? validateString(String value) {
    if (value.isEmpty) {
      return "short String";
    } else {
      return null;
    }
  }
}
