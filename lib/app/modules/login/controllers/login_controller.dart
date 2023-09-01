import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lovoj/app/services/api_repositary.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxString dropdownvalue = "admin".obs;
  RxBool isLoading = false.obs;
  List<DropdownMenuItem<String>> dropDownItems = [
    DropdownMenuItem<String>(
      value: "admin",
      child: Text(
        "Admin",
        style: GoogleFonts.poppins(),
      ),
    ),
  ];
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  loginWithEmail() async {
    isLoading.toggle();
    await ApiRepositary().storeLogin(
        emailController.text, passController.text, dropdownvalue.value, "");
    isLoading.toggle();
  }
}
