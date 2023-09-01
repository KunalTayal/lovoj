import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/api_repositary.dart';

class SignUpController extends GetxController {
  RxBool check = false.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  Rx<DateTime> preBackpress =
      DateTime.now().subtract(const Duration(seconds: 2)).obs;
  RxBool passHidden = true.obs;

  generateOTP() async {
    await ApiRepositary().sendOTP(
      nameController.text,
      emailController.text,
      phoneController.text,
      passController.text,
    );
  }
}
