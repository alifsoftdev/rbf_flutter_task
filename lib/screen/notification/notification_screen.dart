import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rbf_flutter_task/controller/notification_controller.dart';
import 'package:rbf_flutter_task/global/constants/color_resources.dart';
import 'package:rbf_flutter_task/global/constants/responsive_values.dart';
import 'package:rbf_flutter_task/global/widgets/submit_button.dart';

class NotificationScreen extends StatefulWidget {
  static const String id = "NotificationScreen";
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final NotificationController controller = Get.find<NotificationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back, icon: Icon(Icons.arrow_back_ios_new)),
        title: Text("Notification"),
        actions: [
          Obx(
            () => (controller.nEdite.isFalse)
                ? TextButton(
                    onPressed: () {
                      controller.noticeEdite(true);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.purple),
                    ))
                : IconButton(
                    onPressed: () {
                      controller.noticeEdite(false);
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Colors.purple,
                    )),
          )
        ],
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo is ScrollEndNotification &&
              scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            // Load more notifications when scrolled to the end
            controller.loadMoreNotifications();
          }
          return false;
        },
        child: Obx(
          () => ListView.builder(
            itemCount: controller.notifications.length,
            itemBuilder: (context, index) {
              var notification = controller.notifications[index];
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
                    child: Row(
                      children: [
                        Checkbox(
                          value: controller.checkboxStates[index],
                          onChanged: (value) {
                            controller.toggleCheckbox(index);
                          },
                          activeColor: ColorResources.colorPerpel,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 4.5.r,
                                        backgroundColor:
                                            ColorResources.colorRed,
                                      ),
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
                                  Text(
                                    /*notifications.createdAt.timeZoneName??*/ "",
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
      bottomSheet: Obx(
        () => Padding(
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
                onPressed: () {},
                buttonStyle: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 15.w, vertical: 11.h),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    (controller.selectedIndices.isNotEmpty)
                        ? Colors.red.shade100
                        : ColorResources.colorGreyWhite,
                  ),
                ),
              ),
              addW(5.w),
              SubmitButton(
                title: "Mark as read",
                onPressed: () {},
                buttonStyle: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 15.w, vertical: 11.h),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    (controller.selectedIndices.isNotEmpty)
                        ? Colors.red.shade100
                        : ColorResources.colorGreyWhite,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
