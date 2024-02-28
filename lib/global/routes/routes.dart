import 'package:flutter/material.dart';
import 'package:rbf_flutter_task/screen/home_screen.dart';
import 'package:rbf_flutter_task/screen/login.dart';
import 'package:rbf_flutter_task/screen/notification/notification_screen.dart';



var routes = <String, WidgetBuilder>{
  HomeScreen.id: (_) => const HomeScreen(),
  NotificationScreen.id: (_) => const NotificationScreen(),
  LoginPage.id: (_) =>  LoginPage(),
};
