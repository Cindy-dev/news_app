import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../model/news_model.dart';

class CategoryService {
  final dio = Dio();

  Future<NewsModel> fetchNewsCategory(
      String country, String category) async {
    final url =
        "https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=${dotenv.env["apiKey"]}";
    final result = await dio.get(url);
    final newsCategory = NewsModel.fromJson(result.data);
    return newsCategory;
  }
}

final newsCatServiceProvider = Provider((ref) => CategoryService());
