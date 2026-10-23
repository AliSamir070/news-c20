import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c20/ui/home/widgets/articles_widget/widgets/article_item.dart';

class ArticlesList extends StatelessWidget {
  const ArticlesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => ArticleItem(),
        separatorBuilder: (context, index) => SizedBox(height: 16.h,),
        itemCount: 10
    );
  }
}
