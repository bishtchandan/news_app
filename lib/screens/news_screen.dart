import 'package:flutter/material.dart';
import 'package:news_app/utills/constants.dart';
import 'package:news_app/view_models/new_article_list_view_model.dart';
import 'package:news_app/widget/news_grid.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .topHeadLines();
  }

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (country){
              listViewModel.topCountryHeadLines(Constants.Countries[country]??'');
            },
            icon: const Icon(Icons.more_vert), 
            itemBuilder: (_) {
              return Constants.Countries.keys
                  .map(
                    (v) => PopupMenuItem(
                      value: v,
                      child: Text(v),
                    ),
                  )
                  .toList();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                "News",
                style: TextStyle(fontSize: 50),
              ),
            ),
            const Divider(
              color: Color(0xffff8a30),
              height: 40,
              thickness: 8,
              indent: 30,
              endIndent: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 30,
                bottom: 15,
                top: 15,
              ),
              child: Text(
                "Headlines",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: NewsGrid(articles: listViewModel.articles),
            ),
          ],
        ),
      ),
    );
  }
}
