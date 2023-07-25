import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homemady_drivers/routers/routers.dart';
import 'package:homemady_drivers/widgets/custome_size.dart';
import 'package:homemady_drivers/widgets/custome_textfiled.dart';
import 'package:homemady_drivers/widgets/dimenestion.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../repository/registration.dart';
import '../widgets/app_theme.dart';
import '../widgets/new_helper.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';

class DeliveryPartnerApplyScreen extends StatefulWidget {
  const DeliveryPartnerApplyScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryPartnerApplyScreen> createState() =>
      _DeliveryPartnerApplyScreenState();
}

class _DeliveryPartnerApplyScreenState
    extends State<DeliveryPartnerApplyScreen> {
  final _formKey = GlobalKey<FormState>();
  File image = File("");
  File image1 = File("");
  File image2 = File("");
  TextEditingController dobController = TextEditingController();
  TextEditingController ppsController = TextEditingController();
  TextEditingController veyearController = TextEditingController();
  TextEditingController makeController = TextEditingController();
  TextEditingController modelNameController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Field to pick img : $e');
    }
  }
  Future pickImage1() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image1 = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Field to pick img : $e');
    }
  }
  Future pickImage2() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image2 = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Field to pick img : $e');
    }
  }
  String? _address = "";
  String? chooseOptionType;
  String? selectedCategory;
  String? selectedSecondaryCategory;
  String? selectedTertiaryCategory;
  String? selectedCollection;
  String dropdownvalue = 'car';
  String selectedDate = '';

  var items = [
    'car',
    'motorcycle',
    'bicycle',
  ];
  RxBool showValidation = false.obs;
  bool checkValidation(bool bool1, bool2) {
    if (bool1 == true && bool2 == true) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF7ED957),
              // header background color
              onPrimary: Colors.white,
              // header text color
              onSurface: Color(
                  0xFF7ED957), // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: const Color(
                    0xFF7ED957), // button text color
              ),
            ),
          ),
          child: child!,
        );
      },

      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      //DateTime.now() - not to allow to choose before today.
      lastDate: DateTime(2025),
    ).then((value) {
      // setState(() {
      //   _dateTime = value!;
      // });

      if (value != null) {
        String formattedDate = DateFormat(
            'dd/MM/yyyy').format(value);
        setState(() {
          dobController.text = formatDate(value); //set output date to TextField value.
          log("Seleted Date     $selectedDate");
        });
      }
    });

    if (pickedDate != null && pickedDate != dobController.text) {
      String formattedDate = DateFormat(
          'yyyy/MM/dd').format(pickedDate);
      setState(() {
        dobController.text = formatDate(pickedDate);
        log("Seleted Date     $selectedDate");
      });
    }
    // DatePicker.showDatePicker(
    //   context,
    //   showTitleActions: true,
    //   minTime: DateTime(1900, 1, 1),
    //   maxTime: DateTime.now(),
    //   onChanged: (date) {
    //     // Do something when the date is changed but not yet confirmed
    //     print('onChanged: $date');
    //   },
    //   onConfirm: (date) {
    //     setState(() {
    //       dobController.text = formatDate(date);
    //     });
    //   },
    //   currentTime: DateTime.now(),
    //   locale: LocaleType.en, // Replace with the desired locale for the picker
    // );
  }

  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }
  String googleApikey = "AIzaSyDDl-_JOy_bj4MyQhYbKbGkZ0sfpbTZDNU";


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
                    TextField(
                      controller: dobController,
                      onTap: (){
                        _selectDate(context);
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: 'Date of birth (dd/MM/YYYY)',
                          focusColor: Colors.green,
                          hintStyle: GoogleFonts.poppins(
                            color: const Color(0xFF697164),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF9F9F9),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                          // .copyWith(top: maxLines! > 4 ? AddSize.size18 : 0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xFFE2E2E2),width: 1),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          enabledBorder: const OutlineInputBorder(
                              borderSide:  BorderSide(color: Color(0xFFE2E2E2),width: 1),
                              borderRadius:  BorderRadius.all(Radius.circular(6.0))),
                          border: OutlineInputBorder(
                              borderSide:  const BorderSide(color: Color(0xFFE2E2E2),width: 1),
                              borderRadius: BorderRadius.circular(6.0)),
                         ),
                    ),
                    // RegistrationTextFieldChk(
                    //   validator: MultiValidator([
                    //     RequiredValidator(
                    //         errorText: 'Please enter your dob'),
                    //   ]),
                    //
                    //   controller: dobController,
                    //   hint: 'Dath of birth',
                    //    keyboardType: TextInputType.numberWithOptions(),
                    // ),
                    addHeight(13),
                    RegistrationTextFieldChk(
                      onTap: () {},
                      validator: MultiValidator([
                        RequiredValidator(
                            errorText: 'Please enter your PPS number'),
                      ]),
                      keyboardType: TextInputType.text,
                      controller: ppsController,
                      hint: 'PPS number',
                      length: 9,
                    ),
                    addHeight(13),
                    RegistrationTextFieldChk(
                      controller: typeController,
                      prefix: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 2),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                                border: InputBorder.none
                            ),
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: 'Please select your vechile type'),

                            ]),
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
                    InkWell(
                      onTap: () async {
                        var place = await PlacesAutocomplete.show(
                            hint: "Location",
                            context: context,
                            apiKey: googleApikey,
                            mode: Mode.overlay,
                            types: [],
                            strictbounds: false,
                            onError: (err) {
                              log("error.....   ${err.errorMessage}");
                            });
                        if (place != null) {
                          setState(() {
                            _address = (place.description ?? "Location")
                                .toString();
                          });
                          final plist = GoogleMapsPlaces(
                            apiKey: googleApikey,
                            apiHeaders: await const GoogleApiHeaders()
                                .getHeaders(),
                          );
                          print(plist);
                          String placeid = place.placeId ?? "0";
                          final detail =
                          await plist.getDetailsByPlaceId(placeid);
                          final geometry = detail.result.geometry!;
                          final lat = geometry.location.lat;
                          final lang = geometry.location.lng;
                          setState(() {
                            _address = (place.description ?? "Location")
                                .toString();
                            print("Address iss...$_address");
                          });
                        }},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: !checkValidation(
                                          showValidation.value,
                                          _address == "")
                                          ? Colors.grey.shade300
                                          : Colors.red),
                                  borderRadius:
                                  BorderRadius.circular(10.0),
                                  color: Colors.grey.shade50),
                              // width: MediaQuery.of(context).size.width - 40,
                              child: ListTile(
                                leading: const Icon(Icons.location_on,color: const Color(0xFF6CD241),),
                                title: Text(
                                  _address ?? "Location".toString(),
                                  style: TextStyle(
                                      fontSize: AddSize.font14),
                                ),
                                trailing: const Icon(Icons.search),
                                dense: true,
                              )),
                          checkValidation(
                              showValidation.value, _address == "")
                              ? Padding(
                            padding: EdgeInsets.only(
                                top: AddSize.size5),
                            child: Text(
                              "      Location is required",
                              style: TextStyle(
                                  color: Colors.red.shade700,
                                  fontSize: AddSize.font12),

                            ),
                          )
                              : SizedBox()
                        ],
                      )
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
                            hint: 'Year',
                            onTap: () {},
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: 'Please enter your vehicle model year'),
                            ]),
                            controller: veyearController,
                            keyboardType: TextInputType.number,
                            length: 4,
                          ),
                        ),
                        addWidth(17),
                        Expanded(
                          child: RegistrationTextFieldChk(
                            hint: 'Make',
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: 'Please enter your vehicle make year'),
                            ]),
                            onTap: () {},
                            controller: makeController,
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ],
                    ),
                    addHeight(15),
                    Row(
                      children: [
                        Expanded(
                          child: RegistrationTextFieldChk(
                            hint: 'Model',
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: 'Please enter your vehicle model'),
                            ]),
                            onTap: () {},
                            controller: modelNameController,
                          ),
                        ),
                        addWidth(17),
                        Expanded(
                          child: RegistrationTextFieldChk(
                            hint: 'Color',
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: 'Please enter your vehicle color'),
                            ]),
                            onTap: () {},
                            controller: colorController,
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
                      decoration:  BoxDecoration(
                          color: const Color(0xFFF4F4F4),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: !checkValidation(showValidation.value, image.path != "") ? const Color(0xFFE2E2E2): Colors.red,
                              width: 1)
                      ),
                      child: InkWell(
                        onTap: () {
                          pickImage();
                        },
                        child: image.path != "" ?
                        SizedBox(
                          width: double.maxFinite,
                          height: AddSize.size100,
                          child: Image.file(
                            image,
                            errorBuilder: (_, __, ___) =>
                            const Icon(Icons.add,size: 50,),
                          ),
                        ) : Column(
                          children: [
                            const Text('Upload',
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),),
                            addHeight(10),
                            Image.asset('assets/images/camera.png', height: 60,),
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
                            padding: const EdgeInsets.symmetric(vertical: 25),
                            width: AddSize.screenWidth,
                            decoration: BoxDecoration(
                                color: const Color(0xFFF4F4F4),
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color:  const Color(0xFFE2E2E2),
                                    width: 1)
                            ),
                            child: InkWell(
                              onTap: () {
                                pickImage1();
                              },
                            child :  image1.path != "" ?

                            SizedBox(
                              width: double.maxFinite,
                              height: AddSize.size100,
                              child: Image.file(
                                image1,
                                errorBuilder: (_, __, ___) =>
                                const Icon(Icons.add,size: 50,),
                              ),
                            ) :
                            Column(
                              children: [
                                const Text('Front',
                                  style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                  ),),
                                addHeight(10),
                                Image.asset('assets/images/camera.png', height: 60,),
                              ],
                            ),
                            ),
                          ),
                        ),
                        addWidth(17),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 25),
                            width: AddSize.screenWidth,
                            decoration: BoxDecoration(
                                color: const Color(0xFFF4F4F4),
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color:  const Color(0xFFE2E2E2),
                                    width: 1)
                            ),
                            child: InkWell(
                              onTap: () {
                                pickImage2();
                              },
                            child :  image2.path != "" ?
                            SizedBox(
                              width: double.maxFinite,
                              height: AddSize.size100,
                              child: Image.file(
                                image2,
                                errorBuilder: (_, __, ___) =>
                                const Icon(Icons.add,size: 50,),
                              ),
                            ) :
                            Column(
                              children: [
                                const Text('Back',
                                  style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                  ),),
                                addHeight(10),
                                Image.asset('assets/images/camera.png', height: 60,),
                              ],
                            ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    addHeight(30),
                    CommonButton(title: 'Apply',
                      onPressed: () {
                        if (_formKey.currentState!.validate() && _address!.isNotEmpty &&
                        image.path != "" &&
                        image1.path != "" &&
                        image2.path != "") {
                          Map  <String, String> mapdata = {
                            'dob' : dobController.text.trim(),
                            'pps_no' :  ppsController.text.trim(),
                            'vehicle_type'    : dropdownvalue.toString(),
                            'vehicle_name' :   veyearController.text.trim(),
                            'vehicle_model' :  modelNameController.text.trim(),
                            'vehicle_make' : makeController.text.trim(),
                            'vehicle_color' : colorController.text.trim(),
                            'address' : _address.toString(),
                          };
                          print(mapdata);
                          vendorRegistrationRepo(
                            fieldName1: 'pps_card_image',
                            fieldName2: "licence_front_image",
                            fieldName3: "licence_back_image",
                            file1: image,
                            file2: image1,
                            file3: image2,
                            mapData: mapdata,
                            context: context,
                          ).then((value) {
                            if (value.status == true) {
                              NewHelper.showToast(value.message.toString());
                              Get.offAllNamed(MyRouters.thankYouVendorScreen);
                            }
                            NewHelper.showToast(value.message.toString());
                          });
                        }
                        // emailLogin();
                        //
                      },
                    )
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

class _SlashInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Ensure the input value has the desired format (dd/mm/yyyy) with automatic `/` insertion.
    if (newValue.text.length == 1 && int.parse(newValue.text) > 3) {
      return oldValue;
    }
    if (newValue.text.length == 2 && int.parse(newValue.text) > 31) {
      return oldValue;
    }
    if (newValue.text.length == 3 && !newValue.text.endsWith('/')) {
      return TextEditingValue(
        text: '${newValue.text.substring(0, 2)}/${newValue.text.substring(2)}',
        selection: TextSelection.collapsed(offset: newValue.selection.end + 1),
      );
    }
    if (newValue.text.length == 6 && !newValue.text.endsWith('/')) {
      return TextEditingValue(
        text: '${newValue.text.substring(0, 5)}/${newValue.text.substring(5)}',
        selection: TextSelection.collapsed(offset: newValue.selection.end + 1),
      );
    }

    return newValue;
  }
}