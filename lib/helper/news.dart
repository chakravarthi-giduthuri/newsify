import 'dart:convert';

import 'package:newsify/models/article_model.dart';
import 'package:http/http.dart';

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    Response response = await get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=c9b0e05a012442cb84cacd3a8ff2fd40'));

    Map data = jsonDecode(response.body);
    // print(data);
    if (data['status'] == "ok") {
      data['articles'].forEach((element) {
        if (element['title'] != null &&
            element['content'] != null &&
            element['urlToImage'] != null &&
            element['description'] != null &&
            element['url'] != null) {
          ArticleModel articleModel = ArticleModel(
              author: element['author'],
              title: element['title'],
              description: element['description'],
              content: element['content'],
              url: element['url'],
              urlToImage: element['urlToImage']);
          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    Response response = await get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=c9b0e05a012442cb84cacd3a8ff2fd40'));

    Map data = jsonDecode(response.body);
    // print(data);
    if (data['status'] == "ok") {
      data['articles'].forEach((element) {
        if (element['title'] != null &&
            element['content'] != null &&
            element['urlToImage'] != null &&
            element['description'] != null &&
            element['url'] != null) {
          ArticleModel articleModel = ArticleModel(
              author: element['author'],
              title: element['title'],
              description: element['description'],
              content: element['content'],
              url: element['url'],
              urlToImage: element['urlToImage']);
          news.add(articleModel);
          print(news);
        }
      });
    }
  }
}
