import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_c20/core/resources/app_constants.dart';
import '../../../data/model/articles/ArticlesResponse.dart';
import '../../../data/model/sources/Sources_response.dart';

@singleton
class ApiManager {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://newsapi.org"
    )
  );
    //
  Future<SourcesResponse> getSources(String categoryId)async{
    var response = await dio.get("/v2/top-headlines/sources",queryParameters: {
      "apiKey":AppConstants.apiKey,
      "category":categoryId,
    });
    var sourcesResponse = SourcesResponse.fromJson(response.data);
    return sourcesResponse;
  }
  Future<ArticlesResponse> getArticles(String sourceId)async{
    var response = await dio.get("/v2/everything",queryParameters: {
      "apiKey":AppConstants.apiKey,
      "sources":sourceId
    });
    var articlesResponse = ArticlesResponse.fromJson(response.data);
    return articlesResponse;
  }
}