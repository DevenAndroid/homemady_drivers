import 'package:get/get.dart';
import '../models/get_ratingModel.dart';
import '../models/notification_model.dart';
import '../repository/getRating_repo.dart';
import '../repository/notificatoin_repo.dart';

class GetFeedbackController extends GetxController {
  RxBool isDataLoading = false.obs;
  Rx<getRating> model = getRating().obs;
  RxString driverId = "".obs;

  getData() async {
    isDataLoading.value = false;
    getRatingRepo(driverId: driverId).then((value) {
      isDataLoading.value = true;
      model.value = value;
    });
  }
}
