import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homii_v2/utils/colors.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../routes/routes.dart';
import '../../../utils/AppConstants.dart';

class IntroScreenViewM extends StatelessWidget {
  const IntroScreenViewM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageDecoration pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28.0, fontWeight: FontWeight.w700, color: AppColors.white),
      bodyTextStyle: TextStyle(fontSize: 19.0, color: AppColors.white),
      imagePadding: EdgeInsets.all(20),
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 1],
          colors: [
            AppColors.white,
            AppColors.mainColor,
          ],
        ),
      ),
    );
    return IntroductionScreen(
      globalBackgroundColor: AppColors.mainColor,
      pages: [
        PageViewModel(
          title: "Student".tr,
          body: "Find the right home at a price that matches your income.".tr,
          image: introImage('images/student_intro.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Fractional shares".tr,
          body: "The ability to add homes for rent and manage them easily.".tr,
          image: introImage('images/office_intro.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Donors".tr,
          body: "From the heart, Thank you.".tr,
          image: introImage('images/donor_intro.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => goHomepage(),
      onSkip: () => goHomepage(),
      showSkipButton: true,
      dotsFlex: 0,
      nextFlex: 0,
      skip: Text(
        'Skip'.tr,
        style: const TextStyle(color: AppColors.white),
      ),
      next: const Icon(
        Icons.arrow_forward,
        color: AppColors.white,
      ),
      done: Text(
        'Getting Started'.tr,
        style:const TextStyle(fontWeight: FontWeight.w600, color: AppColors.white),
      ),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0), //size of dots
        color: AppColors.white, //color of dots
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }

  goHomepage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.INTRO, AppConstants.INTRO);
    Get.offAllNamed(AppRoutes.login);
  }

  Widget introImage(String assetName) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(assetName),
                  opacity: 0.55,
                  fit: BoxFit.fill)),
        ));
  }
}
