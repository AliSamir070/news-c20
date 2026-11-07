import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c20/core/remote/network/api_manager.dart';
import 'package:news_c20/core/resources/app_constants.dart';
import 'package:news_c20/data/datasource/sources_dao.dart';
import 'package:news_c20/data/datasource_impl/sources/sources_api_dao_impl.dart';
import 'package:news_c20/data/repository_impl/sources_repo_impl.dart';
import 'package:news_c20/repository/sources_repo.dart';
import 'package:news_c20/ui/home/widgets/articles_widget/viewmodel/articles_view_model.dart';
import 'package:news_c20/ui/home/widgets/articles_widget/widgets/articles_list/articles_list.dart';

import '../../../../data/model/sources/Source.dart';

class ArticlesWidget extends StatefulWidget {
  final String categoryId;
  const ArticlesWidget({super.key,required this.categoryId});

  @override
  State<ArticlesWidget> createState() => _ArticlesWidgetState();
}

class _ArticlesWidgetState extends State<ArticlesWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider( // DI ??
        create: (context) => ArticlesViewModel(SourcesRepoImpl(SourcesApiDaoImpl(ApiManager())))..getSources(widget.categoryId),
        child: BlocBuilder<ArticlesViewModel,ArticlesStates>(
            builder: (context, state) {
              switch(state){

                case LoadingState():{
                  return Center(child: CircularProgressIndicator(),);
                }
                case SuccessState():{
                  List<Source> sources = state.sourcesList;
                  return DefaultTabController(
                    length: sources.length,
                    child: Padding(
                      padding: REdgeInsetsDirectional.only(
                          top: 16,
                          start: 16
                      ),
                      child: Column(
                        spacing: 16.h,
                        children: [
                          TabBar(
                            isScrollable: true,
                            tabs: sources
                                .map((source) => Tab(text: source.name))
                                .toList(),
                          ),
                          Expanded(child: Padding(
                            padding: REdgeInsetsDirectional.only(end: 16),
                            child: TabBarView(children: sources
                                .map((source) => ArticlesList(sourceId: source.id??"",))
                                .toList()),
                          )),
                        ],
                      ),
                    ),
                  );
                }
                case ErrorState():{
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(state.errorMessage),
                        ElevatedButton(onPressed: () {
                          BlocProvider.of<ArticlesViewModel>(context).getSources(widget.categoryId);
                        }, child: Text("Try Again"))
                      ],
                    ),
                  );
                }
              }
              /*if(state is SuccessState){

              }
              if(state is ErrorState){
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.errorMessage),
                      ElevatedButton(onPressed: () {
                        setState(() {

                        });
                      }, child: Text("Try Again"))
                    ],
                  ),
                );
              }
              return Center(child: CircularProgressIndicator(),);*/
            },
        ),
    )

      /*FutureBuilder(
        future: ApiManager.getSources(widget.categoryId),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasError){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("No Internet Connection"),
                  ElevatedButton(onPressed: () {
                    setState(() {

                    });
                  }, child: Text("Try Again"))
                ],
              ),
            );
          }
          var response = snapshot.data;
          if(response?.status == "error"){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(response?.message??""),
                  ElevatedButton(onPressed: () {
                    setState(() {

                    });
                  }, child: Text("Try Again"))
                ],
              ),
            );
          }
          List<Source> sources = response?.sources??[];
          return DefaultTabController(
            length: sources.length,
            child: Padding(
              padding: REdgeInsetsDirectional.only(
                  top: 16,
                  start: 16
              ),
              child: Column(
                spacing: 16.h,
                children: [
                  TabBar(
                    isScrollable: true,
                    tabs: sources
                        .map((source) => Tab(text: source.name))
                        .toList(),
                  ),
                  Expanded(child: Padding(
                    padding: REdgeInsetsDirectional.only(end: 16),
                    child: TabBarView(children: sources
                        .map((source) => ArticlesList(sourceId: source.id??"",))
                        .toList()),
                  )),
                ],
              ),
            ),
          );
        },
    )*/;
  }
}
