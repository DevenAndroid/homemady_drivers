import 'package:get/get.dart';
import '../models/order_details_cooks_copy_model.dart';
import '../repository/order_details_repo.dart';


class MyOrderDetailsController extends GetxController {
  RxBool isDataLoading = false.obs;
  Rx<MyOrdersDetailsModel> model = MyOrdersDetailsModel().obs;
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