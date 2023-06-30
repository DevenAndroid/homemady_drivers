import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../routers/routers.dart';
import '../widgets/custome_size.dart';
import '../widgets/dimenestion.dart';


class AssignedOrderScreen extends StatefulWidget {
  const AssignedOrderScreen({Key? key}) : super(key: key);

  @override
  State<AssignedOrderScreen> createState() => _AssignedOrderScreenState();
}

class _AssignedOrderScreenState extends State<AssignedOrderScreen> {
  bool state = true;

  String dropdownvalue = 'All Orders';

  var items = [
    'All Orders',
    'Burger',
    'Pasta',
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
        leading: const Padding(
          padding: EdgeInsets.only(left: 8),
          child:  Icon(Icons.arrow_back_rounded,color: Colors.black,),
        ),
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
        title: const Text('Assigned Order', style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17,
            color:  Color(0xFF1A2E33)
        ),
        ),
      ),
      body: Column(
        children: [
           Padding(
             padding: const EdgeInsets.all(11.0),
             child: Row(
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
                   child:  DropdownButtonHideUnderline(
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
           ),
          addHeight(12.0),

          Padding(
            padding: const EdgeInsets.all(11.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF5F5F5F).withOpacity(0.4),
                            offset: Offset(0.0, 0.5),
                            blurRadius: 5,),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                            child:
                            Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset('assets/images/calender_Img.png',height: 18,),
                                    addWidth(20),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:  [
                                         Text('Date:',
                                          style:  GoogleFonts.raleway(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 14,
                                              color:  Color(0xFF303C5E)
                                          ),),
                                        addHeight(4),
                                        Text('Mon 2 June, 2021 – 10:30am',
                                          style: GoogleFonts.raleway(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              color:  Color(0xFF303C5E)
                                          ),),
                                      ],
                                    ),
                                  ],
                                ),
                                addHeight(15),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset('assets/images/orderid.png',height: 18,),
                                    addWidth(20),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:  [
                                        Text('Order ID:',
                                          style:  GoogleFonts.raleway(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 14,
                                              color:  Color(0xFF303C5E)
                                          ),),
                                        addHeight(4),
                                        Text('#258147963.',
                                          style: GoogleFonts.raleway(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              color:  Color(0xFF303C5E)
                                          ),),
                                      ],
                                    ),
                                  ],
                                ),
                                addHeight(15),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset('assets/images/locationiconn.png',height: 18,),
                                    addWidth(20),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:  [
                                        Text('Location:',
                                          style:  GoogleFonts.raleway(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 14,
                                              color:  Color(0xFF303C5E)
                                          ),),
                                        addHeight(4),

                                        Text('600 East Carpenter Freeway, Suite 246\nIrving, TX 75062',
                                          style: GoogleFonts.raleway(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              color:  Color(0xFF303C5E)
                                          ),),
                                      ],
                                    ),
                                  ],
                                ),
                              addHeight(10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 36,vertical: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          Get.toNamed(MyRouters.driverDeliveryOrderDetails);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 6),
                                          decoration: BoxDecoration(
                                              color: const Color(0xFF7ED957),
                                              borderRadius: BorderRadius.circular(6)
                                          ),
                                          child:  Text('pickup'.toUpperCase(),
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
                                  const Text('€34.00',
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
                    addHeight(20),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
