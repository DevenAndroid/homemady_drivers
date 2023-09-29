import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../routers/routers.dart';
import '../widgets/app_assets.dart';
import '../widgets/custome_textfiled.dart';
import '../widgets/dimenestion.dart';


class OrderDeclineScreen extends StatefulWidget {
  const OrderDeclineScreen({Key? key}) : super(key: key);

  @override
  State<OrderDeclineScreen> createState() => _OrderDeclineScreenState();
}

class _OrderDeclineScreenState extends State<OrderDeclineScreen> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AddSize.padding16, vertical: AddSize.padding16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: AddSize.size20 * 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Image(
                      height: AddSize.size300,
                      width: double.maxFinite,
                      image: const AssetImage(AppAssets.decline),
                      fit: BoxFit.contain,
                    ),
                  ),
                const SizedBox(
                    height: 60,
                  ),
                  const Text(
                    "Your Order is Decline",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                        color:  Color(0xFFF94D4D)),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 13,
                        color: Color(0xFF596774)),
                  ),
                  SizedBox(
                    height: AddSize.size10,
                  ),
                ],
              ),
            )),
        bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AddSize.padding16, vertical: AddSize.size40),
            child:
            CommonButton(
              title: 'Continue',
              onPressed: () {
                Get.toNamed(MyRouters.dashbordScreen);
              },
            )
        ),
      ),
    );
  }
}
