import 'package:news_c20/core/remote/network/api_manager.dart';
import 'package:news_c20/data/datasource/articles_dao.dart';
import 'package:news_c20/data/model/articles/ArticlesResponse.dart';

class ArticlesApiDaoImpl implements ArticlesDao{
  ApiManager apiManager;
  ArticlesApiDaoImpl(this.apiManager);
  @override
  Future<ArticlesResponse> FetchArticles(String sourceId) {
    return apiManager.getArticles(sourceId);
  }

}