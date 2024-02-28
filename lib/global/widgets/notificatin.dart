import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rbf_flutter_task/global/constants/color_resources.dart';

class CustomNotification extends StatelessWidget {
  final int count;
  const CustomNotification({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorResources.colorRed,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 4.w),
            child: Text(count.toString(),style: TextStyle(
                fontSize: 10.sp,
                color: Colors.white
            ),),
          )),);
  }
}
