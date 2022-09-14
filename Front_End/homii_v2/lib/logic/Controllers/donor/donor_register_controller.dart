import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../model/gender.dart';

class DonorRegisterController extends GetxController {
  bool isLoad = false;

  final insertProductForKey = GlobalKey<FormState>();

  late TextEditingController
      genderController,
      workDetailsController,
      addressController;

  late String imageName = '';
  late String imageUrl = '1';
  late File file;
  late PickedFile? image;
  late Uint8List? uint8list; //for web

  List<Gender> genders = <Gender>[];


  @override
  void dispose() async {
    imageName = '';
    imageUrl = '1';
    genderController.dispose();
    addressController.dispose();
    workDetailsController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    genders.add( Gender("Male", Icons.man, false));
    genders.add( Gender("Female", Icons.woman, false));
    genderController = TextEditingController();
    workDetailsController = TextEditingController();
    addressController = TextEditingController();
    super.onInit();
  }

  genderGenerator(int index){
    for (var gender in genders) {
      gender.isSelected = false;
    }
    genders[index].isSelected = true;
    update();
  }

  gallery() async {
    final imagePicker = ImagePicker();
    image = await imagePicker.getImage(source: ImageSource.gallery);
    if (image != null) {
      file = File(image!.path);
      imageName = basename(image!.path);
      Get.back();
    } else {
      Get.snackbar('Error', 'no image selected');
    }
    update();
  }

  camera() async {
    final imagePicker = ImagePicker();
    PickedFile? image = await imagePicker.getImage(source: ImageSource.camera);
    if (image != null) {
      file = File(image.path);
      imageName = basename(image.path);
      Get.back();
    } else {
      Get.snackbar('Error', 'no image selected');
    }
    update();
  }

  clearImage() {
    imageName = '';
    imageUrl = '1';
    file.delete();
    update();
  }

  String? validateString(String value) {
    if (value.isEmpty) {
      return "short password";
    } else {
      return null;
    }
  }
}
