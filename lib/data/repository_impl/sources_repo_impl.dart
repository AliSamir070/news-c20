import 'package:news_c20/data/datasource/sources_dao.dart';
import 'package:news_c20/data/model/sources/Sources_response.dart';
import 'package:news_c20/repository/sources_repo.dart';

class SourcesRepoImpl implements SourcesRepo{
  SourcesDao sourcesDao;
  SourcesRepoImpl(this.sourcesDao);
  @override
  Future<SourcesResponse> FetchSources(String categoryId) {
    return sourcesDao.FetchSources(categoryId);
  }

}