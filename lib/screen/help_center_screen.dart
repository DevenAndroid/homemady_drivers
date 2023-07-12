import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homemady_drivers/routers/routers.dart';

import '../widgets/custome_size.dart';
import '../widgets/custome_textfiled.dart';


class Help_Center_Screen extends StatefulWidget {
  const Help_Center_Screen({Key? key}) : super(key: key);

  @override
  State<Help_Center_Screen> createState() => _Help_Center_ScreenState();
}

class _Help_Center_ScreenState extends State<Help_Center_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: backAppBar(title: 'Help Center', context: context),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF37C666).withOpacity(0.10),
                    offset: const Offset(
                      .1,
                      .1,
                    ),
                    blurRadius: 20.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/helpMsg.png',
                    width: 52,
                    height:40,
                  ),
                  SizedBox(width: 20,),
                  Text("Chat/Email", style:GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      color: Color(0xFF1A2E33)
                  ),),
                ],
              ),
            ),
            addHeight(15),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF37C666).withOpacity(0.10),
                    offset: const Offset(
                      .1,
                      .1,
                    ),
                    blurRadius: 20.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/headphone.png',
                    width: 52,
                    height:40,
                  ),
                  SizedBox(width: 20,),
                  Text("HomeMady team", style:GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      color: Color(0xFF1A2E33)
                  ),),
                ],
              ),
            ),
            addHeight(15),
            GestureDetector(
              onTap: (){
                Get.toNamed(MyRouters.faqsScreen);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF37C666).withOpacity(0.10),
                      offset: const Offset(
                        .1,
                        .1,
                      ),
                      blurRadius: 20.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/faq.png',
                      width: 52,
                      height:40,
                    ),
                    SizedBox(width: 20,),
                    Text("FAQ", style:GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 19,
                        color: Color(0xFF1A2E33)
                    ),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
