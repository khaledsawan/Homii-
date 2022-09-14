import 'package:get/get_navigation/get_navigation.dart';
import 'package:homii_v2/views/mobile_view/auth/login_view_m.dart';
import 'package:homii_v2/views/mobile_view/donor/main_view/donor_main_view_m.dart';
import 'package:homii_v2/views/mobile_view/office/profile/office_profile_view_m.dart';
import 'package:homii_v2/views/mobile_view/office/profile/office_update_profile_view_m.dart';
import 'package:homii_v2/views/mobile_view/student/main_view/student_main_view_m.dart';
import 'package:homii_v2/views/mobile_view/student/profile/student_update_profile_view_m.dart';
import '../views/mobile_view/auth/register_view_m.dart';
import '../views/mobile_view/contact_us/about_us_page.dart';
import '../views/mobile_view/donor/profile/profile_update_donor_view_m.dart';
import '../views/mobile_view/intro/intro_screen_view_m.dart';
import '../views/mobile_view/splash_screen/splash_screen.dart';

class AppRoutes {
  static const contactus = Routes.contactus;
  static const donormain = Routes.donormain;
  static const profileupdatedonor = Routes.profileupdatedonor;
  static const officemain = Routes.officemain;
  static const officeprofile = Routes.officeprofile;
  static const officeupdateprofile = Routes.officeupdateprofile;
  static const studentupdateprofile = Routes.studentupdateprofile;
  static const studentmain = Routes.studentmain;
  static const login = Routes.login;
  static const register = Routes.register;
  static const splashscreen = Routes.splashscreen;
  static const introscreen = Routes.introscreen;
  static final routes = [
    GetPage(
        name: Routes.contactus,
        page: () => const AboutUsPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.splashscreen,
        page: () => const SplashScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.login,
        page: () => const LoginViewM(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.donormain,
        page: () => const DonorMainViewM(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.officeprofile,
        page: () => const OfficeProfileViewM(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.officeupdateprofile,
        page: () => const OfficeUpdateProfileViewM(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.studentupdateprofile,
        page: () => const StudentUpdateProfileViewM(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.profileupdatedonor,
        page: () => const ProfileUpdateDonorViewM(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.register,
        page: () => const RegisterViewM(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.introscreen,
        page: () => const IntroScreenViewM(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.studentmain,
        page: () => const StudentMainViewM(),
        transition: Transition.fadeIn),
  ];
}

class Routes {
  static const notes = '/';
  static const contactus = '/contactus';
  static const donormain = '/donormainview';
  static const profileupdatedonor = '/profileupdatedonorviewm';
  static const officemain = '/officemain';
  static const officeprofile = '/officeprofile';
  static const officeupdateprofile = '/officeupdateprofile';
  static const studentupdateprofile = '/studentupdateprofile';
  static const studentmain = '/studentmain';
  static const login = '/login';
  static const register = '/register';
  static const splashscreen = '/splashscreen';
  static const introscreen = '/introscreen';
}
