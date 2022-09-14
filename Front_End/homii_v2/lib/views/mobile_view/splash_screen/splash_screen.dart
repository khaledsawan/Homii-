import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homii_v2/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../logic/Controllers/student/house_index_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/AppConstants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  double _fontSize = 2;
  double _containerSize = 1.5;
  double _textOpacity = 0.0;
  double _containerOpacity = 0.0;
  bool intro = false;
  String role = ' ';
  late AnimationController _controller;
  late Animation<double> animation1;
  void isIntro() async {
    final prefs = await SharedPreferences.getInstance();
    intro = prefs.containsKey(AppConstants.INTRO);
    if (prefs.containsKey(AppConstants.ROLE)) {
      role = prefs.getString(AppConstants.ROLE)!;
    }
    intro
        ? {
            if (prefs.getString(AppConstants.TOKEN)?.length == 1)
              {Get.offAllNamed(AppRoutes.login)}
            else if (role == 'student')
              {
                Get.offAllNamed(AppRoutes.studentmain,

                ),
               await Get.find<HouseIndexController>().getHouseList(),
              }
            else if (role == 'office')
              {Get.offAllNamed(AppRoutes.officemain)}
            else
              {Get.offAllNamed(AppRoutes.donormain)}
          }
        : Get.offNamed(AppRoutes.introscreen);
  }

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation1 = Tween<double>(begin: 40, end: 20).animate(CurvedAnimation(
        parent: _controller, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
          _textOpacity = 1.0;
        });
      });
    _controller.forward();
    Timer(const Duration(seconds: 2), () {
      setState(() {
        _fontSize = 1.06;
      });
    });

    Timer(const Duration(seconds: 2), () {
      setState(() {
        _containerSize = 2;
        _containerOpacity = 1;
      });
    });

    Timer(const Duration(seconds: 4), () {
      isIntro();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Stack(
        children: [
          Column(
            children: [
              AnimatedContainer(
                  duration: const Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: height / _fontSize),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 1000),
                opacity: _textOpacity,
                child: Text(
                  'Welcome'.tr,
                  style: GoogleFonts.oleoScriptSwashCaps(
                    color: AppColors.mainColor,
                    fontWeight: FontWeight.w300,
                    fontSize: animation1.value + 8,
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 2000),
              curve: Curves.fastLinearToSlowEaseIn,
              opacity: _containerOpacity,
              child: AnimatedContainer(
                  duration: const Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: width / _containerSize + 50,
                  width: width / _containerSize + 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset('images/findhouse.png')),
            ),
          ),
        ],
      ),
    );
  }
}

class PageTransition extends PageRouteBuilder {
  final Widget page;

  PageTransition(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 2000),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
              curve: Curves.fastLinearToSlowEaseIn,
              parent: animation,
            );
            return Align(
              alignment: Alignment.bottomCenter,
              child: SizeTransition(
                sizeFactor: animation,
                axisAlignment: 0,
                child: page,
              ),
            );
          },
        );
}
