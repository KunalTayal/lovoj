import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiRepositary {
  createStore(
    String name,
    String otp,
    String email,
    String storeType,
    String password,
    String mobileNumber,
  ) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://fabricssoftware.com/api/v1/auth/createStore'),
    );
    request.fields.addAll({
      'name': name,
      'otp_key': otp,
      'email': email,
      'storeType': storeType,
      'password': password,
      'mobileNumber': mobileNumber,
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  sendOTP(String email) async {
    var request = http.Request(
      'POST',
      Uri.parse('https://fabricssoftware.com/api/v1/auth/checkemail'),
    );
    request.body = json.encode({"email": email});
    request.headers.addAll({'Content-Type': 'application/json'});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  storeLogin(
    String email,
    String password,
    String role,
    String? deviceToken,
  ) async {
    var request = http.Request(
      'POST',
      Uri.parse('https://fabricssoftware.com/api/v1/auth/login'),
    );
    request.body = json.encode({
      "email": email,
      "password": password,
      "role": role,
      "deviceToken": deviceToken ?? ""
    });
    request.headers.addAll({'Content-Type': 'application/json'});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
