import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homii_v2/routes/routes.dart';
import 'package:homii_v2/utils/langs/translations.dart';
import 'package:sizer/sizer.dart';
import 'init/init.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          translations: Translation(),
          locale: Get.deviceLocale,
          fallbackLocale: const Locale('en'),
          localizationsDelegates: const [],
          getPages: AppRoutes.routes,
          initialRoute: AppRoutes.splashscreen,
        );
      },
    );
  }
}
