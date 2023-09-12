import 'package:get/get.dart';
import '../models/assigned_orderList_model.dart';
import '../repository/assigned_orderList_repo.dart';

class AssignedOrderController extends GetxController {
  RxBool isDataLoading = false.obs;
  Rx<assgnedOrderList> model = assgnedOrderList().obs;
  RxString status = "".obs;
  bool gg = false;

  @override
  void onInit() {
    super.onInit();
    getOrderData1();
  }

  // getOrderData() async {
  //   print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
  // //   if(gg == true)return;
  // //   gg = true;
  // //   isDataLoading.value = false;
  // //   assignedOrderListRepo(status: status.value).then((value) {
  // //     gg = false;
  // //     isDataLoading.value = true;
  // //     model.value = value;
  // //   }).catchError((e){
  // //     gg = false;
  // //   });
  // }

  getOrderData1() async {
   // print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
    if(gg == true)return;
    gg = true;
    // isDataLoading.value = false;
    assignedOrderListRepo( filterKeyword: status.value).then((value) {
      gg = false;
      isDataLoading.value = true;
      model.value = value;
    }).catchError((e){
      gg = false;
    });
  }
}