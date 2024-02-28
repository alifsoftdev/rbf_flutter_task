import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rbf_flutter_task/controller/notification_controller.dart';
import 'package:rbf_flutter_task/global/constants/color_resources.dart';
import 'package:rbf_flutter_task/global/constants/responsive_values.dart';
import 'package:rbf_flutter_task/global/widgets/submit_button.dart';
import 'package:rbf_flutter_task/models/notification_model/notification_model.dart';
import 'package:rbf_flutter_task/screen/notification/notification_model.dart';

import '../../models/notification_model/result_model.dart';

class NotificationScreen extends StatelessWidget {

  static const String id = "NotificationScreen";
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationController controller= Get.find<NotificationController>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Get.back,icon: Icon(Icons.arrow_back_ios_new)),
        title: Text("Notification"),
        actions: [
          Obx(()=>(controller.nEdite.isFalse)?
          TextButton(onPressed: (){
            controller.noticeEdite(true);
          }, child:  Text("Cancel",style: TextStyle(color: Colors.purple),)):
          IconButton(onPressed: (){
            controller.noticeEdite(false);
          }, icon: Icon(Icons.edit,color: Colors.purple,)),)
        ],
      ),
    body: ListView.builder(
      itemCount: controller.notificationList.length,
      itemBuilder: (context, index) {
        var notifications=controller.notificationList[index];
      return Obx(
          ()=> Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
              child: Row(
                children: [
                  (controller.nEdite.isFalse)?
                  Checkbox(
                    value: /*controller.isSelected ??*/ false,
                    onChanged: (value) {
                    },
                    activeColor: ColorResources.colorPerpel,
                  ):SizedBox.shrink(),
                  Expanded(
                    child: Column(
                      children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            //(notification.readStatus!="Yes")?
                            CircleAvatar(
                              radius: 4.5.r,
                              backgroundColor: ColorResources.colorRed,
                            ),//:SizedBox.shrink(),
                            addW(3.w),
                            Text(notifications.title,style: TextStyle(
                              color: ColorResources.colorRed,
                              fontSize: 15.sp,
                            ),),
                          ],),
                          Text(notifications.createdAt.timeZoneName,style: TextStyle(
                            color: ColorResources.colorRed,
                            fontSize: 13.sp,
                          ),),
                        ],),
                      addH(5.h),
                      Text(notifications.description,style: TextStyle(
                        color: ColorResources.colorBlack,
                        height: 1.2,
                        fontSize: 16.sp,
                      )),

                    ],),
                  ),
                ],
              ),
            ),
            Divider()
          ],
        ),
      );
    },),
      bottomSheet: Obx(
            ()=>(controller.nEdite.isFalse)? Padding(
          padding:  EdgeInsets.fromLTRB(0, 10, 10, 10),
          child: Row(
            children: [
              Checkbox(value: controller.isMasterCheckboxSelected.value,
                onChanged: (value) {
                 // controller.toggleAllSelectedIndex();
                },
                activeColor: ColorResources.colorPerpel,),
              const Text("All"),
              const Expanded(child: SizedBox()),
              SubmitButton(title: "Delete", onPressed: (){}, buttonStyle: ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 15.w,vertical: 11.h)),
                backgroundColor: MaterialStatePropertyAll((controller.selectedIndices.isNotEmpty)? Colors.red.shade100:ColorResources.colorGreyWhite),
              )),
              addW(5.w),
              SubmitButton(title: "Mark as read", onPressed: (){}, buttonStyle: ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 15.w,vertical: 11.h)),
                backgroundColor: MaterialStatePropertyAll((controller.selectedIndices.isNotEmpty)? Colors.red.shade100:ColorResources.colorGreyWhite),

              )),
            ],
          ),
        ):const SizedBox.shrink(),
      ),
    );
  }
}
