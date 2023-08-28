import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background.svg"), fit: BoxFit.cover),
        ),
        child: const Text(
          'Image in fullscreen',
          style: TextStyle(fontSize: 34, color: Colors.red),
        ),
      ),
    );
  }
}
