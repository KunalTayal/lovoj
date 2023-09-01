import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lovoj/app/services/api_repositary.dart';

class OtpController extends GetxController {
  TextEditingController otpController = TextEditingController();
  RxBool time = true.obs;
  late Timer timer;
  RxInt start = 59.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  void startTimer() {
    time.value = false;
    timer = Timer.periodic(
      1.seconds,
      (Timer timer) {
        if (start.value == 1) {
          time.value = true;
          start.value = 60;
          timer.cancel();
        } else {
          start--;
        }
      },
    );
  }

  verifyOTPCreateStore() async {
    isLoading.toggle();
    await ApiRepositary().createStore(
      Get.arguments['name'],
      otpController.text,
      Get.arguments['email'],
      "Fabric",
      Get.arguments['phone'],
      Get.arguments['password'],
    );
    isLoading.toggle();
  }
}
