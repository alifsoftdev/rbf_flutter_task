import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rbf_flutter_task/controller/notification_controller.dart';
import 'package:rbf_flutter_task/global/constants/color_resources.dart';
import 'package:rbf_flutter_task/global/methods/methods.dart';
import 'package:rbf_flutter_task/global/widgets/notificatin.dart';
import 'package:rbf_flutter_task/screen/notification/notification_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String id = "HomeScreen";


  @override
  Widget build(BuildContext context) {
    NotificationController notificationController=Get.find<NotificationController>();

    return Scaffold(
      backgroundColor: ColorResources.colorGreyWhite,
      appBar: AppBar(
        backgroundColor:  ColorResources.colorWhite,
        leading: Icon(Icons.menu,size: 25.r),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
              IconButton(onPressed: (){
                goPage(context, NotificationScreen());
              }, icon: Icon(Icons.notifications_none,size: 25.r,),),
              Positioned(
                  top: 6.h,
                  right: 3.w,
                  child: CustomNotification(count: notificationController.selectedIndex)),
            ],),
          )
        ],
      ),
    );
  }
}
