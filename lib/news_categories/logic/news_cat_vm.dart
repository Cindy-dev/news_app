import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/news_categories/data/repository/category_services.dart';
import '../../app_controllers/controllers/request_view_model.dart';
import '../../model/news_model.dart';

class NewsCatVM extends RequestStateNotifier<void> {
  final Ref ref;
  NewsCatVM(this.ref);

  ///health
  Future<NewsModel> fetchHealthNews(String country) async {
    final healthNews = await ref
        .read(newsCatServiceProvider)
        .fetchNewsCategory(country, "health");
    return healthNews;
  }

  ///sports
  Future<NewsModel> fetchSportsNews(String country) async {
    final sportsNews = await ref
        .read(newsCatServiceProvider)
        .fetchNewsCategory(country, "sports");
    return sportsNews;
  }

  ///bitcoin
  Future<NewsModel> fetchBitcoinNews(String country) async {
    final bitcoinNews = await ref
        .read(newsCatServiceProvider)
        .fetchNewsCategory(country, "bitcoin");
    return bitcoinNews;
  }

  ///science
  Future<NewsModel> fetchScienceNews(String country) async {
    final scienceNews = await ref
        .read(newsCatServiceProvider)
        .fetchNewsCategory(country, "science");
    return scienceNews;
  }

  ///business
  Future<NewsModel> fetchBusinessNews(String country) async {
    final businessNews = await ref
        .read(newsCatServiceProvider)
        .fetchNewsCategory(country, "business");
    return businessNews;
  }

  ///technology
  Future<NewsModel> fetchTechnologyNews(String country) async {
    final technologyNews = await ref
        .read(newsCatServiceProvider)
        .fetchNewsCategory(country, "technology");
    return technologyNews;
  }

  ///entertainment
  Future<NewsModel> fetchEntertainmentNews(String country) async {
    final entertainmentNews = await ref
        .read(newsCatServiceProvider)
        .fetchNewsCategory(country, "entertainment");
    return entertainmentNews;
  }
}

