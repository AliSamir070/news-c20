import 'package:news_c20/data/model/sources/Sources_response.dart';

abstract interface class SourcesDao {
  Future<SourcesResponse> FetchSources(String categoryId);
}