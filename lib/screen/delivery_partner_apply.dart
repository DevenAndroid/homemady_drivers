import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homemady_drivers/routers/routers.dart';
import 'package:homemady_drivers/widgets/custome_size.dart';
import 'package:homemady_drivers/widgets/custome_textfiled.dart';
import 'package:homemady_drivers/widgets/dimenestion.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/app_theme.dart';
import '../widgets/new_helper.dart';


class DeliveryPartnerApplyScreen extends StatefulWidget {
  const DeliveryPartnerApplyScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryPartnerApplyScreen> createState() =>
      _DeliveryPartnerApplyScreenState();
}

class _DeliveryPartnerApplyScreenState
    extends State<DeliveryPartnerApplyScreen> {
  final _formKey = GlobalKey<FormState>();
  Rx<File> image = File("").obs;
  Rx<File> image1 = File("").obs;
  Rx<File> image2 = File("").obs;
  final ImagePicker picker = ImagePicker();

  showUploadWindow() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AddSize.padding16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AddSize.size10),
                    Text("Choose From Which",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: AddSize.font16)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          child: Text("Gallery",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.primaryColor,
                                  fontSize: AddSize.font14)),
                          onPressed: () {
                            NewHelper().addFilePicker().then((value) {
                              image.value = value!;
                            });
                            Get.back();
                          },
                        ),
                        TextButton(
                          child: Text("Camera",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.primaryColor,
                                  fontSize: AddSize.font14)),
                          onPressed: () {
                            NewHelper()
                                .addImagePicker(imageSource: ImageSource.camera)
                                .then((value) {
                              image.value = value!;
                            });
                            Get.back();
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AddSize.size20,
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }
  showUploadWindow1() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AddSize.padding16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AddSize.size10),
                    Text("Choose From Which",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: AddSize.font16)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          child: Text("Gallery",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.primaryColor,
                                  fontSize: AddSize.font14)),
                          onPressed: () {
                            NewHelper().addFilePicker().then((value) {
                              image1.value = value!;
                            });
                            Get.back();
                          },
                        ),
                        TextButton(
                          child: Text("Camera",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.primaryColor,
                                  fontSize: AddSize.font14)),
                          onPressed: () {
                            NewHelper()
                                .addImagePicker(imageSource: ImageSource.camera)
                                .then((value) {
                              image1.value = value!;
                            });
                            Get.back();
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AddSize.size20,
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }
  showUploadWindow2() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AddSize.padding16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AddSize.size10),
                    Text("Choose From Which",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: AddSize.font16)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          child: Text("Gallery",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.primaryColor,
                                  fontSize: AddSize.font14)),
                          onPressed: () {
                            NewHelper().addFilePicker().then((value) {
                              image2.value = value!;
                            });
                            Get.back();
                          },
                        ),
                        TextButton(
                          child: Text("Camera",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.primaryColor,
                                  fontSize: AddSize.font14)),
                          onPressed: () {
                            NewHelper()
                                .addImagePicker(imageSource: ImageSource.camera)
                                .then((value) {
                              image2.value = value!;
                            });
                            Get.back();
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AddSize.size20,
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }

  String dropdownvalue = 'Car';

  var items = [
    'Car',
    'Motorcycle',
    'Bicycle',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(title: 'Delivery Partner Apply', context: context),
      body: Obx(() {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Container(
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RegistrationTextFieldChk(
                      onTap: () {},
                      hint: 'Dath of birth',
                    ),
                    addHeight(13),
                    RegistrationTextFieldChk(
                      onTap: () {},
                      hint: 'PPS number',
                    ),
                    addHeight(13),
                    RegistrationTextFieldChk(
                      prefix: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 2),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isExpanded: true,
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
                      ),
                    ),
                    addHeight(13),
                    RegistrationTextFieldChk(
                      onTap: () {},
                      hint: 'Address',
                      suffix: Padding(
                        padding: const EdgeInsets.only(right: 17.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/locationImg.png', height: 19,)
                          ],
                        ),
                      ),
                    ),
                    addHeight(18),
                    const Text('Vehicle Details', style: TextStyle(
                      color: Color(0xFF2F2F2F),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),),
                    addHeight(8),
                    Row(
                      children: [
                        Expanded(
                          child: RegistrationTextFieldChk(
                            hint: '2000 Year',
                            onTap: () {},
                          ),
                        ),
                        addWidth(17),
                        Expanded(
                          child: RegistrationTextFieldChk(
                            hint: 'Make',
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    addHeight(15),
                    Row(
                      children: [
                        Expanded(
                          child: RegistrationTextFieldChk(
                            hint: 'VDI',
                            onTap: () {},
                          ),
                        ),
                        addWidth(17),
                        Expanded(
                          child: RegistrationTextFieldChk(
                            hint: 'Red',
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    addHeight(15),
                    const Text('PPS card', style: TextStyle(
                      color: Color(0xFF2F2F2F),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),),
                    addHeight(15),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      width: AddSize.screenWidth,
                      decoration: BoxDecoration(
                          color: const Color(0xFFF4F4F4),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: const Color(0xFFE2E2E2),
                              width: 1)
                      ),
                      child: InkWell(
                        onTap: () {
                          showUploadWindow();
                        },
                        child: image.value.path == "" ?
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Upload',
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),),
                            addHeight(10),
                            Image.asset('assets/images/camera.png', height: 60,)
                          ],
                        ) :    Stack(
                          children: [
                            SizedBox(
                                width: double.maxFinite,
                                height: AddSize.size100,
                                child: Image.file(image.value)),

                            Positioned(
                              right: 0,
                              top: 0,
                              child: GestureDetector(
                                onTap: () {
                                  NewHelper()
                                      .addFilePicker()
                                      .then((value) {
                                    image.value = value;
                                  });
                                },
                                child: Container(
                                  height: AddSize.size30,
                                  width: AddSize.size30,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: Colors.black12),
                                      color:
                                      Color(0xFF7ED957),
                                      borderRadius:
                                      BorderRadius.circular(
                                          50)),
                                  child: const Center(
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                        size: 20,
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    addHeight(15),
                    const Text('Upload Driver Licence', style: TextStyle(
                      color: Color(0xFF2F2F2F),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),),
                    addHeight(15),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            width: AddSize.screenWidth,
                            decoration: BoxDecoration(
                                color: const Color(0xFFF4F4F4),
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: const Color(0xFFE2E2E2),
                                    width: 1)
                            ),
                            child: InkWell(
                              onTap: () {
                                showUploadWindow1();
                              },
                              child: image1.value.path == "" ?
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('Front',
                                    style: TextStyle(
                                      color: Color(0xFF000000),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),),
                                  addHeight(10),
                                  Image.asset('assets/images/camera.png', height: 60,)
                                ],
                              ) :   Stack(
                                children: [
                                  SizedBox(
                                      width: double.maxFinite,
                                      height: AddSize.size100,
                                      child: Image.file(image1.value)),

                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        NewHelper()
                                            .addFilePicker()
                                            .then((value) {
                                          image1.value = value;
                                        });
                                      },
                                      child: Container(
                                        height: AddSize.size30,
                                        width: AddSize.size30,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1,
                                                color: Colors.black12),
                                            color:
                                            Color(0xFF7ED957),
                                            borderRadius:
                                            BorderRadius.circular(
                                                50)),
                                        child: const Center(
                                            child: Icon(
                                              Icons.edit,
                                              color: Colors.white,
                                              size: 20,
                                            )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        addWidth(17),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            width: AddSize.screenWidth,
                            decoration: BoxDecoration(
                                color: const Color(0xFFF4F4F4),
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: const Color(0xFFE2E2E2),
                                    width: 1)
                            ),
                            child: InkWell(
                              onTap: () {
                                showUploadWindow2();
                              },
                              child: image2.value.path == "" ?
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('Back',
                                    style: TextStyle(
                                      color: Color(0xFF000000),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),),
                                  addHeight(10),
                                  Image.asset('assets/images/camera.png', height: 60,)
                                ],
                              ) :
                              Stack(
                                children: [
                                  SizedBox(
                                      width: double.maxFinite,
                                      height: AddSize.size100,
                                      child: Image.file(image2.value)),

                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        NewHelper()
                                            .addFilePicker()
                                            .then((value) {
                                          image2.value = value;
                                        });
                                      },
                                      child: Container(
                                        height: AddSize.size30,
                                        width: AddSize.size30,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1,
                                                color: Colors.black12),
                                            color:
                                            Color(0xFF7ED957),
                                            borderRadius:
                                            BorderRadius.circular(
                                                50)),
                                        child: const Center(
                                            child: Icon(
                                              Icons.edit,
                                              color: Colors.white,
                                              size: 20,
                                            )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            ),
                          ),
                        ),
                      ],
                    ),
                    addHeight(30),
                    CommonButton(title: 'Apply',onPressed: (){
                      Get.toNamed(MyRouters.thankYouVendorScreen);
                    },)
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
