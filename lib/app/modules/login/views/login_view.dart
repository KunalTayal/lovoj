import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lovoj/extenstion.dart';

import '../../../../utils/validator.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final timegap =
            DateTime.now().difference(controller.preBackpress.value);
        final cantExit = timegap >= const Duration(seconds: 2);
        controller.preBackpress.value = DateTime.now();
        if (cantExit) {
          Fluttertoast.showToast(
            msg: "Click again to exit",
            textColor: Colors.white,
            fontSize: 12,
            backgroundColor: const Color(0xFF666666),
          );
          return false; // true will exit the app
        } else {
          return true;
        }
      },
      child: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SafeArea(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 25),
                          SvgPicture.asset('assets/LOVOJ.svg'),
                          const SizedBox(height: 27),
                          Container(
                            width: double.maxFinite,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xffD9D9D9),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 60,
                                  spreadRadius: 0,
                                  offset: const Offset(0, 40),
                                  color: Colors.black.withOpacity(0.1),
                                ),
                              ],
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "Designer",
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w500,
                                    height: 60.0.toFigmaHeight(40),
                                  ),
                                ),
                                Text(
                                  "Welcome Back!",
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    height: 36.0.toFigmaHeight(24),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  height: 47,
                                  child: DropdownButtonFormField(
                                    icon: Padding(
                                      padding: const EdgeInsets.only(right: 6),
                                      child: SvgPicture.asset(
                                        'assets/down_arrow.svg',
                                        fit: BoxFit.none,
                                      ),
                                    ),
                                    items: controller.dropDownItems,
                                    hint: Text(
                                      "Select Role Type",
                                      style: GoogleFonts.roboto(
                                        color: const Color(0xff747474),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        height: 16.41.toFigmaHeight(14),
                                      ),
                                    ),
                                    value: controller.dropdownvalue.value,
                                    onChanged: (value) {},
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 12,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6),
                                        borderSide: BorderSide(
                                          color: Colors.black.withOpacity(0.3),
                                          width: 0.89,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6),
                                        borderSide: const BorderSide(
                                          color: Color(0xffEE03C9),
                                          width: 0.89,
                                        ),
                                      ),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.auto,
                                      alignLabelWithHint: true,
                                    ),
                                  ),
                                ),
                                // SizedBox(
                                //   height: 47,
                                //   child: TextField(
                                //     decoration: InputDecoration(
                                //       contentPadding: const EdgeInsets.symmetric(
                                //         vertical: 15,
                                //         horizontal: 12,
                                //       ),
                                //       border: OutlineInputBorder(
                                //         borderRadius: BorderRadius.circular(6),
                                //         borderSide: BorderSide(
                                //           color: Colors.black.withOpacity(0.3),
                                //           width: 0.89,
                                //         ),
                                //       ),
                                //       focusedBorder: OutlineInputBorder(
                                //         borderRadius: BorderRadius.circular(6),
                                //         borderSide: const BorderSide(
                                //           color: Color(0xffEE03C9),
                                //           width: 0.89,
                                //         ),
                                //       ),
                                //       hintText: "Select Role Type",
                                //       hintStyle: GoogleFonts.roboto(
                                //         color: const Color(0xff747474),
                                //         fontSize: 14,
                                //         fontWeight: FontWeight.w400,
                                //         height: 16.41.toFigmaHeight(14),
                                //       ),
                                //       suffixIcon: SvgPicture.asset(
                                //         'assets/down_arrow.svg',
                                //         fit: BoxFit.none,
                                //       ),
                                //     ),
                                //     showCursor: false,
                                //     readOnly: true,
                                //     onTap: () {
                                //       print("object");
                                //     },
                                //   ),
                                // ),
                                const SizedBox(height: 20),
                                TextFormField(
                                  controller: controller.emailController,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 12,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: BorderSide(
                                        color: Colors.black.withOpacity(0.3),
                                        width: 0.89,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: const BorderSide(
                                        color: Color(0xffEE03C9),
                                        width: 0.89,
                                      ),
                                    ),
                                    hintText: "Enter Your Email",
                                    hintStyle: GoogleFonts.roboto(
                                      color: const Color(0xff747474),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      height: 16.41.toFigmaHeight(14),
                                    ),
                                    suffixIcon: SvgPicture.asset(
                                      'assets/mail.svg',
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                  cursorColor: const Color(0xffEE03C9),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (!validateEmail(value.toString())) {
                                      return "Please enter your email";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                const SizedBox(height: 20),
                                Obx(() {
                                  return TextFormField(
                                    controller: controller.passController,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        vertical: 15,
                                        horizontal: 12,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6),
                                        borderSide: BorderSide(
                                          color: Colors.black.withOpacity(0.3),
                                          width: 0.89,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6),
                                        borderSide: const BorderSide(
                                          color: Color(0xffEE03C9),
                                          width: 0.89,
                                        ),
                                      ),
                                      hintText: "Enter Your Password",
                                      hintStyle: GoogleFonts.roboto(
                                        color: const Color(0xff747474),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        height: 16.41.toFigmaHeight(14),
                                      ),
                                      suffixIcon: InkWell(
                                        onTap: () {
                                          controller.passHidden.toggle();
                                        },
                                        child: SvgPicture.asset(
                                          'assets/visible.svg',
                                          fit: BoxFit.none,
                                        ),
                                      ),
                                    ),
                                    keyboardType: TextInputType.visiblePassword,
                                    cursorColor: const Color(0xffEE03C9),
                                    validator: (value) {
                                      if (value == "" ||
                                          value == null ||
                                          value.length < 6 ||
                                          !value.contains(RegExp(
                                              r'([A-Z]|[a-z])+([0-9])'))) {
                                        return "Password must contain only alphabets and numbers";
                                      } else {
                                        return null;
                                      }
                                    },
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    obscureText: controller.passHidden.value,
                                  );
                                }),
                                const SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    onTap: () {
                                      Get.showSnackbar(
                                        const GetSnackBar(
                                          message:
                                              "Forget Password will coming soon",
                                          duration: Duration(seconds: 2),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Forget Password?",
                                      style: GoogleFonts.roboto(
                                        color: const Color(0xffEE03C9),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        height: 14.06.toFigmaHeight(12),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                InkWell(
                                  onTap: () async {
                                    if (controller.formKey.currentState!
                                        .validate()) {
                                      await controller.loginWithEmail();
                                    }
                                  },
                                  child: Container(
                                    height: 56,
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffF603D0),
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 60,
                                          spreadRadius: 0,
                                          color: const Color(0xffF603D0)
                                              .withOpacity(0.3),
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Sign In",
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          height: 24.0.toFigmaHeight(16),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                InkWell(
                                  onTap: () {
                                    Get.offAllNamed(Routes.signUp);
                                  },
                                  child: Text.rich(
                                    TextSpan(
                                      text: "Have an account? ",
                                      children: [
                                        TextSpan(
                                          text: "Sign Un Now",
                                          style: GoogleFonts.poppins(
                                            color: const Color(0xffEE03C9),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            height: 18.0.toFigmaHeight(12),
                                          ),
                                        ),
                                      ],
                                    ),
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      height: 18.0.toFigmaHeight(12),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 50),
                                InkWell(
                                  onTap: () {},
                                  child: Text.rich(
                                    TextSpan(
                                      text:
                                          "By creating an account or logging in, you agree to LOVOJ’s ",
                                      children: [
                                        TextSpan(
                                          text: "Privacy Policy.",
                                          style: GoogleFonts.poppins(
                                            color: const Color(0xffEE03C9),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            height: 18.0.toFigmaHeight(12),
                                          ),
                                        ),
                                      ],
                                    ),
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      height: 18.0.toFigmaHeight(12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25),
                          Row(
                            children: [
                              SvgPicture.asset('assets/right_arrow.svg'),
                              const SizedBox(width: 7),
                              Text(
                                "Need Help?",
                                style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  height: 21.09.toFigmaHeight(18),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: controller.isLoading.value,
                    child: const Dialog.fullscreen(
                      child: Center(
                        child: CircularProgressIndicator.adaptive(
                          valueColor: AlwaysStoppedAnimation(Color(0xffEE03C9)),
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
