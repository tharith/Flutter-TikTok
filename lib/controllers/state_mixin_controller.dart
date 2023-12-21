import 'package:get/get.dart';

import '../apiServices/api_service.dart';
import '../models/business_headline_model.dart';

class StateMixinController extends GetxController with StateMixin<BusinessHeadlineModel> {
  ApiService apiService = ApiService();

  @override
  void onInit() {
    // TODO: implement onInit
    getBusinessHeadlineInfo();
    super.onInit();
  }

  void getBusinessHeadlineInfo() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await apiService.getBusinessHeadlineInfo();
      change(response, status: RxStatus.success());
    } catch(e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}