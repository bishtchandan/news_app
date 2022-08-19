import 'package:flutter/material.dart';
import 'package:news_app/screens/news_screen.dart';
import 'package:news_app/view_models/new_article_list_view_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xfffefdfd),
        appBarTheme: const AppBarTheme(
          color: Color(0xfffefdfd),
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      home:  MultiProvider(
        providers:[
          ChangeNotifierProvider(create: (_)=>NewsArticleListViewModel(),)
        ],
        child: const NewsScreen(),),
    );
  }
}