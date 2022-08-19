import 'package:flutter/material.dart';
import 'package:news_app/view_models/news_article_view_model.dart';
import 'package:news_app/widget/circle_image.dart';

import '../screens/news_article_details.dart';

class NewsGrid extends StatelessWidget {
  final List<NewsArticleViewModel> articles;
  const NewsGrid({Key? key, required this.articles}) : super(key: key);

  void _showNewsArticleDetials(context, article) {
    Navigator.push(context, MaterialPageRoute(builder: (_){
      return NewsArticleDetailScreen(article: article,);
    }),);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (_, index) {
        var article = articles[index];
        return GestureDetector(
          onTap: (){
            _showNewsArticleDetials(context, article);
          },
          child: GridTile(
            footer: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15,),
              child: Text(
                article.title ?? "",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              child: CircleImage(
                imageUrl: article.imageUrl ?? "",
              ),
            ),
          ),
        );
      },
      itemCount: articles.length,
    );
  }
}
