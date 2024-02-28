// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  bool _rememberme = false;
  bool get isRemember => _rememberme;

  updateRemember(bool value) {
    _rememberme = value;
    print("value === $_rememberme");
    update();
  }

  Future login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    print("========== remember value ");
    //print(rememberme);
    print("==========");

    SharedPreferences _prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> params = {};
    params['email'] = email;
    params['password'] = password;

    print("getting params ===>> ");
    print(params);
    print("======================");
    //Get.to(() => const DemoScreen());

  }

  /* void toggale() {
    rememberme = !rememberme;
    print("checkbox value now ===>>> $rememberme");
  } */
}
