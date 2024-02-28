 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/theme_controller.dart';

class ColorResources {
  BuildContext context;
  ColorResources(this.context);
  static ThemeController t = Get.put(ThemeController());

  static Color getRedColor(context) {
    final theme = Theme.of(context).brightness;
    return (theme == Brightness.dark) ? colorRed : colorRed;
  }
  static Color getGreenColor(context) {
    final theme = Theme.of(context).brightness;
    return (theme == Brightness.dark) ? colorGreen : colorGreen;
  }
  static Color getWhiteColor(context) {
    final theme = Theme.of(context).brightness;
    return (theme == Brightness.dark) ? colorWhite : colorWhite; 
  }
  static Color getBlackColor(context) {
    final theme = Theme.of(context).brightness;
    return (theme == Brightness.dark) ? colorBlack : colorBlack;
  }
  static Color getBgColor(context) {
    final theme = Theme.of(context).brightness;
    return (theme == Brightness.dark) ? bg : bg;
  }
    static Color getAuthBgColor(context) {
    final theme = Theme.of(context).brightness;
    return (theme == Brightness.dark) ? authUpBg : authUpBg;
  }
    static Color getGrey(context) {
    final theme = Theme.of(context).brightness;
    return (theme == Brightness.dark) ? colorGrey : colorGrey;
  }
      static Color getCyanLiteColor(context) {
    final theme = Theme.of(context).brightness;
    return (theme == Brightness.dark) ? cyanLiteColor : cyanLiteColor;
  }
      static Color getBlueLiteColor(context) {
    final theme = Theme.of(context).brightness;
    return (theme == Brightness.dark) ? colorLiteBlue : colorLiteBlue;
  }

      static Color getBlueColor(context) {
    final theme = Theme.of(context).brightness;
    return (theme == Brightness.dark) ? colorBlue : colorBlue;
  }

      static Color getBlueDrakColor(context) {
    final theme = Theme.of(context).brightness;
    return (theme == Brightness.dark) ? colorDarkBlue : colorDarkBlue;
  }

  static const Color authUpBg=Color(0xff6585C2);
  static const Color colorPerpel = Color(0xFFDC1CD7);
  static const Color colorGreen = Color(0xFF03B91A);
  static const Color colorRed = Color(0xFFFF0000);
  static const Color colorLiteBlue = Color(0xFF0080FF);
  static const Color colorBlue=Color(0xFF0350C2);
  static const Color colorDarkBlue=Color(0xFF01236D);
  static const Color colorGrey = Color(0xFFA0A4A8);
  static const Color colorBlack = Color(0xFF000000);
  static const Color colorNero = Color(0xFF1F1F1F);
  static const Color colorWhite = Color(0xFFFFFFFF);
  static const Color colorHint = Color(0xFF52575C);
  static const Color bg = Color(0xFF5786ED);
  static const Color colorGreyWhite = Color(0xFFCACCCF);
  static const Color colorGray = Color(0xff6E6E6E);
  static const Color colorOxfordBlue = Color(0xff282F39);
  static const Color colorGainsB = Color(0xffE8E8E8);
  static const Color colorNigherRider = Color(0xff303030);
  static const Color backgroundColor = Color(0xffF4F7FC);
  static const Color colorGreyBunker = Color(0xff25282B);
  static const Color colorGreyChateau = Color(0xffA0A4A8);
  static const Color borderColor = Color(0xFFDCDCDC);
  static const Color disableColor = Color(0xFF979797);
  static const Color lavenderColor= Color(0xFFEAEEFD);
  static const Color cyanLiteColor=Color(0xFFCADBFF);


  static const Map<int, Color> colorMap = {
    50: Color(0x10192D6B),
    100: Color(0x20192D6B),
    200: Color(0x30192D6B),
    300: Color(0x40192D6B),
    400: Color(0x50192D6B),
    500: Color(0x60192D6B),
    600: Color(0x70192D6B),
    700: Color(0x80192D6B),
    800: Color(0x90192D6B),
    900: Color(0xff192D6B),
  };
}
