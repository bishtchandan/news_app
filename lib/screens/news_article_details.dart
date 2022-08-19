import 'package:flutter/material.dart';
import 'package:news_app/view_models/news_article_view_model.dart';
import 'package:news_app/widget/circle_image.dart';

class NewsArticleDetailScreen extends StatelessWidget {
  final NewsArticleViewModel article;
  const NewsArticleDetailScreen({Key? key, required this.article})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(children: [
          CircleAvatar(
            backgroundImage: NetworkImage(article.imageUrl ?? ""),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Author',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              Text(article.author ?? 'undefined'),
            ],
          )
        ]),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 30,
          right: 10,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Stack(
                alignment: Alignment.centerLeft,
                children: const [
                  Divider(
                    height: 60,
                    color: Color(0xffff8a30),
                    thickness: 20,
                  ),
                  Text(
                    'Headlines',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ),
            Text(
              article.title ?? "",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                wordSpacing: 2,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              article.publishedAt ?? '',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: CircleImage(
                imageUrl: article.imageUrl ?? "",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Text(
                  article.content ?? "",
                  style: const TextStyle(
                    fontSize: 16,
                    wordSpacing: 3,
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
