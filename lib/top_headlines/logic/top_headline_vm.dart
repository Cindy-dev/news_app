import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/top_headlines/data/repository/top_headline_service.dart';
import '../../app_controllers/controllers/request_view_model.dart';
import '../../model/news_model.dart';

class TopHeadlineVM extends RequestStateNotifier<void> {
  final Ref ref;
  TopHeadlineVM(this.ref);

  Future<NewsModel> fetchTopHeadline(String country) async {
    final topHeadline =
        await ref.read(topHeadlineServiceProvider).fetchTopHeadline(country);
    return topHeadline;
  }
}

final topHeadlineVM =
    FutureProvider.autoDispose.family<NewsModel, String>(
  (ref, country) => TopHeadlineVM(ref).fetchTopHeadline(country),
);
