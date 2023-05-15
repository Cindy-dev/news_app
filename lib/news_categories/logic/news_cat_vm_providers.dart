import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/news_model.dart';
import 'news_cat_vm.dart';

///health
final newsHealthCatVM =
    FutureProvider.family<NewsModel, String>(
  (ref, country) => NewsCatVM(ref).fetchHealthNews(country),
);

///sports
final newsSportsCatVM =
    FutureProvider.family<NewsModel, String>(
  (ref, country) => NewsCatVM(ref).fetchScienceNews(country),
);

///bitcoin
final newsBitcoinCatVM =
    FutureProvider.family<NewsModel, String>(
  (ref, country) => NewsCatVM(ref).fetchBitcoinNews(country),
);

///science
final newsScienceCatVM =
    FutureProvider.family<NewsModel, String>(
  (ref, country) => NewsCatVM(ref).fetchScienceNews(country),
);

///business
final newsBusinessCatVM = FutureProvider
    .family<NewsModel, String>(
        (ref, country) => NewsCatVM(ref).fetchBusinessNews(country));

///technology
final newsTechnologyCatVM = FutureProvider
    .family<NewsModel, String>(
        (ref, country) => NewsCatVM(ref).fetchTechnologyNews(country));

///entertainment
final newsEntertainmentCatVM = FutureProvider
    .family<NewsModel, String>(
        (ref, country) => NewsCatVM(ref).fetchEntertainmentNews(country));
