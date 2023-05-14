import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/general_news/data/model/general_news_model.dart';

class TopHeadlineService {
  final dio = Dio();
  Future<GeneralNewsModel> fetchTopHeadline(String country) async {
    // final url =
    //     "https://newsapi.org/v2/top-headlines?country=${country}&apiKey=${dotenv.env["apiKey"]}";
    try {
      ///check url
      final response = await dio.get("");
      final topHeadline = GeneralNewsModel.fromJson(response.data);
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
