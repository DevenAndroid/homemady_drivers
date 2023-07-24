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
  static const resendOtpUrl = "${baseUrl}resend-otp";
  static const privacyPolicyUrl = "${baseUrl}pages";
  static const vendorAddBankDetailsUrl = "${baseUrl}add-account-details";
  static const vendorBankListUrl = "${baseUrl}banks-list";
  static const vendorBankDetailsUrl = "${baseUrl}account-details";
  static const withdrawalListUrl = "${baseUrl}withdrawal-list";
  static const withdrawalRequestUrl = "${baseUrl}withdrawal-request";
  static const modeStatusUrl = "${baseUrl}driver-delivery-mode-update";
  static const userProfileUrl = "${baseUrl}user-profile";
  static const updateProfileUrl = "${baseUrl}update-profile";
  static const driverDeliveryModeUpdateUrl = "${baseUrl}driver-delivery-mode-update";
  static const assignedOrderListUrl = "${baseUrl}assigned-order";


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