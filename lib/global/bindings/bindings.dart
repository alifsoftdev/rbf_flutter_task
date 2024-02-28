import 'package:get/get.dart';
import 'package:rbf_flutter_task/controller/notification_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
     Get.lazyPut(() => NotificationController());
  }
}
