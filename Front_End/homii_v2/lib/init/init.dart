import 'package:get/get.dart';
import 'package:homii_v2/logic/Controllers/office/add_house_office_controller.dart';
import 'package:homii_v2/logic/Controllers/office/house_index_office_controller.dart';
import 'package:homii_v2/logic/Controllers/setting/setting_controller.dart';
import 'package:homii_v2/logic/Controllers/student/houser_search%20_controller.dart';
import 'package:homii_v2/logic/Controllers/student/student_register_controller.dart';
import 'package:homii_v2/service/repository/student_house_repo.dart';
import '../logic/Controllers/auth/login_controller.dart';
import '../logic/Controllers/auth/register_controller.dart';
import '../logic/Controllers/donor/donor_donate_controller.dart';
import '../logic/Controllers/donor/donor_register_controller.dart';
import '../logic/Controllers/office/house_view_office_controller.dart';
import '../logic/Controllers/office/office_register_controller.dart';
import '../logic/Controllers/student/house_index_controller.dart';
import '../logic/Controllers/student/house_order_controller.dart';
import '../logic/Controllers/student/house_view_student_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../service/api/api_client.dart';
import '../service/repository/auth_repo.dart';
import '../utils/AppConstants.dart';

Future<void> init() async {
  //shared
  final prefs = await SharedPreferences.getInstance();
  Get.lazyPut(() => prefs,fenix: true);
  //Api Client
  Get.lazyPut(() => ApiClient(main_BaseUrl: AppConstants.BASE_URL, sharedPre: Get.find()),fenix: true);
  //Repo
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()),fenix: true);
  Get.lazyPut(() => StudentHouseRepo(apiClient: Get.find()),fenix: true);
  //Random
  Get.lazyPut(() => StudentRegisterController());
  Get.lazyPut(() => DonorRegisterController());
  Get.lazyPut(() => OfficeRegisterController());
  Get.lazyPut(() => HouseSearchController(),fenix: true);
  Get.lazyPut(() => HouseViewStudentController(),fenix: true);
  Get.lazyPut(() => HouseViewOfficeController(),fenix: true);
  Get.lazyPut(() => HouseOrderController(),fenix: true);
  Get.lazyPut(() => AddHouseOfficeController(),fenix: true);
  Get.lazyPut(() => HouseIndexOfficeController(),fenix: true);
  Get.lazyPut(() => DonorDonateController(),fenix: true);
  Get.lazyPut(() => SettingController(prefs: Get.find(),authRepo: Get.find()),fenix: true);
  Get.lazyPut(() => LoginController(prefs: Get.find(),authRepo: Get.find()));
  Get.lazyPut(() => RegisterController());
  Get.lazyPut(() => HouseIndexController(studentHouseRepo: Get.find()));
}
