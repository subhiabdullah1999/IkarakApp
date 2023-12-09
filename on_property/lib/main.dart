import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:on_property/core/localization/localizationController.dart';
import 'package:on_property/core/localization/translation.dart';
import 'package:on_property/core/services/services.dart';
import 'package:on_property/routes.dart';
// import 'package:onproperty/routes.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Sizer(builder: (context, orientation, deviceType) {
      LocalizationController controller = Get.put(LocalizationController());

      return GetMaterialApp(
        translations: MyTranslation(),
        locale: controller.language,
        debugShowCheckedModeBanner: false,
        title: 'onProperty',
        theme: controller.appTheme,
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: '/',
      );
    });
  }
}
