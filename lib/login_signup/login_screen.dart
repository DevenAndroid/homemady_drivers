import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:homemady_drivers/repository/login_repo.dart';
import 'package:homemady_drivers/widgets/new_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../routers/routers.dart';
import '../widgets/custome_size.dart';
import '../widgets/custome_textfiled.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey1 = GlobalKey<FormState>();
  RegExp _emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
  RegExp _phoneRegExp = RegExp(r'^\+?[0-9]{7,}$');
  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a value';
    } else if (!_emailRegExp.hasMatch(value) && !_phoneRegExp.hasMatch(value)) {
      return 'Please enter a valid email or phone number';
    }
    return null;
  }
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Form(
            key: formKey1,
            child: Column(
                children:[
                  Stack(
                    children: [
                      SizedBox(
                          height: 280,
                          width: double.maxFinite,
                          child: Image.asset('assets/images/LoginBackground.png',fit: BoxFit.cover,)),
                      SizedBox(
                        width: screenWidth,
                        child: Column(
                          children: [
                            addHeight(40),
                            Image.asset('assets/images/AppLogo.png',width: 203,),
                            addHeight(35),
                            const Center(
                              child: Text('Login To Your Account',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'poppinsSans',
                                  fontWeight: FontWeight.w600,
                                  color:  Color(0xFF66656B),
                                ),),
                            ),
                            addHeight(20),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child:  Container(
                                width: screenWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF37C666).withOpacity(0.10),
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
                                  // validator: (value){
                                  //   if(value!.isEmpty){
                                  //     return "Email or Phone is required";
                                  //   }
                                  //   else{
                                  //     return null;
                                  //   }
                                  // },
                                  validator: _validateInput,
                                ),
                              ),
                            ),
                            addHeight(20),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(padding:  const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Container(
                          width: screenWidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF37C666).withOpacity(0.10),
                                offset: const Offset(.1, .1,
                                ),
                                blurRadius: 20.0,
                                spreadRadius: 1.0,
                              ),
                            ],
                          ),
                          child: CommonTextFieldWidget(
                            hint: 'Password',
                            controller: passwordController,
                            validator: (value){
                              if(value!.isEmpty){
                                return "Password is required";
                              }
                              else{
                                return null;
                              }
                            },
                          ),
                        ),
                        addHeight(30),
                        const Center(
                          child: Text(
                            'Or Continue With',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              fontFamily: 'poppinsSans',
                              color:  Color(0xFF333848),
                            ),
                          ),
                        ),
                        addHeight(23),
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
                                    color: const Color(0xFF37C666).withOpacity(0.10),
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
                                  const Icon(Icons.facebook,color: Colors.blue,size: 30,),
                                  addWidth(10),
                                  const Text('Facebook',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color:  Color(0xFF4C5369)
                                    ),)
                                ],
                              ),
                            ),
                            Container(
                              width: 152,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF37C666).withOpacity(0.10),
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
                                  Image.asset('assets/images/google.png',height: 25,),
                                  addWidth(10),
                                  const Text('Google',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color:  Color(0xFF4C5369)
                                    ),)
                                ],
                              ),
                            ),
                          ],
                        ),
                        addHeight(25),
                        InkWell(
                          onTap: (){
                            Get.toNamed(MyRouters.emailVerificationScreen2);
                          },
                          child: const Center(
                            child: Text(
                              'Forget your Password?',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  color:  Color(0xFF7ED957)
                              ),
                            ),
                          ),
                        ),
                        addHeight(20),
                        CommonButton(title: 'Login',
                          onPressed: () async{
                             if(formKey1.currentState!.validate()){
                                loginRepo(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    context: context
                                ).then((value) async{
                                   if(value.status==true){
                                     SharedPreferences pref = await SharedPreferences.getInstance();
                                     pref.setString('user_info', jsonEncode(value));
                                     NewHelper.showToast(value.message);
                                     Get.offAllNamed(MyRouters.deliveryPartnerApplyScreen);
                                   }
                                   else if(value.status==false){
                                     NewHelper.showToast(value.message);
                                   }
                                });
                             }
                        },),
                        addHeight(26),
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
                              onTap: (){
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
}
