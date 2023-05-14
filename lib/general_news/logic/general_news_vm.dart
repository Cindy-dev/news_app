import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/general_news/data/repository/general_news_service.dart';
import '../../app_controllers/controllers/request_view_model.dart';
import '../data/model/general_news_model.dart';

class GeneralNewsVM extends RequestStateNotifier<void> {
  final Ref ref;
  GeneralNewsVM(this.ref) ;

  Future<GeneralNewsModel> fetchNews() async {
  final generalNews = await ref.read(generalNewsServiceProvider).fetchNews();
  return generalNews;

  }
}

final generalNewsVM =
    FutureProvider.autoDispose((ref) => GeneralNewsVM(ref).fetchNews());