
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rbf_flutter_task/controller/notification_controller.dart';
import 'package:rbf_flutter_task/global/constants/color_resources.dart';
import 'package:rbf_flutter_task/global/constants/responsive_values.dart';
import 'package:rbf_flutter_task/global/widgets/submit_button.dart';
import 'package:rbf_flutter_task/models/notification_model/notification_model.dart';

class NotificationScreen extends StatefulWidget {
  static const String id = "NotificationScreen";
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final NotificationController controller = Get.find<NotificationController>();

  @override
  void initState() {
    super.initState();
    //Get.find<NotificationController>().loadNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back, icon: Icon(Icons.arrow_back_ios_new)),
        title: Text("Notification"),
        actions: [
          Obx(() => (controller.nEdite.isFalse)
              ? IconButton(
                  onPressed: () {
                    controller.noticeEdite(true);
                  },
                  icon: Icon(
                    Icons.edit,
                    color: Colors.purple,
                  ))
              : TextButton(
                  onPressed: () {
                    controller.noticeEdite(false);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Colors.purple),
                  )))
        ],
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo is ScrollEndNotification &&
              scrollInfo.metrics.maxScrollExtent == scrollInfo.metrics.maxScrollExtent) {
            // Load more notifications when scrolled to the end
            controller.loadMoreNotifications();
          }
          return false;
        },
        child: Obx(
          ()=> ListView.builder(
            itemCount: controller.notifications.length,
            itemBuilder: (context, index) {
              var notification = controller.notifications[index];
              bool isChecked = controller.checkboxStates[index];
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
                    child: Row(
                      children: [
                        Obx(() => (controller.nEdite.isTrue)
                            ? Checkbox(
                          value: controller.checkboxStates[index],
                          onChanged: (value) {
                            controller.toggleCheckbox(index);
                          },
                          activeColor: ColorResources.colorPerpel,
                        )
                            : SizedBox.shrink()),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      notification.readStatus=="No"?
                                      CircleAvatar(
                                        radius: 4.5.r,
                                        backgroundColor: ColorResources.colorRed,
                                      ):SizedBox.shrink(),
                                      addW(3.w),
                                      Text(
                                        notification.title ?? "",
                                        style: TextStyle(
                                          color: ColorResources.colorRed,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(notification.createdAt ?? "",
                                    style: TextStyle(
                                      color: ColorResources.colorRed,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ],
                              ),
                              addH(5.h),
                              Text(
                                notification.description ?? "",
                                style: TextStyle(
                                  color: ColorResources.colorBlack,
                                  height: 1.2,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider()
                ],
              );
            },
          ),
        ),
      ),
      bottomSheet: Obx(() => (controller.nEdite.isTrue)
          ? Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
              child: Row(
                children: [
                  Checkbox(
                    value: controller.isMasterCheckboxSelected.value,
                    onChanged: (value) {
                      controller.toggleMasterCheckbox();
                    },
                    activeColor: ColorResources.colorPerpel,
                  ),
                  const Text("All"),
                  const Expanded(child: SizedBox()),
                  SubmitButton(
                    title: "Delete",
                    onPressed: () {
                      controller.deleteSelectedNotifications();

                    },
                    buttonStyle: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 11.h),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                          (controller.checkboxStates.isNotEmpty)
                              ? ColorResources.colorGreyWhite
                              : Colors.red.shade100),
                    ),
                  ),
                  addW(5.w),
                  SubmitButton(
                    title: "Mark as read",
                    onPressed: () {controller.markSelectedNotificationsAsRead();},
                    buttonStyle: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 11.h),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                          (controller.checkboxStates.isNotEmpty)
                              ? ColorResources.colorGreyWhite
                              : Colors.red.shade100),
                    ),
                  ),
                ],
              ),
            )
          : const SizedBox.shrink()),
    );
  }
}
