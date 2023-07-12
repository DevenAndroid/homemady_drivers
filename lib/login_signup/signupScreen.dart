import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../routers/routers.dart';
import '../widgets/custome_size.dart';
import '../widgets/custome_textfiled.dart';



class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey1 = GlobalKey<FormState>();
  RxBool checkboxColor = false.obs;
  bool showErrorMessage = false;
  bool value = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: screenHeight,
          child: Stack(
              children:[
                Column(
                  children: [
                    Container(
                      width: screenWidth,
                      height: screenHeight*.45,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/LoginBackground.png'),
                            fit: BoxFit.fill
                        ),
                      ),
                      child: Column(
                        children: [
                          addHeight(30),
                          Image.asset('assets/images/AppLogo.png',width: 203,),
                          addHeight(36),
                          Center(
                            child: Text(' Sign Up to your Account',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF66656B),
                              ),),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 260,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Form(
                          key: _formKey1,
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
                                  hint: 'Name',
                                  controller: nameController,
                                  textInputAction: TextInputAction.next,
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: 'Please enter your name'),
                                  ]),
                                ),
                              ),
                             addHeight(20),
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
                                  hint: 'Email',
                                  controller: emailController,
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (emailController.text.isEmpty) {
                                      return "Please enter your email";
                                    } else if (emailController.text
                                        .contains('+') ||
                                        emailController.text.contains(' ')) {
                                      return "Email is invalid";
                                    } else if (
                                    RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(emailController.text)) {
                                      return null;
                                    } else {
                                      return 'Please type a valid email address';
                                    }
                                  },
                                ),
                              ),
                              addHeight(20),
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
                                  hint: 'Phone',
                                  controller: phoneController,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: const TextInputType
                                      .numberWithOptions(decimal: true),
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: 'Please enter your contact number '),
                                    MinLengthValidator(10,
                                        errorText: 'Please enter 10 digit number'),
                                    MaxLengthValidator(10,
                                        errorText: 'Please enter 10 digit number'),
                                    PatternValidator(
                                        r'(^(?:[+0]9)?[0-9]{10,12}$)',
                                        errorText: '')
                                  ]),
                                ),
                              ),
                              addHeight(20),
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
                                  textInputAction: TextInputAction.next,
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: 'Please enter your password'),
                                    MinLengthValidator(8,
                                        errorText: 'Password must be at least 8 characters, with 1 special character & 1 numerical'),
                                    PatternValidator(
                                        r"(?=.*\W)(?=.*?[#?!@$%^&*-])(?=.*[0-9])",
                                        errorText: "Password must be at least with 1 special character & 1 numerical"),
                                  ]),
                                ),
                              ),
                              addHeight(20),
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
                                  hint: 'Confirm Password',
                                  controller: confirmController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    if (value.toString() ==
                                        passwordController.text) {
                                      return null;
                                    }
                                    return "Confirm password not matching with password";
                                  },
                                ),
                              ),
                              addHeight(23),
                              Row(
                                children: [
                                  Transform.scale(
                                    scale: 1.2,
                                    child: Theme(
                                      data: ThemeData(
                                          unselectedWidgetColor: checkboxColor.value == false
                                              ? Color(0xFF64646F)
                                              : Color(0xFF64646F)
                                      ),
                                      child: Checkbox(
                                          shape: CircleBorder(),
                                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                          value: value,
                                          activeColor: Color(0xFF7ED957),
                                          onChanged: (newValue) {
                                            setState(() {
                                              value = newValue!;
                                              checkboxColor.value = !newValue!;
                                            });
                                          }),
                                    ),
                                  ),
                                  Text(
                                      'Keep Me Signed In.',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: const Color(0xFF64646F))),
                                ],
                              ),
                              addHeight(26),
                              CommonButton(title: 'Signup',onPressed: (){
                            if ( _formKey1.currentState!.validate()) {}
                             if (value != true) {
                                 setState(() {
                                   showErrorMessage = true;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                   const SnackBar(
                                    content: Text(
                                     "Agree to our terms of Service"),
                                  ));
                                }
                                );
                              }
                             else {
                               setState(() {
                                 showErrorMessage = false;
                                 Get.toNamed(MyRouters.otpScreen);
                               });
                             }
                              }),
                              addHeight(26),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Don\'t have an account?',
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF3A3737),
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      Get.back();
                                    },
                                    child:
                                    Text(' Login',
                                      style: GoogleFonts.poppins(
                                          color: const Color(0xFF69C541),
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
                      )
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }
}
