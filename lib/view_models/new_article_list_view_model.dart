import 'package:flutter/material.dart';
import 'package:news_app/models/news_article.dart';
import 'package:news_app/service/webservice.dart';
import 'package:news_app/view_models/news_article_view_model.dart';

enum LoadingStatus {
  completed,
  searching,
  empty
}

class NewsArticleListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<NewsArticleViewModel> articles = <NewsArticleViewModel>[];

  void topCountryHeadLines(String country) async {
    List<NewsArticle> newsArticles = await WebService().fetchTopHeadLinesCountry(country);
    loadingStatus = LoadingStatus.searching;
    articles = newsArticles.map((article) => NewsArticleViewModel(article: article)).toList();
    if(articles.isEmpty){
      loadingStatus = LoadingStatus.empty;
    }
    else{
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
  void topHeadLines() async {
    List<NewsArticle> newsArticles = await WebService().fetchTopHeadLines();
    loadingStatus = LoadingStatus.searching;
    articles = newsArticles.map((article) => NewsArticleViewModel(article: article)).toList();
    if(articles.isEmpty){
      loadingStatus = LoadingStatus.empty;
    }
    else{
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}