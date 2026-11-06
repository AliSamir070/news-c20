import 'package:flutter/material.dart';
import 'package:news_c20/core/remote/network/api_manager.dart';
import 'package:news_c20/model/articles/Article.dart';
import 'package:news_c20/model/articles/ArticlesResponse.dart';

class ArticlesListViewModel extends ChangeNotifier {
  bool isLoading = false;
  List<Article>? articlesList;
  String? errorMessage;
  getArticles(String sourceId)async{
    try{
      // loading case
      isLoading = true;
      notifyListeners();
      ArticlesResponse response = await ApiManager.getArticles(sourceId);
      isLoading = false;
      if(response.status=="error"){
        // error case
        errorMessage = response.message;
      }else{
        // success list of articles case
        articlesList = response.articles;
      }
      notifyListeners();
    }catch(e){
      // exception because of connection
      isLoading = false;
      errorMessage = "No Internet Connection";
      notifyListeners();
    }
  }
}