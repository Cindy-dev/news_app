import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/news_categories/data/model/category_news_model.dart';

class CategoryService {
  final dio = Dio();

  Future<CategoryNewsModel> fetchNewsCategory(
      String country, String category) async {
    final url =
        "https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=${dotenv.env["apiKey"]}";
    final result = await dio.get(url);
    final newsCategory = CategoryNewsModel.fromJson(result.data);
    return newsCategory;
  }

  //
  // ///Health
  // Future<CategoryNewsModel> fetchHealthNews(String country) async {
  //   final url =
  //       "https://newsapi.org/v2/top-headlines?country=$country&category=health&apiKey=${dotenv.env["apiKey"]}";
  //   final result = await dio.get(url);
  //   final healthNews = CategoryNewsModel.fromJson(result.data);
  //   return healthNews;
  // }
  //
  // ///Sports
  // Future<CategoryNewsModel> fetchSportsNews(String country) async {
  //   final url =
  //       "https://newsapi.org/v2/top-headlines?country=$country&category=sports&apiKey=${dotenv.env["apiKey"]}";
  //   final result = await dio.get(url);
  //   final sportsNews = CategoryNewsModel.fromJson(result.data);
  //   return sportsNews;
  // }
  //
  // ///Bitcoin
  // Future<CategoryNewsModel> fetchBitcoinNews(String country) async {
  //   final url =
  //       "https://newsapi.org/v2/top-headlines?country=$country&category=bitcoin&apiKey=${dotenv.env["apiKey"]}";
  //   final result = await dio.get(url);
  //   final bitcoinNews = CategoryNewsModel.fromJson(result.data);
  //   return bitcoinNews;
  // }
  //
  // ///Science
  // Future<CategoryNewsModel> fetchScienceNews(String country) async {
  //   final url =
  //       "https://newsapi.org/v2/top-headlines?country=$country&category=science&apiKey=${dotenv.env["apiKey"]}";
  //   final result = await dio.get(url);
  //   final scienceNews = CategoryNewsModel.fromJson(result.data);
  //   return scienceNews;
  // }
  //
  // ///Business
  // Future<CategoryNewsModel> fetchBusinessNews(String country) async {
  //   final url =
  //       "https://newsapi.org/v2/top-headlines?country=$country&category=business&apiKey=${dotenv.env["apiKey"]}";
  //   final result = await dio.get(url);
  //   final businessNews = CategoryNewsModel.fromJson(result.data);
  //   return businessNews;
  // }
  //
  // ///Technology
  // Future<CategoryNewsModel> fetchTechNews(String country) async {
  //   final url =
  //       "https://newsapi.org/v2/top-headlines?country=$country&category=technology&apiKey=${dotenv.env["apiKey"]}";
  //   final result = await dio.get(url);
  //   final techNews = CategoryNewsModel.fromJson(result.data);
  //   return techNews;
  // }
  //
  // ///Entertainment
  // Future<CategoryNewsModel> fetchEntertainmentNews(String country) async {
  //   final url =
  //       "https://newsapi.org/v2/top-headlines?country=$country&category=entertainment&apiKey=${dotenv.env["apiKey"]}";
  //   final result = await dio.get(url);
  //   final entertainmentNews = CategoryNewsModel.fromJson(result.data);
  //   return entertainmentNews;
  // }
}

final newsCatServiceProvider = Provider((ref) => CategoryService());
