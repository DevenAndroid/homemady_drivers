import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:homemady_drivers/repository/login_repo.dart';
import 'package:homemady_drivers/widgets/new_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../repository/social_login_repo.dart';
import '../routers/routers.dart';
import '../widgets/custome_size.dart';
import '../widgets/custome_textfiled.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey1 = GlobalKey<FormState>();
  RegExp _emailRegExp = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
  RegExp _phoneRegExp = RegExp(r'^\+?[0-9]{7,}$');
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email or Phone is required';
    } else if (!_emailRegExp.hasMatch(value) && !_phoneRegExp.hasMatch(value)) {
      return 'Please enter a valid email or phone number';
    }
    return null;
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoginPasswordShow = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Form(
            key: formKey1,
            child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                          height: screenHeight * .35,
                          width: double.maxFinite,
                          child: Image.asset(
                            'assets/images/LoginBackground.png',
                            fit: BoxFit.cover,)),
                      SizedBox(
                        width: screenWidth,
                        child: Column(
                          children: [
                            SizedBox(
                              height: screenHeight * .02,
                            ),
                            Image.asset(
                              'assets/images/AppLogo.png', width: 203,),
                            SizedBox(
                              height: screenHeight * .05,
                            ),
                            const Center(
                              child: Text('Login To Your Account',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'poppinsSans',
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF66656B),
                                ),),
                            ),
                            SizedBox(
                              height: screenHeight * .03,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16),
                              child: Container(
                                width: screenWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF37C666)
                                          .withOpacity(0.10),
                                      offset: const Offset(.1, .1,
                                      ),
                                      blurRadius: 20.0,
                                      spreadRadius: 1.0,
                                    ),
                                  ],
                                ),
                                child: CommonTextFieldWidget(
                                  textInputAction: TextInputAction.next,
                                  hint: 'Enter your email or phone number',
                                  controller: emailController,
                                  validator: _validateInput,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * .02,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Container(
                          width: screenWidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF37C666).withOpacity(
                                    0.10),
                                offset: const Offset(.1, .1,
                                ),
                                blurRadius: 20.0,
                                spreadRadius: 1.0,
                              ),
                            ],
                          ),
                          child: CommonTextFieldWidget(
                            obscureText: isLoginPasswordShow,
                            hint: 'Password',
                            controller: passwordController,
                            suffix: InkWell(
                              onTap: () {
                                isLoginPasswordShow = !isLoginPasswordShow;
                                setState(() {

                                });
                              },
                              child: Icon(
                                  isLoginPasswordShow
                                      ? CupertinoIcons.eye_slash_fill
                                      : CupertinoIcons.eye,
                                  size: 18,
                                  color: Colors.grey),
                            ),
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: 'Please Enter The Password'),
                              MinLengthValidator(6,
                                  errorText:
                                  'Password must be at least 6 digits long'),
                              // PatternValidator(
                              //     r"^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])",
                              //     errorText:
                              //     'Password must be minimum 6 characters,with \n1 Capital letter1 special character & 1 numerical.')
                            ]),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * .03,
                        ),
                        const Center(
                          child: Text(
                            'Or Continue With',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              fontFamily: 'poppinsSans',
                              color: Color(0xFF333848),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * .03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 152,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF37C666).withOpacity(
                                        0.10),
                                    offset: const Offset(.1, .1,
                                    ),
                                    blurRadius: 20.0,
                                    spreadRadius: 1.0,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.facebook, color: Colors.blue,
                                    size: 30,),
                                  addWidth(10),
                                  const Text('Facebook',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF4C5369)
                                    ),)
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                signInWithGoogle();
                              },
                              child: Container(
                                width: 152,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF37C666).withOpacity(
                                          0.10),
                                      offset: const Offset(.1, .1,
                                      ),
                                      blurRadius: 20.0,
                                      spreadRadius: 1.0,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/google.png', height: 25,),
                                    addWidth(10),
                                    const Text('Google',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF4C5369)
                                      ),)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * .03,
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(MyRouters.emailVerificationScreen2);
                          },
                          child: const Center(
                            child: Text(
                              'Forget your Password?',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  letterSpacing: 0.5,
                                  color: Color(0xFF7ED957)
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * .03,
                        ),
                        CommonButton(
                          title: 'Login',
                          onPressed: () async {
                            var fcmToken =
                            await FirebaseMessaging.instance
                                .getToken();
                            if (formKey1.currentState!.validate()) {
                              loginRepo(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  context: context,
                                  fcmToken: fcmToken!
                              ).then((value) async {
                                if (value.status == true) {
                                  SharedPreferences pref =
                                  await SharedPreferences.getInstance();
                                  pref.setString(
                                      'user_info', jsonEncode(value));
                                  NewHelper.showToast(value.message);
                                  if (value.data!.asDriverVerified == true) {
                                    print('Loginnnnnnnnnn.................................');
                                    Get.offAllNamed(MyRouters.dashbordScreen);
                                  } else {
                                    Get.offAllNamed(
                                        MyRouters.deliveryPartnerApplyScreen);
                                  }
                                } else if (value.status == false) {
                                  NewHelper.showToast(value.message);
                                }
                              });
                            }
                          },
                        ),
                        SizedBox(
                          height: screenHeight * .03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Don\'t have an account?',
                              style: TextStyle(
                                  color: Color(0xFF3A3737),
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(MyRouters.signupScreen);
                              },
                              child:
                              const Text('  Signup',
                                style: TextStyle(
                                    color: Color(0xFF69C541),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }

  signInWithGoogle() async {
    await GoogleSignIn().signOut();
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser!
        .authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );
    print("Token---------${googleAuth.accessToken}");
    final value = await FirebaseAuth.instance.signInWithCredential(credential);
    log(value.credential!.accessToken!);
    //log(value.additionalUserInfo.a);
    var fromToken = await FirebaseMessaging.instance.getToken();

    socialLogin(provider: "google",
        token: value.credential!.accessToken!,
        context: context).then((value) async {
      if (value.status == true) {
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString('user_info', jsonEncode(value));
        NewHelper.showToast(value.message);
        Get.offAllNamed(MyRouters.dashbordScreen);
      } else {
        NewHelper.showToast(value.message);
      }
    });
  }
}