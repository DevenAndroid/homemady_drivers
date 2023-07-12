import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
  bool isEmail(String input) => RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailController.text);
  bool isPhone(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$').hasMatch(emailController.text);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                  height: screenHeight*.50,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/LoginBackground.png'),
                      fit: BoxFit.fill
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      addHeight(20),
                      Image.asset('assets/images/AppLogo.png',width: 203,),
                      addHeight(40),
                      const Center(
                        child: Text('Login To Your Account',
                          style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'poppinsSans',
                          fontWeight: FontWeight.w600,
                          color:  Color(0xFF66656B),
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
                      physics: const BouncingScrollPhysics(),
                      child: Form(
                        key: formKey1,
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
                                  // color: Colors.white
                              ),
                              child: CommonTextFieldWidget(
                                hint: 'Enter your email or phone number',
                                controller: emailController,
                                textInputAction: TextInputAction.next,
                                // validator: (value) {
                                //   if (!isEmail(value!) && !isPhone(value)) {
                                //     return 'Please enter a valid email or phone number.';
                                //   }
                                //   return null;
                                // },
                                // validator: (value) {
                                //   if (emailController.text.isEmpty) {
                                //     return "Please enter your email";
                                //   } else if (emailController.text
                                //       .contains('+') ||
                                //       emailController.text.contains(' ')) {
                                //     return "Email is invalid";
                                //   } else if (
                                //   RegExp(
                                //       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                //       .hasMatch(emailController.text)) {
                                //     return null;
                                //   } else {
                                //     return 'Please type a valid email address';
                                //   }
                                // },
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
                                  // color: Colors.white
                              ),
                              child: CommonTextFieldWidget(
                                hint: 'Password',
                                controller: passwordController,
                                // validator: MultiValidator([
                                //   RequiredValidator(
                                //       errorText: 'Please enter your password'),
                                //   MinLengthValidator(8,
                                //       errorText: 'Password must be at least 8 characters, with 1 special character & 1 numerical'),
                                //   PatternValidator(
                                //       r"(?=.*\W)(?=.*?[#?!@$%^&*-])(?=.*[0-9])",
                                //       errorText: "Password must be at least with 1 special character & 1 numerical"),
                                // ]),
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
                                            color:  Color(0xFF4C5369))),
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
                              child: Center(
                                child: Text(
                                  'Forget your Password?',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: const Color(0xFF7ED957)
                                ),
                                ),
                              ),
                            ),
                            addHeight(20),
                            CommonButton(title: 'Login',onPressed: (){
                              // Get.toNamed(MyRouters.thankYouVendorScreen);
                              if (formKey1.currentState!.validate()) {
                                Get.toNamed(MyRouters.deliveryPartnerApplyScreen);
                              }
                            },),
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
                                    Get.toNamed(MyRouters.signupScreen);
                                  },
                                  child:
                                  Text('  Signup',
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
