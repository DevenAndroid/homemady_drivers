import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/assigned_Orderlist_controller.dart';
import '../controller/assigned_order_controller.dart';
import '../controller/deshborad_controoler.dart';
import '../controller/order_details_controller.dart';
import '../repository/delivery_mode_update_repo.dart';
import '../routers/routers.dart';
import '../widgets/app_theme.dart';
import '../widgets/custome_size.dart';
import '../widgets/dimenestion.dart';
import '../widgets/new_helper.dart';


class AssignedOrderScreen extends StatefulWidget {
  const AssignedOrderScreen({Key? key}) : super(key: key);

  @override
  State<AssignedOrderScreen> createState() => _AssignedOrderScreenState();
}

class _AssignedOrderScreenState extends State<AssignedOrderScreen> {
  bool state = true;
  final RxBool _store = false.obs;
  final controller = Get.put(DeshBoradController());
  String dropdownvalue = 'All Orders';
  final assignedController = Get.put(AssignedOrderController());
  final orderController = Get.put(MyOrderDetailsController());
  @override
  void initState() {
    super.initState();
    // SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) {
    // });
    print("ggggggggggggggggggggggggggggggggggggggggggggggggggggggg");
    assignedController.getOrderData1();
  }
  String? selectedTime;
  final List<String> dropDownTimeList = ["Pending", "Completed", "Decline"];
  var items = [
    'All Orders',
    'Pending',
    'Completed',
    'Decline',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0,
        titleSpacing: 30,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.black,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: GestureDetector(onTap: () {
            Get.back();
          }, child: const Icon(Icons.arrow_back_rounded, color: Colors.black,)),
        ),
        actions: [
          Obx(() {
            return Row(
              children: [
                const Text(' Delivey Mode  ', style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    color: Color(0xFF303C5E)
                ),
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
                        }
                        else {
                          NewHelper.showToast("Delivery mode off");
                        }
                      }
                    });
                  },
                ),
              ],
            );
          })
        ],
        leadingWidth: AddSize.size40 * 0.9,
        title: const Text('Assigned Order', style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17,
            color: Color(0xFF1A2E33)
        ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(11.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Assigned Delivery',
                  style: GoogleFonts.raleway(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF303C5E)
                  ),),
                Container(
                  height: 31,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: const Color(0xFFEEEEEE))
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isDense: true,
                      isExpanded: false,
                      style: const TextStyle(
                        color: Color(0xFF697164),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      value: dropdownvalue,
                      icon: const Icon(Icons.keyboard_arrow_down,
                        color: Color(0xFF000000),),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
            addHeight(12.0),
            Obx(() {
              return assignedController.isDataLoading.value
                  ? assignedController.model.value.data!.isNotEmpty ?
                   Padding(
                padding: const EdgeInsets.all(11.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: assignedController.model.value.data!.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        orderController.id.value =
                            assignedController
                                .model.value.data![index].orderId
                                .toString();
                        Get.toNamed(MyRouters
                            .driverDeliveryOrderDetails);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 15),
                                  child:
                                  Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Image.asset(
                                            'assets/images/calender_Img.png',
                                            height: 18,),
                                          addWidth(20),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [
                                              Text('Date:',
                                                style: GoogleFonts.raleway(
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 14,
                                                    color: const Color(0xFF303C5E)
                                                ),),
                                              addHeight(4),
                                              Text(assignedController.model.value.data![index].date.toString(),
                                                style: GoogleFonts.raleway(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 15,
                                                    color: const Color(0xFF303C5E)
                                                ),),
                                            ],
                                          ),
                                        ],
                                      ),
                                      addHeight(15),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Image.asset('assets/images/orderid.png',
                                            height: 18,),
                                          addWidth(20),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [
                                              Text('Order ID:',
                                                style: GoogleFonts.raleway(
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 14,
                                                    color: const Color(0xFF303C5E)
                                                ),),
                                              addHeight(4),
                                              Text('# ${assignedController.model.value.data![index].orderId.toString()}',
                                                style: GoogleFonts.raleway(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 15,
                                                    color: const Color(0xFF303C5E)
                                                ),),
                                            ],
                                          ),
                                        ],
                                      ),
                                      addHeight(15),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Image.asset(
                                            'assets/images/locationiconn.png',
                                            height: 18,),
                                          addWidth(20),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text('Location:',
                                                  style: GoogleFonts.raleway(
                                                      fontWeight: FontWeight.w800,
                                                      fontSize: 14,
                                                      color: const Color(0xFF303C5E)
                                                  ),),
                                                addHeight(4),

                                                Text(
                                                  assignedController.model.value.data![index].location!.location.toString(),
                                                  style: GoogleFonts.raleway(
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 15,
                                                      color: const Color(0xFF303C5E)
                                                  ),),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      addHeight(10),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 36, vertical: 10),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                // Get.toNamed(MyRouters
                                                //     .driverDeliveryOrderDetails);
                                              },
                                              child: Container(
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    horizontal: 25, vertical: 6),
                                                decoration: BoxDecoration(
                                                    color: const Color(
                                                        0xFF7ED957),
                                                    borderRadius: BorderRadius
                                                        .circular(6)
                                                ),
                                                child: Text(
                                                  'pickup'.toUpperCase(),
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 13,
                                                      color: Colors.white
                                                  ),),
                                              ),
                                            ),
                                          ],
                                        ),
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 4),
                                          decoration: BoxDecoration(
                                              color: const Color(0xFF7ED957),
                                              borderRadius: BorderRadius.circular(
                                                  6)
                                          ),
                                          child: Text(assignedController.model.value.data![index].paymentMethod.toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 10,
                                                color: Colors.white
                                            ),),
                                        ),
                                        addWidth(8.0),
                                         Text('\$ ${assignedController.model.value.data![index].orderTotal.toString()}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14,
                                              color: Color(0xFF7ED957)
                                          ),),
                                      ],
                                    )
                                )
                              ],
                            ),
                          ),
                          addHeight(20),
                        ],
                      ),
                    );
                  },
                ),
              ): Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AddSize.padding20 * 5,
                    vertical: AddSize.padding20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Order not Available",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(
                            height: 1.5,
                            fontWeight: FontWeight.w500,
                            fontSize: AddSize.font14,
                            color: AppTheme.blackcolor)),
                  ],
                ),
              ):const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 200),
                    child: CircularProgressIndicator(),
                  ));
            }),
          ],
        ),
      ),
    );
  }
}
