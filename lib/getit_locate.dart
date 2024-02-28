
import 'package:get/get.dart';
import 'package:rbf_flutter_task/controller/notification_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controller/language_controller.dart';
import 'controller/localization_controller.dart';
import 'controller/storage_controller.dart';
import 'controller/theme_controller.dart';
import 'http_cleint/api_clients.dart';

Future init(SharedPreferences prefs) async {
  //final adInit = await MobileAds.instance.initialize(); 
  //await HiveConfig.initialize();
  //await languageinit();
  ApiClients.updateHeader(prefs: prefs);
  //Map<String, Map<String, String>> languages = await languageinit();
  //
  // Controllers
  Get.put(ThemeController(prefs: prefs));
 // Get.put(AuthController());
  Get.put(StorageController(prefs: prefs));
  Get.put(NotificationController());
  Get.lazyPut(() => ThemeController());
  Get.lazyPut(() => LocalizationController(prefs: prefs));
  Get.lazyPut(() => LanguageController(prefs: prefs));
}
