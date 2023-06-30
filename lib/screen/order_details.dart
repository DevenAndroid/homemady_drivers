import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homemady_drivers/routers/routers.dart';
import 'package:homemady_drivers/widgets/custome_size.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/location_controller.dart';
import '../widgets/app_assets.dart';
import '../widgets/app_theme.dart';
import '../widgets/custome_textfiled.dart';
import '../widgets/dimenestion.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DriverDeliveryOrderDetails extends StatefulWidget {
  const DriverDeliveryOrderDetails({Key? key}) : super(key: key);
  static var driverDeliveryOrderDetails = "/driverDeliveryOrderDetails";
  @override
  _DriverDeliveryOrderDetailsState createState() =>
      _DriverDeliveryOrderDetailsState();
}

class _DriverDeliveryOrderDetailsState extends State<DriverDeliveryOrderDetails>
    with SingleTickerProviderStateMixin {
  final locationController = Get.put(LocationController());
  bool value = false;
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  Future<void> openMap(double latitude, double longitude) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  _makingPhoneCall(call) async {
    var url = Uri.parse(call);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Scaffold(
        appBar: backAppBar(title: "Delivery Details", context: context),
        body:NestedScrollView(
          headerSliverBuilder: (_, __) {
            return [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AddSize.padding16,
                      vertical: AddSize.padding10),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          addHeight(20),
                          Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    offset: const Offset(.1, .1,
                                    ),
                                    blurRadius: 20.0,
                                    spreadRadius: 1.0,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: AddSize.padding15,
                                    vertical: AddSize.padding15),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const ImageIcon(
                                                AssetImage(
                                                    AppAssets.orderList),
                                                color: AppTheme.primaryColor,
                                                size: 20,
                                              ),
                                              SizedBox(
                                                width: AddSize.size15,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Order ID: #258147',
                                                    style: TextStyle(
                                                        color: AppTheme
                                                            .primaryColor,
                                                        fontSize:
                                                        AddSize.font16,
                                                        fontWeight:
                                                        FontWeight.w500),
                                                  ),
                                                  Text(
                                                    'Monday, 2 June, 2021',
                                                    style: TextStyle(
                                                        color: AppTheme
                                                            .blackcolor,
                                                        fontSize:
                                                        AddSize.font12,
                                                        fontWeight:
                                                        FontWeight.w400),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ]),
                                    SizedBox(
                                      height: height * .02,
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                      const NeverScrollableScrollPhysics(),
                                      itemCount: 3,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Meat Pasta ',style: GoogleFonts.raleway(
                                                      color: const Color(0xFF303C5E),
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 16,
                                                    ),),
                                                    const Text('5Kg * 3 ',
                                                      style: TextStyle(
                                                      color:  Color(0xFF303C5E),
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 14,
                                                    ),),
                                                  ],
                                                ),
                                               const Text('€18.00',
                                                  style: TextStyle(
                                                  color:  Color(0xFF7ED957),
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 17,
                                                ),)
                                              ],
                                            ),
                                            SizedBox(
                                              height: height * .005,
                                            ),
                                            index != 2
                                                ? const Divider()
                                                : const SizedBox(),
                                            SizedBox(
                                              height: height * .005,
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              )),
                          Positioned(
                              top: 10,
                              right: 10,
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(
                                          8),
                                      color:
                                      AppTheme.primaryColor),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * .04,
                                        vertical: height * .005),
                                    child: Text(
                                      'Pickup',
                                      style: TextStyle(
                                          fontSize:
                                          AddSize.font14,
                                          color: AppTheme
                                              .backgroundcolor,
                                          fontWeight:
                                          FontWeight.w500),
                                    ),
                                  )))
                        ],
                      ),
                      SizedBox(
                        height: AddSize.size14,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              offset: const Offset(.1, .1,
                              ),
                              blurRadius: 20.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                        ),
                        child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * .0001),
                              child: TabBar(
                                physics: const BouncingScrollPhysics(),
                                unselectedLabelColor: AppTheme.blackcolor,
                                labelColor: AppTheme.backgroundcolor,
                                tabs: const [
                                  Tab(
                                    child: Text(
                                      "Customer Detail",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      "Home Cook Information",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                                labelStyle: const TextStyle(
                                    color: AppTheme.blackcolor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                                unselectedLabelStyle: const TextStyle(
                                    color: AppTheme.blackcolor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                                controller: tabController,
                                indicatorSize: TabBarIndicatorSize.tab,
                                indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: AppTheme.primaryColor,
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            physics: const BouncingScrollPhysics(),
            controller: tabController,
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AddSize.padding16,
                  ),
                  child: Column(
                    children: [
                      Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 0,
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                                child: GoogleMap(
                                  initialCameraPosition: CameraPosition(
                                    target: LatLng(
                                      double.parse(locationController.lat.value == '' ? "0" : locationController.lat.value),
                                      double.parse(locationController.long.value == '' ? "0" : locationController.long.value),
                                    ),
                                    zoom: 15,
                                  ),
                                  gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                                    Factory<OneSequenceGestureRecognizer>(
                                          () => EagerGestureRecognizer(),
                                    ),
                                  },
                                ),
                              ),
                              addHeight(15),
                              Image.asset('assets/images/Rectangle 4143.png'),
                              addHeight(30),
                                CommonButton(title: 'Save',onPressed: (){
                                 Get.toNamed(MyRouters.orderAccept);
                               },)
                            ],
                          )),
                      // paymentDetails(
                      //   subTotal: myOrderDetailsController
                      //       .model.value.data!.itemTotal
                      //       .toString(),
                      //   // tax: myOrderDetailsController
                      //   //     .model.value.data!.tax
                      //   //     .toString(),
                      //   delivery: myOrderDetailsController
                      //       .model.value.data!.deliveryCharges
                      //       .toString(),
                      //   // packing: myOrderDetailsController
                      //   //     .model.value.data!.packingFee
                      //   //     .toString(),
                      //   orderType: myOrderDetailsController
                      //       .model.value.data!.orderType
                      //       .toString(),
                      //   total: myOrderDetailsController
                      //       .model.value.data!.grandTotal
                      //       .toString(),
                      // )
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AddSize.padding16),
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  offset: const Offset(.1, .1,
                                  ),
                                  blurRadius: 20.0,
                                  spreadRadius: 1.0,
                                ),
                              ],
                            ),
                            child: Column(
                             children: [
                               Card(
                                 elevation: 0,
                                 color: AppTheme.backgroundcolor,
                                 shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(10)),
                                 child: Padding(
                                   padding: EdgeInsets.symmetric(
                                       horizontal: AddSize.padding15,
                                       vertical: AddSize.padding15),
                                   child: Row(
                                     mainAxisAlignment:
                                     MainAxisAlignment.spaceBetween,
                                     children: [
                                       Row(children: [
                                         Column(
                                           crossAxisAlignment:
                                           CrossAxisAlignment.start,
                                           children: [
                                             const Text(
                                               "Store Name",
                                               style: TextStyle(
                                                   color:
                                                   AppTheme.lightblack,
                                                   fontWeight:
                                                   FontWeight.w500,
                                                   fontSize: 14),
                                             ),
                                             Text(
                                               'Store abcd@3125A#',
                                               style: GoogleFonts.raleway(
                                                   color: const Color(0xFF303C5E),
                                                   fontWeight:
                                                   FontWeight.w700,
                                                   fontSize: 16),
                                             ),
                                           ],
                                         ),
                                       ]),
                                       Container(
                                         height: AddSize.size45,
                                         width: AddSize.size45,
                                         decoration: const ShapeDecoration(
                                             color: Color(0xFFFF980E),
                                             shape: CircleBorder()),
                                         child: Center(
                                             child: Image(
                                               image: const AssetImage(
                                                   AppAssets.store1Icon),
                                               height: AddSize.size20,
                                               width: AddSize.size20,
                                             )),
                                       ),
                                     ],
                                   ),
                                 ),
                               ),
                              const Divider(color: Color(0xFFEFEFEF),height: 1,thickness: 1,),
                               Card(
                                 elevation: 0,
                                 color: AppTheme.backgroundcolor,
                                 shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(10)),
                                 child: Padding(
                                   padding: EdgeInsets.symmetric(
                                       horizontal: AddSize.padding15,
                                       vertical: AddSize.padding15),
                                   child:
                                   Row(
                                     mainAxisAlignment:
                                     MainAxisAlignment.spaceBetween,
                                     children: [
                                       Row(children: [
                                         Column(
                                           crossAxisAlignment:
                                           CrossAxisAlignment.start,
                                           children: [
                                             const Text(
                                               "store phone no",
                                               style: TextStyle(
                                                   color:
                                                   AppTheme.lightblack,
                                                   fontWeight:
                                                   FontWeight.w500,
                                                   fontSize: 14),
                                             ),
                                             Text(
                                               '+91 9876454321',
                                               style: GoogleFonts.raleway(
                                                   color: const Color(0xFF303C5E),
                                                   fontWeight:
                                                   FontWeight.w700,
                                                   fontSize: 16),
                                             ),
                                           ],
                                         ),
                                       ]),
                                       GestureDetector(
                                         onTap: (){
                                           _makingPhoneCall("tel:+91");
                                         },
                                         child: Container(
                                             height: AddSize.size45,
                                             width: AddSize.size45,
                                             decoration: const ShapeDecoration(
                                                 color: AppTheme.primaryColor,
                                                 shape: CircleBorder()),
                                             child: const Center(
                                                 child: Icon(
                                                   Icons.phone,
                                                   color: Colors.white,
                                                   // color: AppTheme.callPhoneColor,
                                                 ))),
                                       ),
                                     ],
                                   ),
                                 ),
                               ),
                               const Divider(color: Color(0xFFEFEFEF),height: 1,thickness: 1,),
                               Card(
                                 elevation: 0,
                                 color: AppTheme.backgroundcolor,
                                 shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(10)),
                                 child: Padding(
                                   padding: EdgeInsets.symmetric(
                                       horizontal: AddSize.padding15,
                                       vertical: AddSize.padding15),
                                   child:
                                   Row(
                                     mainAxisAlignment:
                                     MainAxisAlignment.spaceBetween,
                                     children: [
                                       Row(children: [
                                         Column(
                                           crossAxisAlignment:
                                           CrossAxisAlignment.start,
                                           children: [
                                             const Text(
                                               "store address",
                                               style: TextStyle(
                                                   color:
                                                   AppTheme.lightblack,
                                                   fontWeight:
                                                   FontWeight.w500,
                                                   fontSize: 14),
                                             ),
                                             Text(
                                               'Douglas, Cork, T16 XN73, uk',
                                               style: GoogleFonts.raleway(
                                                   color: const Color(0xFF303C5E),
                                                   fontWeight:
                                                   FontWeight.w700,
                                                   fontSize: 16),
                                             ),
                                           ],
                                         ),
                                       ]),
                                       GestureDetector(
                                         onTap: (){
                                           // openMap();
                                         },
                                         child: Container(
                                           height: AddSize.size45,
                                           width: AddSize.size45,
                                           decoration: const ShapeDecoration(
                                               color: AppTheme.lightYellow,
                                               shape: CircleBorder()),
                                           child: const Center(
                                               child: Icon(
                                                 Icons.location_on,
                                                 color: AppTheme.backgroundcolor,
                                               )),
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),
                               ),
                             ],
                            ),
                          ),

                       addHeight(15),
                       Container(
                         padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                         decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(8),
                             boxShadow: [
                               BoxShadow(
                                 color: Colors.grey.shade300,
                                 offset: const Offset(.1, .1,
                                 ),
                                 blurRadius: 20.0,
                                 spreadRadius: 1.0,
                               ),
                             ],
                         ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const[
                               Text(
                                "Subtotal:",
                                style: TextStyle(
                                      color: Color(0xFF293044),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              Text(
                                "€50.00",
                                style: TextStyle(
                                      color: Color(0xFF797F90),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ),
                            ],
                          ),
                       )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        )
    );
  }

  orderList(name, price, qty) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  name,
                  style: TextStyle(
                      fontSize: AddSize.font16,
                      color: AppTheme.blackcolor,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                "₹$price",
                style: TextStyle(
                    fontSize: AddSize.font16,
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        SizedBox(
          height: height * .01,
        ),
        Row(
          children: [
            Text(
              qty,
              style: TextStyle(
                  fontSize: AddSize.font14,
                  color: AppTheme.lightblack,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              width: width * .01,
            ),
            const Text("*"),
            SizedBox(
              width: width * .01,
            ),

          ],
        ),
      ],
    );
  }

  paymentDetails({
    required subTotal,

    required delivery,

    required total,
    required orderType,
  }) {
    return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AddSize.padding15, vertical: AddSize.padding15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                details("Subtotal:", "₹$subTotal"),
                SizedBox(
                  height: AddSize.size5,
                ),
                details("Delivery charges:", "₹$delivery"),
                SizedBox(
                  height: AddSize.size5,
                ),
                // details("Packing charges:", "₹$packing"),
                SizedBox(
                  height: AddSize.size5,
                ),
                // myOrderDetailsController
                //     .model.value.data!.tax !=0 ?
                // Column(children: [
                //   details("Tax & fee:",
                //       "₹${myOrderDetailsController
                //           .model.value.data!.tax ?? ""}"),
                //   SizedBox(
                //     height: AddSize.size5,
                //   ),
                // ],):const SizedBox(),
                // myOrderDetailsController
                //     .model.value.data!.tax1 !=null ?
                // Column(children: [
                //   details("${myOrderDetailsController
                //       .model.value.data!.tax1!.type ?? ""}:",
                //       "₹${myOrderDetailsController
                //           .model.value.data!.tax1!.amount ?? ""}"),
                //   SizedBox(
                //     height: AddSize.size5,
                //   ),
                // ],):const SizedBox(),
                // myOrderDetailsController
                //     .model.value.data!.tax2 !=null ?
                // Column(children: [
                //   details("${myOrderDetailsController
                //       .model.value.data!.tax2!.type ?? ""}:",
                //       "₹${myOrderDetailsController
                //           .model.value.data!.tax2!.amount ?? ""}"),
                //   SizedBox(
                //     height: AddSize.size10,
                //   ),
                // ],):const SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total:",
                        style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontSize: AddSize.font16,
                            fontWeight: FontWeight.w500)),
                    Text("₹$total",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: AddSize.font14,
                            fontWeight: FontWeight.w500))
                  ],
                ),
                SizedBox(
                  height: AddSize.size5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          // Get.toNamed(MyRouter.editProfileScreen);
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(AddSize.size50, AddSize.size30),
                          primary: AppTheme.primaryColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                        ),
                        child: Text(
                          orderType,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                              color: AppTheme.backgroundcolor,
                              fontWeight: FontWeight.w500,
                              fontSize: AddSize.font14),
                        )),
                  ],
                )
              ],
            )));
  }

  details(title, price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(
                color: AppTheme.blackcolor,
                fontSize: AddSize.font16,
                fontWeight: FontWeight.w500)),
        Text(price,
            style: TextStyle(
                color: Colors.grey,
                fontSize: AddSize.font14,
                fontWeight: FontWeight.w500))
      ],
    );
  }
}