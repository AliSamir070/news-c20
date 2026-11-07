import 'package:news_c20/data/model/sources/Sources_response.dart';

abstract interface class SourcesRepo {
  Future<SourcesResponse> FetchSources(String categoryId);
}