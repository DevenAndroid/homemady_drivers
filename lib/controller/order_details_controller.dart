import 'package:get/get.dart';

import '../models/order_Details_model.dart';
import '../repository/order_details_repo.dart';


class MyOrderDetailsController extends GetxController {
  RxBool isDataLoading = false.obs;
  Rx<orderDetailsModel> model = orderDetailsModel().obs;
  RxString id = "".obs;

  getMyOrderDetails() {
    isDataLoading.value = false;
    myOrderDetailsRepo(id: id).then((value) {
      isDataLoading.value = true;
      model.value = value;
    });
  }

  @override
  void onInit() {
    super.onInit();
    getMyOrderDetails();
  }
}