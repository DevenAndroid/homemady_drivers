import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homemady_drivers/routers/routers.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/custome_size.dart';
import '../widgets/custome_textfiled.dart';


class Help_Center_Screen extends StatefulWidget {
  const Help_Center_Screen({Key? key}) : super(key: key);

  @override
  State<Help_Center_Screen> createState() => _Help_Center_ScreenState();
}

class _Help_Center_ScreenState extends State<Help_Center_Screen> {
  void sendEmail() async {
    // Change the email address and subject to suit your needs
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'support@homemady.com',
      query: 'subject=Hello%20from%20Flutter',
    );

    // if (await canLaunch(params.toString())) {
      await launch(params.toString());
    // } else {
    //   throw 'Could not launch email';
    // }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: backAppBar(title: 'Help Center', context: context),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
        child: Column(
          children: [
            InkWell(
              onTap: (){
                  // mailToAdminRepo().then((value){
                  //   if(value.status==true){
                  //     NewHelper.showToast(value.message);
                  //   }
                  // });
                sendEmail();
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
                      'assets/images/helpMsg.png',
                      width: 52,
                      height:40,
                    ),
                   const SizedBox(width: 20,),
                    const Expanded(
                     child:  Text("Email HomeMady Support",
                       style:TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 19,
                          color: Color(0xFF1A2E33)
                      ),),
                   ),
                  ],
                ),
              ),
            ),
            addHeight(15),
            InkWell(
              onTap: (){
                Get.toNamed(MyRouters.chatScreen);
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
                      'assets/images/headphone.png',
                      width: 52,
                      height:40,
                    ),
                    const SizedBox(width: 20,),
                    const Expanded(
                      child: Text("Chat HomeMady Support",
                        style:TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 19,
                            color: Color(0xFF1A2E33)
                        ),),
                    ),
                  ],
                ),
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
                   const SizedBox(width: 20,),
                   const Text("FAQ",
                      style:TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
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
