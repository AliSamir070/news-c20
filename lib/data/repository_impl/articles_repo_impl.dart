import 'package:news_c20/data/datasource/articles_dao.dart';
import 'package:news_c20/data/model/articles/ArticlesResponse.dart';
import 'package:news_c20/repository/articles_repo.dart';

class ArticlesRepoImpl implements ArticlesRepo{
  ArticlesDao articlesDao;
  ArticlesRepoImpl(this.articlesDao);
  @override
  Future<ArticlesResponse> FetchArticles(String sourceId) {
    return articlesDao.FetchArticles(sourceId);
  }

}