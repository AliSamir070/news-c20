import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c20/core/resources/app_constants.dart';
import 'package:news_c20/ui/home/widgets/articles_widget/widgets/articles_list.dart';

class ArticlesWidget extends StatelessWidget {
  const ArticlesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: AppConstants.dummySourcesList.length,
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
              tabs: AppConstants.dummySourcesList
                  .map((source) => Tab(text: source))
                  .toList(),
            ),
            Expanded(child: Padding(
              padding: REdgeInsetsDirectional.only(end: 16),
              child: TabBarView(children: AppConstants.dummySourcesList
                  .map((source) => ArticlesList())
                  .toList()),
            )),
          ],
        ),
      ),
    );
  }
}
