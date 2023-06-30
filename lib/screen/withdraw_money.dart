import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/app_theme.dart';
import '../widgets/custome_textfiled.dart';
import '../widgets/dimenestion.dart';


class DriverWithdrawMoney extends StatefulWidget {
  const DriverWithdrawMoney({Key? key}) : super(key: key);
  static var driverWithdrawMoney = "/driverWithdrawMoney";
  @override
  State<DriverWithdrawMoney> createState() => _DriverWithdrawMoneyState();
}

class _DriverWithdrawMoneyState extends State<DriverWithdrawMoney> {


  final TextEditingController addMoneyController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final List<String> moneyList = ["500", "800", "1000"];

  final walletStatus = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: backAppBar(title: "Withdrawal money".tr, context: context),
        body:SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AddSize.padding16,
                  vertical: AddSize.padding10),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: AppTheme.backgroundcolor,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AddSize.padding16,
                              vertical: AddSize.padding16),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "My Balance".tr,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: AppTheme.blackcolor),
                                  ),
                                 const Text(
                                    "€240.00",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 31,
                                        color:Color(0xFF262F33)),
                                  ),
                                ],
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF7ED957),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(Icons.account_balance_wallet_sharp,color: Colors.white,),
                              )
                            ],
                          ),
                        )),
                    SizedBox(
                      height: AddSize.size5,
                    ),
                    Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: AppTheme.backgroundcolor,
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AddSize.padding16,
                                vertical: AddSize.padding16),
                            child: Column(
                              children: [
                                TextFormField(
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(
                                        color: AppTheme.blackcolor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: AddSize.font24),
                                    controller: addMoneyController,
                                    cursorColor: const Color(0xFF7ED957),
                                    // validator: validateMoney,
                                    decoration: InputDecoration()),
                                SizedBox(
                                  height: AddSize.size15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: List.generate(
                                    moneyList.length,
                                        (index) => chipList(moneyList[index]),
                                  ),
                                ),
                                SizedBox(
                                  height: AddSize.size25,
                                ),
                                ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        minimumSize: Size(double.maxFinite,
                                            AddSize.size50),
                                        primary: const Color(0xFF7ED957),
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10)),
                                        textStyle: TextStyle(
                                            fontSize: AddSize.font20,
                                            fontWeight: FontWeight.w500)),
                                    child: Text(
                                      "Withdrawal".tr.toUpperCase(),
                                      style: const TextStyle(
                                          color:
                                          AppTheme.backgroundcolor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18),
                                    )),
                              ],
                            ))),
                    SizedBox(
                      height: AddSize.size10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // color: AppTheme.backgroundcolor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AddSize.padding16,
                            vertical: AddSize.padding10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Amount".tr,
                                  style: const TextStyle(
                                      height: 1.5,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: AppTheme.primaryColor),
                                ),
                                Text(
                                  "Date".tr,
                                  style: const TextStyle(
                                      height: 1.5,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: AppTheme.primaryColor),
                                ),
                                Text(
                                  "Status".tr,
                                  style: const TextStyle(
                                      height: 1.5,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: AppTheme.primaryColor),
                                )
                              ],
                            ),
                            Divider(),
                            ListView.builder(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 3,
                              itemBuilder:
                                  (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: AddSize.size5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          "€450.00",
                                          style: TextStyle(
                                              height: 1.5,
                                              fontWeight:
                                              FontWeight.w600,
                                              fontSize:12),
                                        ),
                                        Text(
                                          "Monday, 2 June, 2021",
                                          style: TextStyle(
                                              height: 1.5,
                                              color: Color(0xFF8C9BB2),
                                              fontWeight: FontWeight.w300,
                                              fontSize: 11),
                                        ),
                                        Text('Pending',
                                          style: TextStyle(
                                              height: 1.5,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              color: Color(0xFFFFB26B)),
                                        )

                                      ],
                                    ),
                                    SizedBox(
                                      height: AddSize.size5,
                                    ),
                                    Divider(),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ))
    );
  }

  chipList(title) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ChoiceChip(
      padding: EdgeInsets.symmetric(
          horizontal: width * .005, vertical: height * .005),
      backgroundColor: AppTheme.backgroundcolor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: Colors.grey.shade300)),
      label: Text("+€${title}",
          style: const TextStyle(
              color: Color(0xFF262F33),
              fontSize: 14,
              fontWeight: FontWeight.w500)),
      selected: false,
      onSelected: (value) {
        setState(() {
          addMoneyController.text = title;
          FocusManager.instance.primaryFocus!.unfocus();
        });
      },
    );
  }
}