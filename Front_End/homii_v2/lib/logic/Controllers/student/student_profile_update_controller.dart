import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../../model/gender.dart';

class StudentProfileUpdateController extends GetxController {
  final insertProductForKey = GlobalKey<FormState>();
  late TextEditingController
      unvercityController,
      descriptionController,
      addressController;
  bool isLoad = false;
  late String imageName = '';
  late String imageUrl = '1';
  late File file;
  late PickedFile? image;
  late Uint8List? uint8list;

  List<Gender> genders = <Gender>[];

  genderGenerator(int index){
    genders.forEach((gender) => gender.isSelected = false);
    genders[index].isSelected = true;
    update();
  }

  @override
  void dispose() async {
    imageName = '';
    imageUrl = '1';

    unvercityController.dispose();
    addressController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    genders.add( Gender("Male", Icons.man, false));
    genders.add( Gender("Female", Icons.woman, false));
    unvercityController = TextEditingController();
    descriptionController = TextEditingController();
    addressController = TextEditingController();
    super.onInit();
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
