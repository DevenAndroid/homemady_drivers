import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:homemady_drivers/widgets/new_helper.dart';

import '../repository/change_password_repo.dart';
import '../routers/routers.dart';
import '../widgets/custome_size.dart';
import '../widgets/custome_textfiled.dart';


class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoginPasswordShow= true;
  bool isLoginPasswordShow1= true;
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
                      height: screenHeight*.40,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/LoginBackground.png'),
                            fit: BoxFit.fill
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          addHeight(45),
                          Image.asset('assets/images/AppLogo.png',width: 203,),
                          addHeight(85),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 280,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
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
                                  hint: 'New Password',
                                  obscureText: isLoginPasswordShow,
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
                                  controller: passwordController,
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: 'Please Enter The Password'),
                                    MinLengthValidator(6,
                                        errorText:
                                        'Password must be at least 6 digits long'),
                                    PatternValidator(
                                        r"(?=.*[A-Z])(?=.*\W)(?=.*?[#?!@$%^&*-])(?=.*[0-9])",
                                        errorText:
                                        'Password must be minimum 6 characters,with \n1 Capital letter1 special character & 1 numerical.')
                                  ]),
                                ),
                              ),
                              addHeight(15),
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
                                  hint: 'Confirm New Password',
                                  obscureText: isLoginPasswordShow1,
                                  suffix: InkWell(
                                    onTap: () {
                                      isLoginPasswordShow1 = !isLoginPasswordShow1;
                                      setState(() {

                                      });
                                    },
                                    child: Icon(
                                        isLoginPasswordShow1
                                            ? CupertinoIcons.eye_slash_fill
                                            : CupertinoIcons.eye,
                                        size: 18,
                                        color: Colors.grey),
                                  ),
                                  controller: confirmPasswordController,
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return "Confirm password is required";
                                    } else if (value.trim().toString() !=
                                        passwordController.text.trim()) {
                                      return "Confirm password is not matching with password";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),

                              addHeight(34),
                              CommonButton(title: 'Continue',onPressed: (){
                                if (_formKey.currentState!.validate()) {
                                  changePassword(Get.arguments[0],passwordController.text,
                                      confirmPasswordController.text, context)
                                      .then((value) async {
                                    if (value.status == true) {
                                      NewHelper.showToast(value.message);
                                      Get.offAllNamed(MyRouters.loginScreen);
                                    } else {
                                      NewHelper.showToast(value.message);
                                    }
                                    return;
                                  });
                                }
                                // Get.toNamed(MyRouters.loginScreen);
                              },),
                              addHeight(36),
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
