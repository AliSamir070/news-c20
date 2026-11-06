// state : stream business logic sound in widget
// event : stream where widget sends event data to bloc (viewmodel)
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_c20/core/remote/network/api_manager.dart';

import '../../../../../model/sources/Source.dart';

class ArticlesViewModel extends Cubit<ArticlesStates>{
  ArticlesViewModel():super(LoadingState());

  getSources(String categoryId)async{
    try{
      // logic of loading
      emit(LoadingState());
      var response = await ApiManager.getSources(categoryId);
      if(response.status == "error"){
        // logic of server error
        emit(ErrorState(response.message??""));
      }else{
        // logic of success sources list
        emit(SuccessState(response.sources??[]));
      }
    }catch(e){
      // logic of connection error
      emit(ErrorState("No Internet Connection"));
    }
  }
}

sealed class ArticlesStates{}
class LoadingState extends ArticlesStates{}
class SuccessState extends ArticlesStates{
  List<Source> sourcesList;
  SuccessState(this.sourcesList);
}
class ErrorState extends ArticlesStates{
  String errorMessage;
  ErrorState(this.errorMessage);
}