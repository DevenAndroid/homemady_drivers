import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homemady_drivers/routers/routers.dart';
import 'package:homemady_drivers/widgets/custome_size.dart';
import 'package:homemady_drivers/widgets/new_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controller/assigned_Orderlist_controller.dart';
import '../controller/deshborad_controoler.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../controller/driver_information_controller.dart';
import '../controller/get_feedback_controller.dart';
import '../controller/userProfile_controller.dart';
import '../repository/assigned_order_repo.dart';
import '../repository/delivery_mode_update_repo.dart';
import '../repository/set_delivery_range_repo.dart';
import '../widgets/app_theme.dart';
import '../widgets/dimenestion.dart';

class DashbordScreen extends StatefulWidget {
  const DashbordScreen({Key? key}) : super(key: key);

  @override
  State<DashbordScreen> createState() => _DashbordScreenState();
}

class _DashbordScreenState extends State<DashbordScreen> {
  bool state = true;
  int currentDrawer = 0;
  int value1 = 1;
  bool? value2 =false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  RxBool isSelect = true.obs;
  RxBool isSelect1 = true.obs;
  RxBool isSelect2 = true.obs;
  RxBool isSelect3 = true.obs;
  RxBool isSelect4 = true.obs;
  RxBool isSelect5 = true.obs;
  RxBool isSelect6 = true.obs;
  final controller = Get.put(DeshBoradController());
  final controller1 = Get.put(UserProfileController());
  final assignedController = Get.put(AssignedOrderController());
  final controllerFeedback = Get.put(GetFeedbackController());
  final controllerDriverId = Get.put(DriverInformationController());

  List days=['Su','Mo','Tu','We','Th','Fr','Sa'];

  final RxBool _store = false.obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getData();
      controller1.getData();
      controllerFeedback.getData();
      controllerDriverId.getData();
    });

    _store;
  }

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    log(controller1.valueRange);
    return Scaffold(
      key: _scaffoldKey,
      drawer: Obx(() {
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                //height: 230,
                child: DrawerHeader(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        Color(0xFF7ED957),
                        Color(0xFF68C541),
                      ],
                    )),
                    child: Column(
                      children: [
                        Expanded(
                          child: Obx(() {
                            return ClipRRect(
                              borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                              child: Container(

                                decoration: const BoxDecoration(
                                  color: Color(0xFF44B5AB),
                                ),
                                child: CachedNetworkImage(
                                  //width: 100,
                                  //height: 100,
                                  fit: BoxFit.cover,
                                  imageUrl: controller1
                                      .model.value.data!.profileImage
                                      .toString(),
                                  placeholder: (context, url) =>
                                      const SizedBox(),
                                  errorWidget: (context, url, error) =>
                                      Image.asset('assets/images/avtar.png'),
                                ),
                              ),
                            );
                          }),
                        ),
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height * 0.008,
                        // ),
                        Text(controller1.model.value.data!.name.toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w600,
                            )),
                        Text(
                            controller1.model.value.data!.email.toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    )),
              ),
              ListTile(
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -2),
                leading: Image.asset(
                  'assets/images/dashboard_icon.png',
                  height: 18,
                ),
                title: Text('Dashboard',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: const Color(0xFF4F535E),
                      fontWeight: FontWeight.w400,
                    )),
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
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -2),
                leading: Image.asset(
                  'assets/images/personImg.png',
                  height: 18,
                ),
                title: Text('My Account',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: const Color(0xFF4F535E),
                      fontWeight: FontWeight.w400,
                    )),
                onTap: () {
                  setState(() {
                    currentDrawer = 1;
                    Get.toNamed(MyRouters.myProfileScreen);
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
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -2),
                leading: Image.asset(
                  'assets/images/time_track.png',
                  height: 18,
                ),
                title: Text('Assigned Orders',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: const Color(0xFF4F535E),
                      fontWeight: FontWeight.w400,
                    )),
                onTap: () {
                  Get.toNamed(MyRouters.assignedOrderScreen);
                },
              ),
              const Divider(
                height: 5,
                color: Color(0xffEFEFEF),
                thickness: 1,
              ),
              ListTile(
                visualDensity:
                const VisualDensity(horizontal: -4, vertical: -2),
                leading: Image.asset(
                  'assets/images/notification-img.png',
                  height: 18,
                ),
                title: Text('Notifications',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: const Color(0xFF4F535E),
                      fontWeight: FontWeight.w400,
                    )),
                onTap: () {
                  Get.toNamed(MyRouters.notificationScreen);
                },
              ),
              const Divider(
                height: 5,
                color: Color(0xffEFEFEF),
                thickness: 1,
              ),
              ListTile(
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -2),
                leading: Image.asset(
                  'assets/images/bx_wallet.png',
                  height: 18,
                ),
                title: Text('Bank Details',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: const Color(0xFF4F535E),
                      fontWeight: FontWeight.w400,
                    )),
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
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -2),
                leading: Image.asset(
                  'assets/images/earn.png',
                  height: 17,
                ),
                title: Text('My Earnings',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: const Color(0xFF4F535E),
                      fontWeight: FontWeight.w400,
                    )),
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
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -2),
                leading: Image.asset(
                  'assets/images/message.png',
                  height: 17,
                ),
                title: Text('My Chats',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: const Color(0xFF4F535E),
                      fontWeight: FontWeight.w400,
                    )),
                onTap: () {
                  setState(() {
                    currentDrawer = 5;
                    Get.toNamed(MyRouters.notificationScreen2);
                  });
                },
              ),
              const Divider(
                height: 5,
                color: Color(0xffEFEFEF),
                thickness: 1,
              ),
              ListTile(
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -2),
                leading: Image.asset(
                  'assets/images/bx_wallet.png',
                  height: 17,
                ),
                title: Text('Update Driver Settings',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: const Color(0xFF4F535E),
                      fontWeight: FontWeight.w400,
                    )),
                onTap: () {
                  setState(() {
                    currentDrawer = 5;
                    Get.toNamed(MyRouters.deliveryPartnerUpdateScreen);
                  });
                },
              ),
              const Divider(
                height: 5,
                color: Color(0xffEFEFEF),
                thickness: 1,
              ),
              ListTile(
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -2),
                leading: Image.asset(
                  'assets/images/feedback_img.png',
                  height: 20,
                  color: const Color(0xFF4F535E),
                ),
                title: Text('Feedback',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: const Color(0xFF4F535E),
                      fontWeight: FontWeight.w400,
                    )),
                onTap: () {
                  setState(() {
                    controllerFeedback.driverId.value = controllerDriverId.model.value.data!.driverId.toString();
                    print(controllerFeedback.driverId.value);
                    Get.toNamed(MyRouters.feedBackScreen);
                  });
                },
              ),
              const Divider(
                height: 5,
                color: Color(0xffEFEFEF),
                thickness: 1,
              ),
              ListTile(
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -2),
                leading: Image.asset(
                  'assets/images/metro-security.png',
                  height: 18,
                ),
                title: Text('Privacy Policy',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: const Color(0xFF4F535E),
                      fontWeight: FontWeight.w400,
                    )),
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
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -2),
                leading: Image.asset(
                  'assets/images/help_center.png',
                  height: 17,
                ),
                title: Text('Help Center',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: const Color(0xFF4F535E),
                      fontWeight: FontWeight.w400,
                    )),
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
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -2),
                leading: Image.asset(
                  'assets/images/logout.png',
                  height: 15,
                ),
                title: Text('Logout',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: const Color(0xFF4F535E),
                      fontWeight: FontWeight.w400,
                    )),
                onTap: () async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.clear();
                  Get.toNamed(MyRouters.loginScreen);
                },
              ),
            ],
          ),
        );
      }),
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0,
        titleSpacing: 20,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          Obx(() {
            return Row(
              children: [
                const Text(
                  ' Delivey Mode  ',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      color: Color(0xFF303C5E)),
                ),

                FlutterSwitch(
                  height: AddSize.size20,
                  width: AddSize.size40,
                  activeColor: AppTheme.primaryColor,
                  toggleSize: AddSize.size5 * 2.5,
                  value: controller.isDataLoading.value
                      ? (controller.model.value.data!.deliveryMode ?? false)
                      : _store.value,
                  onToggle: (val) {
                    deliveryModeUpdateRepo().then((value) {
                      if (value.status == true) {
                        controller.getData();
                        print(val);
                        controller.model.value.data!.deliveryMode = val;
                        if (controller.model.value.data!.deliveryMode == true) {
                          NewHelper.showToast("Delivery mode on");
                        } else {
                          NewHelper.showToast("Delivery mode off");
                        }
                      }
                    });
                  },
                ),
                SizedBox(
                  width: width * .020,
                )
              ],
            );
          })
        ],
        leading: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 6),
                 child : Obx(() {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        imageUrl: controller1.isDataLoading.value
                            ? ( controller1
                            .model.value.data!.profileImage).toString()
                            : '',
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height*.050,
                        width: 40,
                        errorWidget: (_, __, ___) => Image.asset(
                          'assets/images/user_img.png',
                          fit: BoxFit.contain,
                          height: 30,
                          width: 30,
                        ),
                        placeholder: (_, __) => const SizedBox(),
                      ),
                    );
                  })
              ),
            ),
          ],
        ),
        // leadingWidth: AddSize.size40 * ,
        title: const Text(
          'Dashbord',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 17,
              color: Color(0xFF1A2E33)),
        ),
      ),
      body: Obx(() {
        return controller.isDataLoading.value && controller1.isDataLoading.value
            ? SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, ${controller.model.value.data!.username.toString()}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Color(0xFF303C5E)),
                      ),
                      addHeight(7.0),
                      const Text(
                        'Riders/Drivers that have delivery mode set to on for at least 4 hours a day and at least 5 days a week (and did not reject any order) will get 10% boost on next week earnings',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Color(0xFF303C5E)),
                      ),
                      addHeight(25.0),

                      FittedBox(
                        child: Wrap(children: List.generate(controller.model.value.data!.weekData!.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                            child: Column(

                              children: [
                                Container(
                                  height: 28,
                                  width:  28,

                                  decoration:
                                  BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(4.0),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade300,
                                        offset: const Offset(
                                          .1,
                                          .1,
                                        ),
                                        blurRadius: 19.0,
                                        spreadRadius: 1.0,
                                      ),
                                    ],
                                  ),

                                  child: Theme(
                                    data: ThemeData(
                                        unselectedWidgetColor: Colors.transparent
                                    ),
                                    child: Checkbox(

                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(2)
                                      ),
                                      value: controller.model.value.data != null ? controller.model.value.data!.weekData![index]:false,
                                      checkColor: Colors.white,
                                      activeColor: const Color(0xff7ED957),
                                      onChanged: (bool? value){
                                      },

                                    ),
                                  ),
                                ),

                              ],
                            ),
                          );
                        })),
                      ),
                      Wrap(children: List.generate(days.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 16),
                          child: Column(

                            children: [
                               Text(
                                days[index].toString(),
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF303C5E)),
                              )

                            ],
                          ),
                        );
                      })),

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
                                      color: const Color(0xFF5F5F5F)
                                          .withOpacity(0.10),
                                      offset: const Offset(0.0, 0.5),
                                      blurRadius: 5,
                                    ),
                                  ]),
                              child: Stack(
                                children: [
                                  Positioned(
                                      right: 0,
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'assets/images/Group 362.png',
                                            height: 98,
                                          )
                                        ],
                                      )),
                                  Positioned(
                                      bottom: 10,
                                      left: 10,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.model.value.data!
                                                .deliveredOrders
                                                .toString(),
                                            style: const TextStyle(
                                                color: Color(0xFF7ED957),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 21),
                                          ),
                                          const Text(
                                            'Delivered',
                                            style: TextStyle(
                                                color: Color(0xFF393E50),
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14),
                                          )
                                        ],
                                      )),
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
                                      color: const Color(0xFF5F5F5F)
                                          .withOpacity(0.10),
                                      offset: const Offset(0.0, 0.5),
                                      blurRadius: 5,
                                    ),
                                  ]),
                              child: Stack(
                                children: [
                                  Positioned(
                                      right: 0,
                                      child: Image.asset(
                                        'assets/images/Group 363.png',
                                        height: 98,
                                      )),
                                  Positioned(
                                      bottom: 10,
                                      left: 10,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children:  [
                                          Text( '€ ${controller1.model.value.data!.earnedBalance.toString()}',
                                            style: const TextStyle(
                                                color: Color(0xFFFF980E),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 21),
                                          ),
                                          const Text(
                                            'Earnings',
                                            style: TextStyle(
                                                color: Color(0xFF393E50),
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14),
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      addHeight(15.0),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 16),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    const Color(0xFF5F5F5F).withOpacity(0.10),
                                offset: const Offset(0.0, 0.5),
                                blurRadius: 5,
                              ),
                            ]),
                        child:   Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Set Delivery Location",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff516670),
                                      fontSize: 14),
                                ), Text(
                                  '${controller1.valueRange.toString()} Km',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff516670),
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 40,
                              width: AddSize.screenWidth,
                              child: Row(
                                children: [
                                  SliderTheme(
                                    data: SliderTheme.of(context).copyWith(
                                      showValueIndicator: ShowValueIndicator.onlyForDiscrete,
                                      trackHeight: 8.0,
                                      trackShape: RoundedRectSliderTrackShape(),
                                      activeTrackColor: Color(0xff6CD241),
                                      inactiveTrackColor: Color(0xFF7ED957).withOpacity(0.12),
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
                                        max: 15.0,
                                        autofocus: true,
                                        value: double.parse(controller1.valueRange.toString()),
                                        divisions: 14,
                                        label: '${controller1.valueRange.round()} Km',
                                        onChangeEnd: (value) {
                                          setState(() {
                                            controller1.valueRange = value;
                                            value1 = value.toInt();
                                            print("Delivery Rang iss ${value1}");
                                          });
                                          setDeliveryLocationRepo(
                                            deliveryRange: value1,
                                            context: context,
                                          ).then((value) async {
                                            if (value.status == true) {
                                              NewHelper.showToast(value.message);
                                            }
                                          });
                                        }, onChanged: (double value) {  },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ),
                      addHeight(16.0),
                      Text(
                        'New Delivery Request',
                        style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: const Color(0xFF303C5E)),
                      ),
                      addHeight(12.0),

                      Obx(() {
                        return controller.model.value.data!.list!.isNotEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    controller.model.value.data!.list!.length,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  var item =
                                      controller.model.value.data!.list![index];
                                  return Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color(0xFF5F5F5F)
                                                  .withOpacity(0.10),
                                              offset: const Offset(0.0, 0.5),
                                              blurRadius: 5,
                                            ),
                                          ],
                                        ),
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15,
                                                      vertical: 15),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Image.asset(
                                                    'assets/images/calender_Img.png',
                                                    height: 18,
                                                  ),
                                                  addWidth(20),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '#${item.orderId.toString()}',
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize: 14,
                                                            color: Color(
                                                                0xFF303C5E)),
                                                      ),
                                                      addHeight(4),
                                                      Text(
                                                        item.date.toString(),
                                                        style: GoogleFonts.raleway(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 15,
                                                            color: const Color(
                                                                0xFF303C5E)),
                                                      ),
                                                      addHeight(25),
                                                      Row(
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              assignedOrder(
                                                                      orderId: item
                                                                          .orderId.toString(),
                                                                      status:
                                                                          "accept",
                                                                      context:
                                                                          context)
                                                                  .then(
                                                                      (value) {
                                                                if (value
                                                                        .status ==
                                                                    true) {
                                                                  controller
                                                                      .getData();
                                                                  assignedController
                                                                      .getOrderData1();
                                                                  Get.offAllNamed(
                                                                      MyRouters
                                                                          .assignedOrderScreen);
                                                                }
                                                              });
                                                            },
                                                            child: Container(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      25,
                                                                  vertical: 6),
                                                              decoration: BoxDecoration(
                                                                  color: const Color(
                                                                      0xFF7ED957),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6)),
                                                              child: Text(
                                                                'Accept'
                                                                    .toUpperCase(),
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize:
                                                                        13,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                          ),
                                                          addWidth(16),
                                                          InkWell(
                                                            onTap: () {
                                                              assignedOrder(
                                                                      orderId: item
                                                                          .orderId,
                                                                      status:
                                                                          "decline",
                                                                      context:
                                                                          context)
                                                                  .then(
                                                                      (value) {
                                                                if (value
                                                                        .status ==
                                                                    true) {
                                                                  assignedController
                                                                      .getOrderData1();
                                                                  Get.offAllNamed(
                                                                      MyRouters
                                                                          .orderDeclineScreen);
                                                                }
                                                              });
                                                            },
                                                            child: Container(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      25,
                                                                  vertical: 6),
                                                              decoration: BoxDecoration(
                                                                  color: const Color(
                                                                      0xFFF04148),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6)),
                                                              child: Text(
                                                                'Decline'
                                                                    .toUpperCase(),
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize:
                                                                        13,
                                                                    color: Colors
                                                                        .white),
                                                              ),
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
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 12,
                                                          vertical: 4),
                                                      decoration: BoxDecoration(
                                                          color: const Color(
                                                              0xFF7ED957),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6)),
                                                      child: Text(
                                                        item.paymentMethod
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 10,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                    addWidth(8.0),
                                                    Text(
                                                      '\$ ${item.orderTotal.toString()}',
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xFF7ED957)),
                                                    ),
                                                  ],
                                                ))
                                          ],
                                        ),
                                      ),
                                      addHeight(15),
                                    ],
                                  );
                                },
                              )
                            : Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: AddSize.padding20 * 2.8,
                                    vertical: AddSize.padding22),
                                child: SizedBox(
                                    height: AddSize.size20,
                                    child: Text(
                                      "Delivery Request Not Available",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(
                                              color: AppTheme.blackcolor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: AddSize.font14),
                                    )),
                              );
                      }),
                    ],
                  ),
                ),
              )
            : const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
