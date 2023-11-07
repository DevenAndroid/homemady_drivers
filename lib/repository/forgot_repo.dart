import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../api_url/api_url.dart';
import '../models/common_model.dart';
import '../widgets/helper.dart';


Future<ModelCommonResponse> forgotPassRepo(phone,roleText,context) async {
  // var map = <String, dynamic>{};
  // map['email'] = username;

  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context).insert(loader);

  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
  };

  http.Response response = await http.get(Uri.parse( "${ApiUrl.forgotPassword}$phone&role=$roleText"),
      headers: headers);

  if (response.statusCode == 200  || response.statusCode == 400) {
    Helpers.hideLoader(loader);
    log("::::::::::username forgot password:::::::::::${response.body}");
    return ModelCommonResponse.fromJson(json.decode(response.body));
  } else {
    Helpers.createSnackBar(context, response.statusCode.toString());
    Helpers.hideLoader(loader);
    throw Exception(response.body);
  }
}