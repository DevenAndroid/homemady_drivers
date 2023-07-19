import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class ApiUrl {
  static const baseUrl = "https://homemady.eoxyslive.com/api/";
  static const roleUrl = "${baseUrl}roles";
  static const registrationApi = "${baseUrl}register";
  static const loginApi = "${baseUrl}login";
  static const otpApi = "${baseUrl}verify-otp";
  static const driverRegistrationApi = "${baseUrl}driver-register";
  static const forgotPassword = "${baseUrl}forget-password?email=";
  static const resetPassword = "${baseUrl}reset-password";
  static const deshboradurl = "${baseUrl}driver-delivery-request-list";

}

Future getAuthHeader() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  print(pref.getString("cookie")!.toString().replaceAll('\"', ''));
  return {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    if(pref.getString("cookie") != null)
      HttpHeaders.authorizationHeader: 'Bearer ${pref.getString("cookie")!.toString().replaceAll('\"', '')}',
  };
}