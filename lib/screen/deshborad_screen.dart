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
import '../controller/assigned_order_controller.dart';
import '../controller/deshborad_controoler.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../controller/driver_information_controller.dart';
import '../controller/get_feedback_controller.dart';
import '../controller/mode_update_controller.dart';
import '../controller/userProfile_controller.dart';
import '../repository/assigned_order_repo.dart';
import '../repository/delivery_mode_update_repo.dart';
import '../repository/get_deshborad.dart';
import '../widgets/app_theme.dart';
import '../widgets/dimenestion.dart';

class DashbordScreen extends StatefulWidget {
  const DashbordScreen({Key? key}) : super(key: key);

  @override
  State<DashbordScreen> createState() => _DashbordScreenState();
}

class _DashbordScreenState extends State<DashbordScreen> {
  bool state = true;
  double _value = 1;
  int currentDrawer = 0;
  int value1 = 1;
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

  final RxBool _store = false.obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getData();
    controller1.getData();
    // assignedController.getOrderData();
    controllerFeedback.getData();
    controllerDriverId.getData();
    _store;
  }

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Obx(() {
        return Drawer(
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
                    )),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Obx(() {
                            return Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                color: Color(0xFF44B5AB),
                              ),
                              child: ClipOval(
                                child: CachedNetworkImage(
                                  width: 100,
                                  height: 100,
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.008,
                          ),
                          Text(controller1.model.value.data!.name.toString(),
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: const Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w600,
                              )),
                          FittedBox(
                            child: Text(
                                controller1.model.value.data!.email.toString(),
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: const Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                        ],
                      ),
                    )),
              ),
              ListTile(
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -2),
                leading: Image.asset(
                  'assets/images/dashboard_icon.png',
                  height: 15,
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
                  height: 15,
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
                  height: 15,
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
                  height: 15,
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
                  height: 15,
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
                  height: 15,
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
                  height: 15,
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
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -2),
                leading: Image.asset(
                  'assets/images/bx_wallet.png',
                  height: 15,
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
                  'assets/images/bx_wallet.png',
                  height: 15,
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
                  height: 15,
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
                  height: 15,
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
                // child: CupertinoSwitch(
                //     activeColor: const Color(0xFF7ED957),
                //     value: controller.isDataLoading.value
                //         ? (controller.model.value.data!.deliveryMode ?? false)
                //         : _store.value,
                //     onChanged: (val) {
                //       deshboradData().then((value) {
                //         if (value.status == true) {
                //           controller.getData();
                //           print(val);
                //           controller.model.value.data!.deliveryMode = val;
                //           if (controller.model.value.data!.deliveryMode ==
                //               true) {
                //             NewHelper.showToast("Delivery mode on");
                //           }
                //           else {
                //             NewHelper.showToast("Delivery mode off");
                //           }
                //         }
                //       });
                //     }
                // ),
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
                          'assets/images/Ellipse 67.png',
                          fit: BoxFit.cover,
                          height: 50,
                          width: 50,
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
        return controller.isDataLoading.value
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
                      // Wrap(
                      //   spacing: 10.0,
                      //   children: [
                      //     Column(
                      //       children: [
                      //         Transform.scale(
                      //           scale: 1.5,
                      //           child: Checkbox(
                      //               materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      //               side: BorderSide(color: Colors.grey.shade300,width: 1.4),
                      //               activeColor: Color(0xff7ED957),
                      //               shape: RoundedRectangleBorder(
                      //                   borderRadius:
                      //                   BorderRadius.circular(3)),
                      //               value: _isValue,
                      //               onChanged: (bool? value) {
                      //                 setState(() {
                      //                   _isValue = value;
                      //                 });
                      //               }),
                      //         ),
                      //        const Text('Su',style: TextStyle(
                      //           fontSize: 10,
                      //           fontWeight: FontWeight.w400,
                      //           color: Color(0xFF303C5E)
                      //         ),)
                      //       ],
                      //     ),
                      //     Column(
                      //       children: [
                      //         Transform.scale(
                      //           scale: 1.5,
                      //           child: Checkbox(
                      //               materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      //               side: BorderSide(color: Colors.grey.shade300,width: 1.4),
                      //               activeColor: Color(0xff7ED957),
                      //               shape: RoundedRectangleBorder(
                      //                   borderRadius:
                      //                   BorderRadius.circular(3)),
                      //               value: _isValue1,
                      //               onChanged: (bool? value) {
                      //                 setState(() {
                      //                   _isValue1 = value;
                      //                 });
                      //               }),
                      //         ),
                      //         const Text('Mo',style: TextStyle(
                      //             fontSize: 10,
                      //             fontWeight: FontWeight.w400,
                      //             color: Color(0xFF303C5E)
                      //         ),)
                      //       ],
                      //     ),
                      //     Column(
                      //       children: [
                      //         Transform.scale(
                      //           scale: 1.5,
                      //           child: Checkbox(
                      //               materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      //               side: BorderSide(color: Colors.grey.shade300,width: 1.4),
                      //               activeColor: Color(0xff7ED957),
                      //               shape: RoundedRectangleBorder(
                      //                   borderRadius:
                      //                   BorderRadius.circular(3)),
                      //               value: _isValue2,
                      //               onChanged: (bool? value) {
                      //                 setState(() {
                      //                   _isValue2 = value;
                      //                 });
                      //               }),
                      //         ),
                      //         const Text('Tu',style: TextStyle(
                      //             fontSize: 10,
                      //             fontWeight: FontWeight.w400,
                      //             color: Color(0xFF303C5E)
                      //         ),)
                      //       ],
                      //     ),
                      //     Column(
                      //       children: [
                      //         Transform.scale(
                      //           scale: 1.5,
                      //           child: Checkbox(
                      //               materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      //               side: BorderSide(color: Colors.grey.shade300,width: 1.4),
                      //               activeColor: Color(0xff7ED957),
                      //               shape: RoundedRectangleBorder(
                      //                   borderRadius:
                      //                   BorderRadius.circular(3)),
                      //               value: _isValue3,
                      //               onChanged: (bool? value) {
                      //                 setState(() {
                      //                   _isValue3 = value;
                      //                 });
                      //               }),
                      //         ),
                      //         const Text('We',style: TextStyle(
                      //             fontSize: 10,
                      //             fontWeight: FontWeight.w400,
                      //             color: Color(0xFF303C5E)
                      //         ),)
                      //       ],
                      //     ),
                      //     Column(
                      //       children: [
                      //         Transform.scale(
                      //           scale: 1.5,
                      //           child: Checkbox(
                      //               materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      //               side: BorderSide(color: Colors.grey.shade300,width: 1.4),
                      //               activeColor: Color(0xff7ED957),
                      //               shape: RoundedRectangleBorder(
                      //                   borderRadius:
                      //                   BorderRadius.circular(3)),
                      //               value: _isValue4,
                      //               onChanged: (bool? value) {
                      //                 setState(() {
                      //                   _isValue4 = value;
                      //                 });
                      //               }),
                      //         ),
                      //         const Text('Th',style: TextStyle(
                      //             fontSize: 10,
                      //             fontWeight: FontWeight.w400,
                      //             color: Color(0xFF303C5E)
                      //         ),)
                      //       ],
                      //     ),
                      //     Column(
                      //       children: [
                      //         Transform.scale(
                      //           scale: 1.5,
                      //           child: Checkbox(
                      //               materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      //               side: BorderSide(color: Colors.grey.shade300,width: 1.4),
                      //               activeColor: Color(0xff7ED957),
                      //               shape: RoundedRectangleBorder(
                      //                   borderRadius:
                      //                   BorderRadius.circular(3)),
                      //               value: _isValue5,
                      //               onChanged: (bool? value) {
                      //                 setState(() {
                      //                   _isValue5 = value;
                      //                 });
                      //               }),
                      //         ),
                      //         const Text('Fr',style: TextStyle(
                      //             fontSize: 10,
                      //             fontWeight: FontWeight.w400,
                      //             color: Color(0xFF303C5E)
                      //         ),)
                      //       ],
                      //     ),
                      //     Column(
                      //       children: [
                      //         Transform.scale(
                      //           scale: 1.5,
                      //           child: Checkbox(
                      //               materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      //               side: BorderSide(color: Colors.grey.shade300,width: 1.4),
                      //               activeColor: Color(0xff7ED957),
                      //               shape: RoundedRectangleBorder(
                      //                   borderRadius:
                      //                   BorderRadius.circular(3)),
                      //               value: _isValue6,
                      //               onChanged: (bool? value) {
                      //                 setState(() {
                      //                   _isValue6 = value;
                      //                 });
                      //               }),
                      //         ),
                      //         const Text('Sa',style: TextStyle(
                      //             fontSize: 10,
                      //             fontWeight: FontWeight.w400,
                      //             color: Color(0xFF303C5E)
                      //         ),)
                      //       ],
                      //     ),
                      //   ],
                      // ),
                      Obx(() {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    isSelect.value = !isSelect.value;
                                  },
                                  child: Container(
                                    height: 28,
                                    width: 28,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    decoration: isSelect.value == true
                                        ? BoxDecoration(
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
                                          )
                                        : BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            color: const Color(0xFF7ED957),
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
                                    child: Center(
                                      child: isSelect.value == true
                                          ? const SizedBox()
                                          : Image.asset(
                                              'assets/images/checkbox.png'),
                                    ),
                                  ),
                                ),
                                addHeight(5),
                                const Text(
                                  'Su',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF303C5E)),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    isSelect1.value = !isSelect1.value;
                                  },
                                  child: Container(
                                    height: 28,
                                    width: 28,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    decoration: isSelect1.value == true
                                        ? BoxDecoration(
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
                                          )
                                        : BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            color: const Color(0xFF7ED957),
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
                                    child: Center(
                                      child: isSelect1.value == true
                                          ? const SizedBox()
                                          : Image.asset(
                                              'assets/images/checkbox.png'),
                                    ),
                                  ),
                                ),
                                addHeight(5),
                                const Text(
                                  'Mo',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF303C5E)),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    isSelect2.value = !isSelect2.value;
                                  },
                                  child: Container(
                                    height: 28,
                                    width: 28,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    decoration: isSelect2.value == true
                                        ? BoxDecoration(
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
                                          )
                                        : BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            color: const Color(0xFF7ED957),
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
                                    child: Center(
                                      child: isSelect2.value == true
                                          ? const SizedBox()
                                          : Image.asset(
                                              'assets/images/checkbox.png'),
                                    ),
                                  ),
                                ),
                                addHeight(5),
                                const Text(
                                  'Tu',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF303C5E)),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    isSelect3.value = !isSelect3.value;
                                  },
                                  child: Container(
                                    height: 28,
                                    width: 28,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    decoration: isSelect3.value == true
                                        ? BoxDecoration(
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
                                          )
                                        : BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            color: const Color(0xFF7ED957),
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
                                    child: Center(
                                      child: isSelect3.value == true
                                          ? const SizedBox()
                                          : Image.asset(
                                              'assets/images/checkbox.png'),
                                    ),
                                  ),
                                ),
                                addHeight(5),
                                const Text(
                                  'We',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF303C5E)),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    isSelect4.value = !isSelect4.value;
                                  },
                                  child: Container(
                                    height: 28,
                                    width: 28,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    decoration: isSelect4.value == true
                                        ? BoxDecoration(
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
                                          )
                                        : BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            color: const Color(0xFF7ED957),
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
                                    child: Center(
                                      child: isSelect4.value == true
                                          ? const SizedBox()
                                          : Image.asset(
                                              'assets/images/checkbox.png'),
                                    ),
                                  ),
                                ),
                                addHeight(5),
                                const Text(
                                  'Th',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF303C5E)),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    isSelect5.value = !isSelect5.value;
                                  },
                                  child: Container(
                                    height: 28,
                                    width: 28,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    decoration: isSelect5.value == true
                                        ? BoxDecoration(
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
                                          )
                                        : BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            color: const Color(0xFF7ED957),
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
                                    child: Center(
                                      child: isSelect5.value == true
                                          ? const SizedBox()
                                          : Image.asset(
                                              'assets/images/checkbox.png'),
                                    ),
                                  ),
                                ),
                                addHeight(5),
                                const Text(
                                  'Fr',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF303C5E)),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    isSelect6.value = !isSelect6.value;
                                  },
                                  child: Container(
                                    height: 28,
                                    width: 28,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    decoration: isSelect6.value == true
                                        ? BoxDecoration(
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
                                          )
                                        : BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            color: const Color(0xFF7ED957),
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
                                    child: Center(
                                      child: isSelect6.value == true
                                          ? const SizedBox()
                                          : Image.asset(
                                              'assets/images/checkbox.png'),
                                    ),
                                  ),
                                ),
                                addHeight(5),
                                const Text(
                                  'Sa',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF303C5E)),
                                )
                              ],
                            ),
                          ],
                        );
                      }),
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
                                        children: const [
                                          Text(
                                            '\$0.0',
                                            style: TextStyle(
                                                color: Color(0xFFFF980E),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 21),
                                          ),
                                          Text(
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
                                  '${value1} Km',
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
                                        min: 1.0,
                                        max: 15.0,
                                        autofocus: true,
                                        value: _value,
                                        divisions: 14,
                                        label: '${_value.round()} Km',
                                        onChanged: (value) {
                                          setState(() {
                                            _value = value;
                                            value1 = value.toInt();
                                            print("Delivery Rang iss ${value1}");
                                          });
                                        },
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
                                                                          .orderId,
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
