import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/model/news_model.dart';

class TopHeadlineService {
  final dio = Dio();
  Future<NewsModel> fetchTopHeadline(String country) async {
    final url =
        "https://newsapi.org/v2/top-headlines?country=${country}&apiKey=${dotenv.env["apiKey"]}";
    try {
      final response = await dio.get(url);
      final topHeadline = NewsModel.fromJson(response.data);
      return topHeadline;
    } on SocketException {
      throw Exception("please Connect to the internet");
    } catch (e) {
      print(e);
      throw e;
    }
  }
}

final topHeadlineServiceProvider = Provider((ref) => TopHeadlineService());
