import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/news_categories/data/model/category_news_model.dart';
import 'package:news_app/news_categories/data/repository/category_services.dart';
import 'package:news_app/top_headlines/data/repository/top_headline_service.dart';
import '../../app_controllers/controllers/request_view_model.dart';

class NewsCatVM extends RequestStateNotifier<void> {
  final Ref ref;
  NewsCatVM(this.ref);

  ///health
  Future<CategoryNewsModel> fetchHealthNews(String country) async {
    final healthNews = await ref
        .read(newsCatServiceProvider)
        .fetchNewsCategory(country, "health");
    return healthNews;
  }

  ///sports
  Future<CategoryNewsModel> fetchSportsNews(String country) async {
    final sportsNews = await ref
        .read(newsCatServiceProvider)
        .fetchNewsCategory(country, "sports");
    return sportsNews;
  }

  ///bitcoin
  Future<CategoryNewsModel> fetchBitcoinNews(String country) async {
    final bitcoinNews = await ref
        .read(newsCatServiceProvider)
        .fetchNewsCategory(country, "bitcoin");
    return bitcoinNews;
  }

  ///science
  Future<CategoryNewsModel> fetchScienceNews(String country) async {
    final scienceNews = await ref
        .read(newsCatServiceProvider)
        .fetchNewsCategory(country, "science");
    return scienceNews;
  }

  ///business
  Future<CategoryNewsModel> fetchBusinessNews(String country) async {
    final businessNews = await ref
        .read(newsCatServiceProvider)
        .fetchNewsCategory(country, "business");
    return businessNews;
  }

  ///technology
  Future<CategoryNewsModel> fetchTechnologyNews(String country) async {
    final technologyNews = await ref
        .read(newsCatServiceProvider)
        .fetchNewsCategory(country, "technology");
    return technologyNews;
  }

  ///entertainment
  Future<CategoryNewsModel> fetchEntertainmentNews(String country) async {
    final entertainmentNews = await ref
        .read(newsCatServiceProvider)
        .fetchNewsCategory(country, "entertainment");
    return entertainmentNews;
  }
}

