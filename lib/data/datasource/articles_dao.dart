import '../model/articles/ArticlesResponse.dart';

abstract interface class ArticlesDao {
  Future<ArticlesResponse> FetchArticles(String sourceId);
}