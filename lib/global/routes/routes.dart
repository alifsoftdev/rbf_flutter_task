import 'package:flutter/material.dart';
import 'package:rbf_flutter_task/screen/home_screen.dart';
import 'package:rbf_flutter_task/screen/login.dart';
import 'package:rbf_flutter_task/screen/notification/notification_screen.dart';



var routes = <String, WidgetBuilder>{
  HomeScreen.id: (_) =>  HomeScreen(),
  NotificationScreen.id: (_) =>  NotificationScreen(),
  LoginPage.id: (_) =>  LoginPage(),
};
