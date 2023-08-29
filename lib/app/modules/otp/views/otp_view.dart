import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lovoj/extenstion.dart';
import 'package:pinput/pinput.dart';

import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 35),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: 52,
                width: 52,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xffE8E6EA),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: SvgPicture.asset(
                  'assets/backward_arrow.svg',
                  fit: BoxFit.none,
                ),
              ),
            ),
            const SizedBox(height: 44),
            Center(
              child: SvgPicture.asset('assets/chat.svg'),
            ),
            const SizedBox(height: 9),
            Center(
              child: Text(
                "00:42",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  height: 51.0.toFigmaHeight(34),
                ),
              ),
            ),
            const SizedBox(height: 9),
            Center(
              child: SizedBox(
                width: 200,
                child: Text(
                  '''Type the verification 
code 
we’ve sent you''',
                  style: GoogleFonts.poppins(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    height: 27.0.toFigmaHeight(18),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 21),
            Center(
              child: Pinput(
                crossAxisAlignment: CrossAxisAlignment.center,
                defaultPinTheme: PinTheme(
                  width: 67,
                  height: 70,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 4.5),
                  textStyle: GoogleFonts.poppins(
                    color: const Color(0xffE8E6EA),
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color(0xffE8E6EA)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  width: 67,
                  height: 70,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 4.5),
                  textStyle: GoogleFonts.poppins(
                    color: const Color(0xff200E32).withOpacity(0.4),
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color(0xffF603D0)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                submittedPinTheme: PinTheme(
                  width: 67,
                  height: 70,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 4.5),
                  textStyle: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffF603D0),
                    border: Border.all(color: const Color(0xffF603D0)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 9),
                      width: 22,
                      height: 1,
                      color: const Color(0xffF603D0),
                    ),
                  ],
                ),
                onCompleted: (value) {},
                length: 4,
              ),
            ),
            const SizedBox(height: 100),
            Center(
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 0),
                        blurRadius: 80,
                        spreadRadius: 0,
                        color: const Color(0xffF603D0).withOpacity(0.3),
                      )
                    ],
                  ),
                  child: Text(
                    "Send again",
                    style: GoogleFonts.poppins(
                      color: const Color(0xffF603D0),
                      fontSize: 16,
                      height: 24.0.toFigmaHeight(16),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
