import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homii_v2/component/icon_than_text/icon_than_text.dart';
import 'package:homii_v2/logic/Controllers/student/student_register_controller.dart';
import '../../../../component/appbar/appbar.dart';
import '../../../../component/image/image_in_container.dart';
import '../../../../utils/colors.dart';

class ProfileDonorViewM extends StatelessWidget {
  const ProfileDonorViewM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GetBuilder<StudentRegisterController>(builder: (controller) {
      return !controller.isLoad
          ? SafeArea(
              child: Scaffold(
                  appBar: appBar(Icons.edit, 'Edit Profile'.tr, () {},
                      'Profile'.tr, Icons.adb, () {}),
                  body: SingleChildScrollView(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      ImageInContainer(
                          width: width,
                          height: height * 0.33,
                          image: 'images/me.jpg'),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20, top: 20),
                        child: IconThanText(
                            sizedWidth: 4,
                            icon: Icons.location_on,
                            text: 'syria damascus muzzy ',
                            color: AppColors.white),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: IconThanText(
                            sizedWidth: 4,
                            icon: Icons.email,
                            text: 'khaled963sawan@gmail.com',
                            color: AppColors.white),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: IconThanText(
                            sizedWidth: 4,
                            icon: Icons.phone,
                            text: '0967184204',
                            color: AppColors.white),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ))),
            )
          : Scaffold(
              appBar: appBar(Icons.edit, 'Edit Profile'.tr, () {},
                  'Profile'.tr, Icons.adb, () {}),
              body: const Center(
                  child: CircularProgressIndicator(
                color: AppColors.mainColor,
              )));
    });
  }
}
