import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  RxBool check = false.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  RxBool passHidden = true.obs;
}
