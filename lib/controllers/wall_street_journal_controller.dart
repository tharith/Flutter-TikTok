import 'package:get/get.dart';
import '../apiServices/api_service.dart';
import '../models/wall_street_journal_model.dart';

class WallStreetJournalController extends GetxController {
  ApiService apiService = ApiService();
  RxList<Articles> lsArticles = RxList();

  @override
  void onInit() {
    // TODO: implement onInit
    fetchData();
    super.onInit();
  }

  fetchData() async {
    final response = await apiService.getData();
    lsArticles.value = response.articles!;
  }
}