import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_c20/core/remote/network/api_manager.dart';
import 'package:news_c20/model/articles/Article.dart';

class ArticlesListViewModel extends Cubit<ArticlesListStates>{
  ArticlesListViewModel():super(LoadingState());

  getArticlesList(String sourceId)async{
    try{
      var response = await ApiManager.getArticles(sourceId);
      if(response.status == "error"){
        emit(ErrorState(response.message!));
      }else{
        emit(SuccessState(response.articles??[]));
      }
    }catch(e){
      emit(ErrorState("No Internet Connection"));
    }
  }
}
sealed class ArticlesListStates{}
class LoadingState extends ArticlesListStates{}
class SuccessState extends ArticlesListStates{
  List<Article> articlesList;
  SuccessState(this.articlesList);
}
class ErrorState extends ArticlesListStates{
  String errorMessage;
  ErrorState(this.errorMessage);
}