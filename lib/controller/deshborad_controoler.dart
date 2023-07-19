import 'package:get/get.dart';

import '../models/deshborad_model.dart';
import '../repository/get_deshborad.dart';

class DeshBoradController extends GetxController{
  Rx<DashboardModel> model = DashboardModel().obs;
  RxBool isDataLoading = false.obs;

  getData(){
    isDataLoading.value = false;
    deshboradData().then((value1) {
      isDataLoading.value = true;
      model.value = value1;
    });
    //loginRepo().
  }
}