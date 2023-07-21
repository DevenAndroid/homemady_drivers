import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../api_url/api_url.dart';
import '../models/add_bank_details_model.dart';
import '../models/verify_otp_model.dart';
import '../widgets/new_helper.dart';


Future<VendorAddAccountDetailsModel> vendorAddBankDetailsRepo(String bank,
    String account_name, String account_no, String ifsc_code, context) async {
  Map<String, String> map = {};
  map['bank'] = bank;
  map['account_name'] = account_name;
  map['account_no'] = account_no;
  map['ifsc_code'] = ifsc_code;
  SharedPreferences pref = await SharedPreferences.getInstance();
  ModelVerifyOtp? user =
  ModelVerifyOtp.fromJson(jsonDecode(pref.getString('user_info')!));
  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.authorizationHeader: 'Bearer ${user.authToken}'
  };
  OverlayEntry loader = NewHelper.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  print(map);
  try {
    final response = await http.post(Uri.parse(ApiUrl.vendorAddBankDetailsUrl),
        body: jsonEncode(map), headers: headers);

    if (response.statusCode == 200 ||response.statusCode == 400) {
      NewHelper.hideLoader(loader);
      print("Add Bank Details Repository...${response.body}");

      return VendorAddAccountDetailsModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.body);
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}