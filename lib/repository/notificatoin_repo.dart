import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../api_url/api_url.dart';
import '../models/common_model.dart';
import '../models/notification_model.dart';
import '../models/verify_otp_model.dart';

Future<NotificationModel> notificationRepo() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  ModelVerifyOtp? user =
  ModelVerifyOtp.fromJson(jsonDecode(pref.getString('user_info')!));
  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.authorizationHeader: 'Bearer ${user.authToken}'
  };

  try {
    final response = await http.get(
        Uri.parse(ApiUrl.notificationUrl),
        headers: headers);
    log("Notification Repository...${response.body}");
    if (response.statusCode == 200) {
      log("Notification Repository...${response.body}");
      return NotificationModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.body);
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}
Future<ModelCommonResponse> deleteUserAccount() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  ModelVerifyOtp? user = ModelVerifyOtp.fromJson(jsonDecode(preferences.getString("user_info")!));

  try{
    final header={
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer ${user.authToken}'
    };
    http.Response data = await http.get(Uri.parse(ApiUrl.deleteUserAccount), headers: header);
    if(data.statusCode==200 || data.statusCode==400){
      return ModelCommonResponse.fromJson(jsonDecode(data.body));
    }else{
      throw Exception(data.body);
    }
  }catch(e){
    throw Exception(e.toString());
  }
}
