import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lovoj/app/routes/app_pages.dart';

class ApiRepositary {
  createStore(
    String name,
    String otp,
    String email,
    String storeType,
    String mobileNumber,
    String password,
  ) async {
    try {
      var response = await http.post(
        Uri.parse('https://fabricssoftware.com/api/v1/auth/createStore'),
        body: json.encode({
          'name': name,
          'otp_key': otp,
          'email': email,
          'storeType': storeType,
          'password': password,
          'mobileNumber': mobileNumber,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        print(jsonDecode(response.body));
        Get.showSnackbar(
          GetSnackBar(
            message: jsonDecode(response.body)['message'],
            duration: const Duration(seconds: 2),
          ),
        );
        Get.offAllNamed(Routes.login);
      } else {
        print(jsonDecode(response.body));
        Get.showSnackbar(
          GetSnackBar(
            message: jsonDecode(response.body)['message'],
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  sendOTP(String name, String email, String phone, String password) async {
    try {
      var response = await http.post(
        Uri.parse('https://fabricssoftware.com/api/v1/auth/checkemail'),
        body: json.encode({"email": email}),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        print(jsonDecode(response.body));
        Get.toNamed(Routes.otp, arguments: {
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
        });
        Get.showSnackbar(
          GetSnackBar(
            message: jsonDecode(response.body)['message'],
            duration: const Duration(seconds: 2),
          ),
        );
      } else {
        print(response.statusCode);
        print(response.reasonPhrase);
        Get.showSnackbar(
          GetSnackBar(
            message: jsonDecode(response.body)['message'],
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  storeLogin(
    String email,
    String password,
    String role,
    String? deviceToken,
  ) async {
    try {
      var response = await http.post(
        Uri.parse('https://fabricssoftware.com/api/v1/auth/login'),
        body: json.encode({
          "email": email,
          "password": password,
          "role": role,
          "deviceToken": deviceToken ?? ""
        }),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        print(jsonDecode(response.body));
        Get.showSnackbar(
          GetSnackBar(
            message: jsonDecode(response.body)['message'],
            duration: const Duration(seconds: 2),
          ),
        );
        Get.offAllNamed(Routes.home);
      } else {
        print(response.statusCode);
        print(jsonDecode(response.body));
        Get.showSnackbar(
          GetSnackBar(
            message: jsonDecode(response.body)['message'],
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
