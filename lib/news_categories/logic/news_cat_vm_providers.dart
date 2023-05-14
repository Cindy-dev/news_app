import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/model/category_news_model.dart';
import 'news_cat_vm.dart';

///health
final newsHealthCatVM =
    FutureProvider.autoDispose.family<CategoryNewsModel, String>(
  (ref, country) => NewsCatVM(ref).fetchHealthNews(country),
);

///sports
final newsSportsCatVM =
    FutureProvider.autoDispose.family<CategoryNewsModel, String>(
  (ref, country) => NewsCatVM(ref).fetchScienceNews(country),
);

///bitcoin
final newsBitcoinCatVM =
    FutureProvider.autoDispose.family<CategoryNewsModel, String>(
  (ref, country) => NewsCatVM(ref).fetchBitcoinNews(country),
);

///science
final newsScienceCatVM =
    FutureProvider.autoDispose.family<CategoryNewsModel, String>(
  (ref, country) => NewsCatVM(ref).fetchScienceNews(country),
);

///business
final newsBusinessCatVM = FutureProvider.autoDispose
    .family<CategoryNewsModel, String>(
        (ref, country) => NewsCatVM(ref).fetchBusinessNews(country));

///technology
final newsTechnologyCatVM = FutureProvider.autoDispose
    .family<CategoryNewsModel, String>(
        (ref, country) => NewsCatVM(ref).fetchTechnologyNews(country));

///entertainment
final newsEntertainmentCatVM = FutureProvider.autoDispose
    .family<CategoryNewsModel, String>(
        (ref, country) => NewsCatVM(ref).fetchEntertainmentNews(country));
