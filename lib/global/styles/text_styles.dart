import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/color_resources.dart';

class TextStyles {
  //:::::::::::::::::::
  static TextStyle customText(
      String fontFamily, double fontSize, FontWeight fontWEight,
      {Color? color}) {
    return TextStyle(
        fontFamily: 'fontFamily',
        fontWeight: fontWEight,
        fontSize: fontSize,
        color: color);
  }

  static TextStyle extraSmallTextStyle() {
    return TextStyle(fontSize: 9.sp, fontWeight: FontWeight.w600);
  }

  static TextStyle extraPreSmallTextStyle() {
    return TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w700);
  }

  static TextStyle preSmallTextStyle() {
    return TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp);
  }

  static TextStyle smallTextStyle(context) {
    return TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
        color: ColorResources.getBlackColor(context));
  }

  static TextStyle smallMediamTextStyle() {
    return TextStyle(
      fontFamily: 'monserrat',
      fontSize: 16.sp,
    );
  }

  static TextStyle mediamLargetTextStyle() {
    return TextStyle(
        fontFamily: 'monserrat', fontSize: 17.sp,
         fontWeight: FontWeight.w600);
  }

  static TextStyle normalTextStyle() {
    return TextStyle(
        fontFamily: 'monserrat', fontSize: 18.sp, 
        );
  }

  static TextStyle largeTextStyle() {
    return TextStyle(
      fontFamily: 'monserrat',
      fontSize: 20.sp,
    );
  }

  static TextStyle extraLargeTextStyle() {
    return TextStyle(
      fontFamily: 'monserrat',
      fontSize: 22.sp,
    );
  }

  static TextStyle extraSmallBoldTextStyle() {
    return TextStyle(
      fontFamily: 'monserrat',
      fontWeight: FontWeight.bold,
      fontSize: 14.sp,
    );
  }

  static TextStyle styleText() {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 15,
    );
  }

  static TextStyle extraBoldStyleText() {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 15,
    );
  }

  static TextStyle smallTextBoldStyle() {
    return TextStyle(
      fontFamily: 'monserrat',
      fontWeight: FontWeight.bold,
      fontSize: 16.sp,
    );
  }

  static TextStyle boldTextBoldStyle() {
    return TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold);
  }

  static TextStyle normalTextBoldStyle() {
    return TextStyle(
      fontFamily: 'monserrat',
      fontWeight: FontWeight.bold,
      fontSize: 18.sp,
    );
  }

  static TextStyle largeTextBoldStyle() {
    return TextStyle(
      fontFamily: 'monserrat',
      fontWeight: FontWeight.bold,
      fontSize: 20.sp,
    );
  }

  static TextStyle extraLargeTextBoldStyle() {
    return TextStyle(
      fontFamily: 'monserrat',
      fontWeight: FontWeight.bold,
      fontSize: 22.sp,
    );
  }

  //:::::::::::::::::::
}
