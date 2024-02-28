import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rbf_flutter_task/global/bindings/bindings.dart';
import 'package:rbf_flutter_task/screen/home_screen.dart';
import 'package:rbf_flutter_task/screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controller/localization_controller.dart';
import 'controller/login_controller.dart';
import 'controller/theme_controller.dart';
import 'global/constants/app_constants.dart';
import 'global/routes/routes.dart';
import 'theme/dark_theme.dart';
import 'theme/light_theme.dart';
import 'getit_locate.dart' as getit_locator;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await getit_locator.init(prefs);

  //Map<String, Map<String, String>> languages = await languageinit();
  Get.put(ThemeController(prefs: prefs));
  Get.put(LoginController());
  //Get.put(NotificationController(pref: prefs));
  //await Get.find<AuthController>().fetchGoogleUser();
  //await Get.find<NotificationController>().initializeNotifications();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //final Map<String, Map<String, String>> languages;
  const MyApp({
    Key? key,
    //required this.languages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // designSize: const Size(360, 690),
      // minTextAdapt: true,
      // splitScreenMode: true,
      builder: (context, child) {
        return GetBuilder<ThemeController>(
          builder: (themeController) {
            return GetBuilder<LocalizationController>(
                builder: (localizeController) {
             // return GetBuilder<AuthController>(
               // builder: (authController) {
                  return GetMaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Golf Score',
                    themeMode: ThemeMode.system,
                    theme: themeController.themeValue ? dark : light,
                    locale: localizeController.locale,
                    //translations: Translate(languages: languages),
                    initialBinding: InitialBinding(),
                    fallbackLocale: Locale(
                        AppConstants.languages[0].languageCode!,
                        AppConstants.languages[0].countryCode),
                    routes: routes,
                    initialRoute:LoginPage.id,
                    home: child,
                  );
                //},
              //);
            });
          },
        );
      },

      //child: const DashboardScreen(),
      child: const HomeScreen(),
    );
  }
}


