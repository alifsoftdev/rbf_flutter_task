import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide Response;
import 'package:rbf_flutter_task/global/constants/app_constants.dart';
import 'package:rbf_flutter_task/global/methods/methods.dart';
import 'package:rbf_flutter_task/models/notification_model/login_model.dart';
import 'package:rbf_flutter_task/models/notification_model/notification_model.dart';
import 'package:rbf_flutter_task/screen/home_screen.dart';

import '../models/notification_model/result_model.dart';


 class NotificationController extends GetxController {
   RxBool pNotificationLoading = false.obs;
   RxBool nEdite=false.obs;
   RxString readStatus="".obs;
   RxList<int> selectedIndices = <int>[].obs;

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

   LoginModel? loginModel;

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
          loginModel = LoginModel.fromJson(loginResponse.data);
          Get.snackbar('Success', 'Login successful');
          // You can access user details and token using loginModel.data
          print("User ID: ${loginModel?.data.userDetails.id}");
          print("Token: ${loginModel?.data.token}");
          goPage(context, HomeScreen());
       } else {
         // Handle other status codes
         Get.snackbar('Error', 'Login failed with status code ${loginResponse.statusCode}');
       }
     } catch (error) {
       // Handle network or other errors
       Get.snackbar('Error', 'An error occurred');
     }
   }

/*   /// Get Notification
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
   }*/
   //var notifications = [].obs;
   var notifications = <NotificationResult>[].obs;
   var currentPage = 1.obs;
   var loading = false.obs;
   NotificationModel? notificationModel;


   @override
   void onInit() {
     super.onInit();
     loadMoreNotifications();
   }

   Future<void> loadMoreNotifications() async {
     if (loading.value) return;

     loading.value = true;

     update();

     try {
       Dio dio = Dio();
       dio.options.headers['Authorization'] = 'Bearer ${loginModel?.data.token}';
       final response = await dio.get(
         "${AppConstants.baseUrl}get_notification?page=${currentPage.value}&pageSize=2",
       );


       if (response.statusCode == 200) {
          notificationModel = NotificationModel.fromJson(response.data);
         notifications.addAll(notificationModel?.data?.results ?? []);
         // Initialize checkbox states
         checkboxStates.addAll(List.generate(notifications.length, (index) => false));
         isMasterCheckboxSelected.value = false;
         currentPage.value++;
         log("data ${notifications.length}");
       } else {
         print("Failed to load notifications. Status code: ${response.statusCode}");
       }
     } catch (error, stackTrace) {
       log("An error occurred: $error", error: error, stackTrace: stackTrace);
     } finally {
       loading.value = false;
     }
   }

   Future<void> updateNotificationStatus(List<int> notificationIds, String status) async {
     try {
       Dio dio = Dio();
       dio.options.headers['Authorization'] = 'Bearer ${loginModel?.data.token}';
       final response = await dio.post(
         "${AppConstants.baseUrl}update_notification_status",
         data: {
           'notification_ids': notificationIds,
           'status': status,
         },
       );

       if (response.statusCode == 200) {
         // Handle success, maybe update the local data
         log('Notification Read${response.statusCode}');
         print('Notification status updated successfully');
       } else {
         print("Failed to update notification status. Status code: ${response.statusCode}");
       }
     } catch (error) {
       print("An error occurred while updating notification status: $error");
     }
   }
   RxBool isMasterCheckboxSelected = false.obs;
   RxList<bool> checkboxStates = <bool>[].obs;

   void toggleMasterCheckbox() {
     isMasterCheckboxSelected.value = !isMasterCheckboxSelected.value;

     // If master checkbox is unselected, unselect all checkboxes
     if (!isMasterCheckboxSelected.value) {
       checkboxStates.assignAll(List.generate(notifications.length, (index) => false));
     } else {
       // If master checkbox is selected, select all checkboxes
       checkboxStates.assignAll(List.generate(notifications.length, (index) => true));
     }
   }

   void toggleCheckbox(int index) {
     checkboxStates[index] = !checkboxStates[index];

     // If any checkbox is unselected, unselect master checkbox
     isMasterCheckboxSelected.value = checkboxStates.every((state) => state == true);
   }

   void markSelectedNotificationsAsRead() async {
     List<int> selectedNotificationIds = [];
     for (int i = 0; i < notifications.length; i++) {
       if (checkboxStates[i]) {
         selectedNotificationIds.add(notifications[i].id!);
         checkboxStates.remove(selectedIndices);
       }
     }
     if (selectedNotificationIds.isNotEmpty) {
       await updateNotificationStatus(selectedNotificationIds, 'Yes');
       // Handle other logic, clear selection, reload data, etc.
     } else {
       // Handle case where no notifications are selected
       print('No notifications selected');
     }
   }


   void deleteSelectedNotifications() {
     // Get the indices of selected checkboxes
     List<int> selectedIndices = List.generate(checkboxStates.length, (index) => index)
         .where((index) => checkboxStates[index])
         .toList();

     // Perform action to delete selected notifications
     selectedIndices.forEach((index) {
       // Handle the logic to delete, you can make an API call here
       // For demonstration, I'm removing the item from the list
       notifications.removeAt(index);
     });

     // After deleting, clear the selection
     selectedIndices.clear();
   }

 }