import 'package:flutter/material.dart';
import 'package:news_c20/core/remote/network/api_manager.dart';
import 'package:news_c20/model/sources/Source.dart';

class ArticlesViewModel extends ChangeNotifier{
  String? errorMessage;
  List<Source>? sourcesList;
  bool isLoading = false;
  getSources(String categoryId)async{
    try{
      // add loading logic
      isLoading = true;
      notifyListeners();
      var sourceResponse = await ApiManager.getSources(categoryId);
      isLoading = false;
      if(sourceResponse.status == "error"){
        // server error logic
        errorMessage = sourceResponse.message;
      }else{
        // sources list logic (success)
        sourcesList = sourceResponse.sources;
      }
      notifyListeners();

    }catch(e){
      isLoading = false;
      // handle exception or not internet error logic
      errorMessage = "No Internet Connection";
      notifyListeners();

    }
  }
}