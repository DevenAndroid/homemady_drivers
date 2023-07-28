import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homemady_drivers/widgets/new_helper.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../api_url/api_url.dart';
import '../models/common_model.dart';
import '../models/deshborad_model.dart';
import '../models/get_ratingModel.dart';
import '../models/verify_otp_model.dart';
import '../widgets/helper.dart';


Future<getRating> getRatingRepo({required driverId}) async {

  SharedPreferences pref = await SharedPreferences.getInstance();
  ModelVerifyOtp? user =
  ModelVerifyOtp.fromJson(jsonDecode(pref.getString('user_info')!));
  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.authorizationHeader: 'Bearer ${user.authToken}'
  };
  // try {
  final response =
  await http.get(Uri.parse('${ApiUrl.ratingGetUrl}?type=driver&driver_id=$driverId'), headers: headers);

  if (response.statusCode == 200) {
    log("Driver Delivery Request List Data...${response.body}");
    return getRating.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(response.body);
  }
}