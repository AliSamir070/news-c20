import 'package:news_c20/core/remote/network/api_manager.dart';
import 'package:news_c20/data/datasource/sources_dao.dart';
import 'package:news_c20/data/model/sources/Sources_response.dart';

class SourcesApiDaoImpl implements SourcesDao  {
  ApiManager apiManager;
  SourcesApiDaoImpl(this.apiManager); // constructor injection
  @override
  Future<SourcesResponse> FetchSources(String categoryId) async{
    var response = await apiManager.getSources(categoryId);
    return response;
  }

}