import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homii_v2/component/appbar/appbar.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../component/icon_than_text/icon_than_text.dart';
import '../../../utils/colors.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _makingPhoneCall() async {
      var url = Uri.parse("tel:(+963) 967184204");
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    _sendingMails() async {
      var url = Uri.parse("mailto:khaled963sawan@gmail.com@email.com");
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    _openTelegram() async {
      var url = Uri.parse("https://t.me/KHALEDSAWAN");
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    _openGitHub() async {
      var url = Uri.parse("https://github.com/khaledsawan");
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    _openLinkedIn() async {
      var url = Uri.parse("https://www.linkedin.com/in/khaled-sawan-4a8b37238");
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.white,
          appBar:
              appBar(Icons.adb, 'tooltip'.tr, () {}, 'About us'.tr, Icons.adb, () {}),
          body: Container(
            margin: const EdgeInsets.only(left: 30, right: 30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                        width: width,
                        height: height * 0.45,
                        child: Image.asset('images/about us.png')),
                  ),
                  GestureDetector(
                    onTap: () {
                      _sendingMails();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: IconThanText(
                        width: width,
                        margin:EdgeInsets.all(0),
                        sizedWidth: 4,
                        iconColor: AppColors.mainColor2,
                        icon: Icons.email,
                        text: 'khaled963sawan@gmail.com',
                        color: AppColors.white,
                        textColor: AppColors.blue,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _makingPhoneCall();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: IconThanText(
                        margin:EdgeInsets.all(0),
                        sizedWidth: 4,
                        iconColor: AppColors.mainColor3,
                        icon: Icons.phone_android_outlined,
                        text: '+963 0967184204',
                        color: AppColors.white,
                        textColor: AppColors.blue,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _openTelegram();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: IconThanText(
                        margin:EdgeInsets.all(0),
                        sizedWidth: 4,
                        icon: Icons.telegram_outlined,
                        text: 't.me/KHALEDSAWAN',
                        color: AppColors.white,
                        textColor: AppColors.blue,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _openGitHub();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: IconThanText(
                        margin:EdgeInsets.all(0),
                        sizedWidth: 4,
                        icon: SimpleIcons.github,
                        text: 'github.com/khaledsawan',
                        iconColor: AppColors.gitHub,
                        color: AppColors.white,
                        textColor: AppColors.blue,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _openLinkedIn();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: IconThanText(
                        margin:EdgeInsets.all(0),
                        sizedWidth: 4,
                        icon: SimpleIcons.linkedin,
                        text: 'linkedin.com/in/khaled-sawan',
                        iconColor: AppColors.dropdownColor,
                        color: AppColors.white,
                        textColor: AppColors.blue,
                      ),
                    ),
                  ),
                  const Divider(
                    color: AppColors.textColor,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
