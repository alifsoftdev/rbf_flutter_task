import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rbf_flutter_task/controller/notification_controller.dart';
import 'package:rbf_flutter_task/global/constants/responsive_values.dart';

class LoginPage extends StatelessWidget {
  static const String id = "LoginPageScreen";
  final NotificationController loginController = Get.find<NotificationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: loginController.username.value,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            addH(15.h),
            TextField(
              obscureText: true,
              controller: loginController.password.value,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            addH(32.h),
            ElevatedButton(
              onPressed: () => loginController.loginUser(context),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
