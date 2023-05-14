import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/top_headlines/data/repository/top_headline_service.dart';
import '../../app_controllers/controllers/request_view_model.dart';
import '../../general_news/data/model/general_news_model.dart';

class TopHeadlineVM extends RequestStateNotifier<void> {
  final Ref ref;
  TopHeadlineVM(this.ref);

  Future<GeneralNewsModel> fetchTopHeadline(String country) async {
    final topHeadline =
        await ref.read(topHeadlineServiceProvider).fetchTopHeadline(country);
    return topHeadline;
  }
}

final topHeadlineVM =
    FutureProvider.autoDispose.family<GeneralNewsModel, String>(
  (ref, country) => TopHeadlineVM(ref).fetchTopHeadline(country),
);
