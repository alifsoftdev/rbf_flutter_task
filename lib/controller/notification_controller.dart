import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rbf_flutter_task/global/constants/app_constants.dart';
import 'package:rbf_flutter_task/global/methods/methods.dart';
import 'package:rbf_flutter_task/models/notification_model/login_model.dart';
import 'package:rbf_flutter_task/models/notification_model/notification_model.dart';
import 'package:rbf_flutter_task/screen/home_screen.dart';

import '../models/notification_model/notification_model.dart';

 class NotificationController extends GetxController {
   RxBool pNotificationLoading = false.obs;
   RxBool nEdite=false.obs;
   RxString readStatus="".obs;
   RxList<int> selectedIndices = <int>[].obs;
   RxBool isMasterCheckboxSelected = false.obs;

   var selectedIndex = -1.obs;
   /// Notification Edite
   void noticeEdite(bool editeValue){
     nEdite.value=editeValue;
     onInit();
   }

   ///Notification Read
   void readNotification(String readValue){
     readStatus.value=readValue;
     onInit();
   }

/*
   ///Check Box
   void toggleSelectedIndex(int index) {
     if (selectedIndices.contains(index)) {
       selectedIndices.remove(index);
     } else {
       selectedIndices.add(index);
     }

     // Check if all items are selected and update the master checkbox
     isMasterCheckboxSelected.value = selectedIndices.length == notifications.length;
   }

   void toggleAllSelectedIndex() {
     if (isMasterCheckboxSelected.value) {
       selectedIndices.clear();
     } else {
       selectedIndices.addAll(List.generate(notifications.length, (index) => index));
     }
     isMasterCheckboxSelected.toggle();
   }

*/

   /// Authentication
   Rx<TextEditingController> username=TextEditingController().obs;
   Rx<TextEditingController> password=TextEditingController().obs;

   Future<void> loginUser(context) async {
     try {
       Dio dio = Dio();
       var loginResponse = await dio.post(
         "${AppConstants.baseUrl}login",
         data: {
           'username': username.value.text,
           'password': password.value.text,
         },
       );

       if (loginResponse.statusCode == 200) {
         // Parse the response using the LoginModel
         LoginModel loginModel = LoginModel.fromJson(loginResponse.data);
         if (loginModel.status == "success") {
           // Login successful
           Get.snackbar('Success', 'Login successful');
           // You can access user details and token using loginModel.data
           print("User ID: ${loginModel.data.userDetails.id}");
           print("Token: ${loginModel.data.token}");
         } else {
           // Login failed
           Get.snackbar('Error', loginModel.message);
           goPage(context, HomeScreen());
         }
       } else {
         // Handle other status codes
         Get.snackbar('Error', 'Login failed with status code ${loginResponse.statusCode}');
       }
     } catch (error) {
       // Handle network or other errors
       Get.snackbar('Error', 'An error occurred');
     }
   }

   /// Get Notification
   // RxList<NotificationMode> notificationList = <NotificationModel.Result>[].obs;
   RxList<Result> notificationList = <Result>[].obs;
   RxBool isAllSelected = false.obs;

   int currentPage = 1;
   int pageSize = 5; // Change the page size as needed

   @override
   void onInit() {
     super.onInit();
     loadNotifications();
   }

   Future<void> loadNotifications() async {
     try {
       Dio dio = Dio();
       var response = await dio.get(
         "${AppConstants.baseUrl}get_notification?page=$currentPage&pageSize=$pageSize",
       );

       if (response.statusCode == 200) {
         NotificationModel notificationModel= NotificationModel.fromJson(response.data);
         notificationList.assignAll(notificationModel.data.results);
       } else {
         // Handle other status codes
         Get.snackbar('Error', 'Failed to load notifications with status code ${response.statusCode}');
       }
     } catch (error) {
       // Handle network or other errors
       Get.snackbar('Error', 'An error occurred while loading notifications');
     }
   }

   void toggleSelection(Result notification) {
     int index = notificationList.indexOf(notification);
     if (index != -1) {
       notificationList[index].isSelected = !notificationList[index].isSelected!;
     }

     // Check if all items on the page are selected
     isAllSelected.value = notificationList.every((notification) => notification.isSelected == true);
   }

   void toggleAllSelection() {
     isAllSelected.toggle();
     notificationList.forEach((notification) {
       notification.isSelected = isAllSelected.value;
     });
   }

   void markAsRead() {
     // Perform action to mark selected notifications as read
     List<Result> selectedNotifications = notificationList.where((notification) => notification.isSelected == true).toList();
     // Handle the logic to mark as read, you can make an API call here

     // After marking as read, clear the selection
     clearSelection();
   }

   void deleteNotifications() {
     // Perform action to delete selected notifications
     List<Result> selectedNotifications = notificationList.where((notification) => notification.isSelected == true).toList();
     // Handle the logic to delete, you can make an API call here

     // After deleting, clear the selection and reload notifications
     clearSelection();
     loadNotifications();
   }

   void clearSelection() {
     isAllSelected.value = false;
     notificationList.forEach((notification) {
       notification.isSelected = false;
     });
   }

   void loadMore() {
     currentPage++;
     loadNotifications();
   }
 }