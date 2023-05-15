import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/model/news_model.dart';

class GeneralNewsService {
  final dio = Dio();
  Future<NewsModel> fetchNews() async {
    final url =
        "https://newsapi.org/v2/everything?q=general&apiKey=${dotenv.env["apiKey"]}";
    try {
      final response = await dio.get(url);
      final generalNews = NewsModel.fromJson(response.data);
      return generalNews;
    } on SocketException {
      throw Exception("please Connect to the internet");
    } catch (e) {
      print(e);
      throw e;
    }
  }
}

final generalNewsServiceProvider = Provider((ref) => GeneralNewsService());
