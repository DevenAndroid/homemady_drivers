import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../api_url/api_url.dart';
import '../models/verify_otp_model.dart';
import '../widgets/new_helper.dart';

Future<ModelVerifyOtp> loginRepo(
    {required String email,
      required String password,
      // required String fcmToken,
      required BuildContext context}) async {
  OverlayEntry loader = NewHelper.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  SharedPreferences pref = await SharedPreferences.getInstance();
  //print("These are details.....${pref}");
  var map = <String, dynamic>{};
  map['email'] = email;
  map['password'] = password;
  map['device_id'] = pref.getString('deviceId');
  // map['device_token'] = fcmToken;

  log("Login Data map$map");
  try {
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
    };

    http.Response response = await http.post(Uri.parse(ApiUrl.loginApi),
        body: jsonEncode(map), headers: headers);

    if (response.statusCode == 200||response.statusCode == 400) {
      print("<<<<<<<Login Data from repository=======>${response.body}");
      NewHelper.hideLoader(loader);
      return ModelVerifyOtp.fromJson(json.decode(response.body));
    } else {
      NewHelper.hideLoader(loader);
      throw Exception(response.body);
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}
