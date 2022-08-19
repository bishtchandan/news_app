import 'package:dio/dio.dart';

import '../models/news_article.dart';
import '../utills/constants.dart';

class WebService {
  var dio = Dio();

  Future<List<NewsArticle>> fetchTopHeadLinesCountry(String country) async {
    final response = await dio.get(Constants.headlinesFor(country));
    print('response:$response');
    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("failed to get Top news");
    }
  }

  Future<List<NewsArticle>> fetchTopHeadLines() async {
    final response = await dio.get(Constants.topHeadingUrl);
    print('response:$response');
    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("failed to get Top news");
    }
  }
}
