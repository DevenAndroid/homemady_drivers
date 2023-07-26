import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_profile_model.dart';
import '../models/verify_otp_model.dart';
import '../repository/user_profile_repo.dart';
import '../routers/routers.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  checkUser() async {

    SharedPreferences pref = await SharedPreferences.getInstance();

    if (pref.getString('user_info') != null) {
      userProfileData().then((value){
        if(value.data!.asDriverVerified==true){
          Get.offAllNamed(MyRouters.dashbordScreen);
          return;
        }
        // else if(value.data!.isVendor==true){
        //   Get.offAllNamed(ThankYouVendorScreen.thankYouVendorScreen);
        // }
        else{
          Get.offAllNamed(MyRouters.deliveryPartnerApplyScreen);
          return;
        }
      });
    }
    else{
      Get.offAllNamed(MyRouters.onBoardingScreen);
      return;
    }
  }


  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      checkUser();
    });
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Timer(const Duration(seconds: 2), () async {
  //     SharedPreferences pref = await SharedPreferences.getInstance();
  //     if (pref.getString('user_info') != null) {
  //       UserProfileModel? user = UserProfileModel.fromJson(jsonDecode(pref.getString('user_info')!));
  //       if(user.data!.asDriverVerified == true){
  //         Get.offAllNamed(MyRouters.dashbordScreen);
  //         return;
  //       }
  //      else{
  //         Get.offAllNamed(MyRouters.deliveryPartnerApplyScreen);
  //         return;
  //       }
  //     }
  //     else{
  //       Get.offAllNamed(MyRouters.onBoardingScreen);
  //     }
  //   }
  //
  //   );
  // }


  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          child: Image.asset('assets/images/Splash2.png',
            fit: BoxFit.fill,),
        ));
  }

}

