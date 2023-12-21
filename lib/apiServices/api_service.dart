import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/business_headline_model.dart';
import '../models/wall_street_journal_model.dart';

class ApiService {
  Future<WallStreetJournalModel> getData() async {
    var url = Uri.parse("https://newsapi.org/v2/everything?domains=wsj.com&apiKey=49f04371f4e4405694aec1df2fae9fd5");
    var response = await http.get(url);
    var data = jsonDecode(response.body);
    var result = WallStreetJournalModel.fromJson(data);

    return result;
  }
  
  Future<BusinessHeadlineModel> getBusinessHeadlineInfo() async {
    var url = Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=49f04371f4e4405694aec1df2fae9fd5");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return BusinessHeadlineModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Fail to load data");
    }
  }
}