import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homemady_drivers/routers/routers.dart';
import 'package:homemady_drivers/widgets/custome_size.dart';
import 'package:homemady_drivers/widgets/custome_textfiled.dart';

import '../widgets/dimenestion.dart';


class DashbordScreen extends StatefulWidget {
  const DashbordScreen({Key? key}) : super(key: key);

  @override
  State<DashbordScreen> createState() => _DashbordScreenState();
}

class _DashbordScreenState extends State<DashbordScreen> {
  bool state = true;
  double _value=20;
  int currentDrawer = 0;
  int value1 = 20;
  bool? _isValue = true;
  bool? _isValue1 = false;
  bool? _isValue2 = false;
  bool? _isValue3 = true;
  bool? _isValue4 = false;
  bool? _isValue5 = true;
  bool? _isValue6 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 230,
              child: DrawerHeader(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF7ED957),
                          Color(0xFF68C541),
                        ],
                      )
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/Ellipse 67.png',
                          height: 100,
                        ),
                        Text('Williams Jones',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w600,)),
                        Text('williamsjones@gmail.com',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w400,)),
                      ],
                    ),
                  )),
            ),
            ListTile(
              visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
              leading: Image.asset(
                'assets/images/dashboard_icon.png',
                height: 15,
              ),
              title:  Text('Dashboard',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: const Color(0xFF4F535E),
                    fontWeight: FontWeight.w400,)),
              onTap: () {
                setState(() {
                  currentDrawer = 0;
                  Get.back();
                });
              },
            ),
            const Divider(
              height: 5,
              color: Color(0xffEFEFEF),
              thickness: 1,
            ),
            ListTile(
              visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
              leading: Image.asset(
                'assets/images/personImg.png',
                height: 15,
              ),
              title:  Text('My Account',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: const Color(0xFF4F535E),
                    fontWeight: FontWeight.w400,)),
              onTap: () {
                setState(() {
                  currentDrawer = 1;
                  // Get.toNamed(MyRouters.myProfileScreen);
                  // Get.to(VendorOrderList());
                });
              },
            ),
            const Divider(
              height: 5,
              color: Color(0xffEFEFEF),
              thickness: 1,
            ),
            ListTile(
              visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
              leading: Image.asset(
                'assets/images/time_track.png',
                height: 15,
              ),
              title:  Text('Assigned Order',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: const Color(0xFF4F535E),
                    fontWeight: FontWeight.w400,)),
              onTap: () {
                setState(() {
                    Get.toNamed(MyRouters.assignedOrderScreen);
                });
              },
            ),
            const Divider(
              height: 5,
              color: Color(0xffEFEFEF),
              thickness: 1,
            ),
            ListTile(
              visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
              leading: Image.asset(
                'assets/images/bx_wallet.png',
                height: 15,
              ),
              title:  Text('Bank Details',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: const Color(0xFF4F535E),
                    fontWeight: FontWeight.w400,)),
              onTap: () {
                setState(() {
                  currentDrawer = 3;
                  Get.toNamed(MyRouters.bankDetailsScreen);
                });
              },
            ),
            const Divider(
              height: 5,
              color: Color(0xffEFEFEF),
              thickness: 1,
            ),
            ListTile(
              visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
              leading: Image.asset(
                'assets/images/earn.png',
                height: 15,
              ),
              title:  Text('Earning',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: const Color(0xFF4F535E),
                    fontWeight: FontWeight.w400,)),
              onTap: () {
                setState(() {
                  currentDrawer = 3;
                  Get.toNamed(MyRouters.driverWithdrawMoney);
                });
              },
            ),
            // const Divider(
            //   height: 5,
            //   color: Color(0xffEFEFEF),
            //   thickness: 1,
            // ),
            // ListTile(
            //   visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
            //   leading: Image.asset(
            //     'assets/images/notebook_reference.png',
            //     height: 20,
            //   ),
            //   title:  Text('Refer and Earn',
            //       style: GoogleFonts.poppins(
            //         fontSize: 15,
            //         color: const Color(0xFF4F535E),
            //         fontWeight: FontWeight.w400,)),
            //   onTap: () {
            //     setState(() {
            //       currentDrawer = 4;
            //       // Get.to(VendorNotificationScreen());
            //     });
            //   },
            // ),
            const Divider(
              height: 5,
              color: Color(0xffEFEFEF),
              thickness: 1,
            ),
            ListTile(
              visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
              leading: Image.asset(
                'assets/images/message.png',
                height: 15,
              ),
              title:  Text('Message',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: const Color(0xFF4F535E),
                    fontWeight: FontWeight.w400,)),
              onTap: () {
                setState(() {
                  currentDrawer = 5;
                  Get.toNamed(MyRouters.chatScreen);
                });
              },
            ),
            const Divider(
              height: 5,
              color: Color(0xffEFEFEF),
              thickness: 1,
            ),
            ListTile(
              visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
              leading: Image.asset(
                'assets/images/bx_wallet.png',
                height: 15,
              ),
              title:  Text('Update Driver Setting',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: const Color(0xFF4F535E),
                    fontWeight: FontWeight.w400,)),
              onTap: () {
                setState(() {
                  currentDrawer = 5;
                  Get.toNamed(MyRouters.bankDetailsScreen);
                });
              },
            ),
            const Divider(
              height: 5,
              color: Color(0xffEFEFEF),
              thickness: 1,
            ),
            ListTile(
              visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
              leading: Image.asset(
                'assets/images/metro-security.png',
                height: 15,
              ),
              title:  Text('Privacy Policy',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: const Color(0xFF4F535E),
                    fontWeight: FontWeight.w400,)),
              onTap: () {
                setState(() {
                  currentDrawer = 6;
                  Get.toNamed(MyRouters.privacyPolicies);
                });
              },
            ),
            const Divider(
              height: 5,
              color: Color(0xffEFEFEF),
              thickness: 1,
            ),
            ListTile(
              visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
              leading: Image.asset(
                'assets/images/help_center.png',
                height: 15,
              ),
              title:  Text('Help Center',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: const Color(0xFF4F535E),
                    fontWeight: FontWeight.w400,)),
              onTap: () {
                setState(() {
                  currentDrawer = 7;
                Get.toNamed(MyRouters.help_Center_Screen);
                });
              },
            ),
            const Divider(
              height: 5,
              color: Color(0xffEFEFEF),
              thickness: 1,
            ),
            ListTile(
              visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
              leading: Image.asset(
                'assets/images/logout.png',
                height: 15,
              ),
              title:  Text('Logout',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: const Color(0xFF4F535E),
                    fontWeight: FontWeight.w400,)),
              onTap: () {
                setState(() {
                  currentDrawer = 7;
                  // Get.to(SettingScreenVendor());
                });
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0,
        titleSpacing: 30,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          Row(
             children: [
               const Text(' Delivey Mode', style: TextStyle(
                   fontWeight: FontWeight.w500,
                   fontSize: 10,
                   color:  Color(0xFF303C5E)
               ),
               ),
               Transform.scale(
                 scale: 0.8,
                 child: CupertinoSwitch(
                   activeColor: const Color(0xFF7ED957),
                   value : state,
                   onChanged: (value) {
                     state = value;
                     setState(() {
                     },
                     );
                   }
                   ),
               ),

             ],
          )
        ],
        leadingWidth: AddSize.size40 * 0.9,
        title: const Text('Dashbord', style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 17,
              color:  Color(0xFF1A2E33)
        ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const Text('Hi, Hoanganhover!',
               style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color:  Color(0xFF303C5E)
              ),),
              addHeight(7.0),
              const Text('Riders/drivers that are available for at least 4 hours a day and at least 5 days a week (and did not reject any order) will get 10% boost on next week earnings',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color:  Color(0xFF303C5E)
                ),),
              addHeight(16.0),
              Wrap(
                spacing: 10.0,
                children: [
                  Column(
                    children: [
                      Transform.scale(
                        scale: 1.5,
                        child: Checkbox(
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            side: BorderSide(color: Colors.grey.shade300,width: 1.4),
                            activeColor: Color(0xff7ED957),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(3)),
                            value: _isValue,
                            onChanged: (bool? value) {
                              setState(() {
                                _isValue = value;
                              });
                            }),
                      ),
                     const Text('Su',style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF303C5E)
                      ),)
                    ],
                  ),
                  Column(
                    children: [
                      Transform.scale(
                        scale: 1.5,
                        child: Checkbox(
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            side: BorderSide(color: Colors.grey.shade300,width: 1.4),
                            activeColor: Color(0xff7ED957),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(3)),
                            value: _isValue1,
                            onChanged: (bool? value) {
                              setState(() {
                                _isValue1 = value;
                              });
                            }),
                      ),
                      const Text('Mo',style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF303C5E)
                      ),)
                    ],
                  ),
                  Column(
                    children: [
                      Transform.scale(
                        scale: 1.5,
                        child: Checkbox(
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            side: BorderSide(color: Colors.grey.shade300,width: 1.4),
                            activeColor: Color(0xff7ED957),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(3)),
                            value: _isValue2,
                            onChanged: (bool? value) {
                              setState(() {
                                _isValue2 = value;
                              });
                            }),
                      ),
                      const Text('Tu',style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF303C5E)
                      ),)
                    ],
                  ),
                  Column(
                    children: [
                      Transform.scale(
                        scale: 1.5,
                        child: Checkbox(
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            side: BorderSide(color: Colors.grey.shade300,width: 1.4),
                            activeColor: Color(0xff7ED957),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(3)),
                            value: _isValue3,
                            onChanged: (bool? value) {
                              setState(() {
                                _isValue3 = value;
                              });
                            }),
                      ),
                      const Text('We',style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF303C5E)
                      ),)
                    ],
                  ),
                  Column(
                    children: [
                      Transform.scale(
                        scale: 1.5,
                        child: Checkbox(
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            side: BorderSide(color: Colors.grey.shade300,width: 1.4),
                            activeColor: Color(0xff7ED957),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(3)),
                            value: _isValue4,
                            onChanged: (bool? value) {
                              setState(() {
                                _isValue4 = value;
                              });
                            }),
                      ),
                      const Text('Th',style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF303C5E)
                      ),)
                    ],
                  ),
                  Column(
                    children: [
                      Transform.scale(
                        scale: 1.5,
                        child: Checkbox(
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            side: BorderSide(color: Colors.grey.shade300,width: 1.4),
                            activeColor: Color(0xff7ED957),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(3)),
                            value: _isValue5,
                            onChanged: (bool? value) {
                              setState(() {
                                _isValue5 = value;
                              });
                            }),
                      ),
                      const Text('Fr',style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF303C5E)
                      ),)
                    ],
                  ),
                  Column(
                    children: [
                      Transform.scale(
                        scale: 1.5,
                        child: Checkbox(
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            side: BorderSide(color: Colors.grey.shade300,width: 1.4),
                            activeColor: Color(0xff7ED957),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(3)),
                            value: _isValue6,
                            onChanged: (bool? value) {
                              setState(() {
                                _isValue6 = value;
                              });
                            }),
                      ),
                      const Text('Sa',style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF303C5E)
                      ),)
                    ],
                  ),
                ],
              ),
              addHeight(26.0),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 165,
                      width: AddSize.screenWidth,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF5F5F5F).withOpacity(0.4),
                              offset: const Offset(0.0, 0.5),
                              blurRadius: 5,),
                          ]
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                              right: 0,
                              child: Column(
                                children: [
                                  Image.asset('assets/images/Group 362.png',height: 98,)
                                ],
                              )
                          ),
                          Positioned(
                              bottom: 10,
                              left: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const[
                                  Text('10',style: TextStyle(
                                      color: Color(0xFF7ED957),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 21
                                  ),),
                                  Text('Delivered',style: TextStyle(
                                      color: Color(0xFF393E50),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14
                                  ),)
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                  addWidth(19),
                  Expanded(
                     child: Container(
                       height: 165,
                       width: AddSize.screenWidth,
                       decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(10),
                           boxShadow: [
                             BoxShadow(
                               color: const Color(0xFF5F5F5F).withOpacity(0.4),
                               offset: const Offset(0.0, 0.5),
                               blurRadius: 5,),
                           ]
                       ),
                      child: Stack(
                        children: [
                          Positioned(
                              right: 0,
                              child: Image.asset('assets/images/Group 363.png',height: 98,)
                          ),
                          Positioned(
                            bottom: 10,
                              left: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const[
                                   Text('\$240.00',style: TextStyle(
                                     color: Color(0xFFFF980E),
                                     fontWeight: FontWeight.w700,
                                     fontSize: 21
                                   ),),
                                  Text('Delivered',style: TextStyle(
                                     color: Color(0xFF393E50),
                                     fontWeight: FontWeight.w600,
                                     fontSize: 14
                                   ),)
                                ],
                              )
                          ),
                        ],
                      ),
                     ),
                   ),
                ],
              ),
              addHeight(15.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF5F5F5F).withOpacity(0.4),
                        offset: const Offset(0.0, 0.5),
                        blurRadius: 5,),
                    ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Padding(
                       padding:  const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           const Text('Set Delivery Location',
                             style: TextStyle(
                                 fontWeight: FontWeight.w700,
                                 fontSize: 12,
                                 color:  Color(0xFF303C5E)
                             ),),
                           Text(
                             value1.toString(),
                             style: const TextStyle(
                                 fontWeight: FontWeight.w500,
                                 color: Color(0xff516670),
                                 fontSize: 14),
                           ),
                         ],
                       ),
                     ),
                    Padding(
                      padding:  const EdgeInsets.symmetric(horizontal: 0,vertical: 18),
                      child: SizedBox(
                        height: 10,
                        width: AddSize.screenWidth,
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 8.0,
                            trackShape: const RoundedRectSliderTrackShape(),
                            activeTrackColor: const Color(0xff6CD241),
                            inactiveTrackColor: const Color(0xFF7ED957).withOpacity(0.12),
                            thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 7.0,
                              pressedElevation: 8.0,
                            ),
                            thumbColor: Colors.white,
                            overlayColor: const Color(0xFF7ED957).withOpacity(0.12),
                            overlayShape: const RoundSliderOverlayShape(overlayRadius: 2.0),
                            tickMarkShape: const RoundSliderTickMarkShape(),
                            activeTickMarkColor: const Color(0xff6CD241),
                            inactiveTickMarkColor: Colors.transparent,
                            valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
                            valueIndicatorColor: const Color(0xff6CD241),
                            valueIndicatorTextStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          child: Expanded(
                            child: Slider(
                              min: 0.0,
                              max: 100.0,
                              value: _value,
                              divisions: 10,
                              label: '${_value.round()}',
                              onChanged: (value) {
                                setState(() {
                                  _value = value;
                                  value1 = value.toInt();
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              addHeight(16.0),
              Text('New Delivery Request',
                style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color:  const Color(0xFF303C5E)
                ),),
              addHeight(12.0),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                physics: const BouncingScrollPhysics(),
                 itemBuilder: (context, index) {
                   return Column(
                      children: [
                          Container(
                               decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(10),
                                   boxShadow: [
                                     BoxShadow(
                                       color: const Color(0xFF5F5F5F).withOpacity(0.4),
                                       offset: const Offset(0.0, 0.5),
                                       blurRadius: 5,),
                                   ],
                             ),
                            child: Stack(
                              children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                              Image.asset('assets/images/calender_Img.png',height: 18,),
                                        addWidth(20),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children:  [
                                             const Text('#258135452',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 14,
                                                  color:  Color(0xFF303C5E)
                                              ),),
                                           addHeight(4),
                                           Text('Mon 2 June, 2021 – 10:30am',
                                              style: GoogleFonts.raleway(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15,
                                                  color:  const Color(0xFF303C5E)
                                              ),),
                                            addHeight(25),
                                            Row(
                                              children: [
                                                 InkWell(
                                                   onTap: (){
                                                     Get.toNamed(MyRouters.assignedOrderScreen);
                                                   },
                                                    child: Container(
                                                      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 6),
                                                      decoration: BoxDecoration(
                                                        color: const Color(0xFF7ED957),
                                                        borderRadius: BorderRadius.circular(6)
                                                      ),
                                                      child:  Text('Accept'.toUpperCase(),
                                                        style: const TextStyle(
                                                            fontWeight: FontWeight.w700,
                                                            fontSize: 13,
                                                            color: Colors.white
                                                        ),),
                                                    ),
                                                 ),
                                                addWidth(16),
                                                InkWell(
                                                  onTap: (){
                                                    Get.toNamed(MyRouters.orderDeclineScreen);
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 6),
                                                    decoration: BoxDecoration(
                                                        color: const Color(0xFFF04148),
                                                        borderRadius: BorderRadius.circular(6)
                                                    ),
                                                    child:  Text('Decline'.toUpperCase(),
                                                      style: const TextStyle(
                                                          fontWeight: FontWeight.w700,
                                                          fontSize: 13,
                                                          color: Colors.white
                                                      ),),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                Positioned(
                                  right: 5,
                                    top: 8,
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                                          decoration: BoxDecoration(
                                              color: const Color(0xFF7ED957),
                                              borderRadius: BorderRadius.circular(6)
                                          ),
                                          child:  Text('COD'.toUpperCase(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 10,
                                                color: Colors.white
                                            ),),
                                        ),
                                        addWidth(8.0),
                                       const Text('€250.00',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14,
                                              color:  Color(0xFF7ED957)
                                          ),),
                                      ],
                                    )
                                )
                              ],
                            ),
                          ),
                        addHeight(15),
                      ],
                   );
                 },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
