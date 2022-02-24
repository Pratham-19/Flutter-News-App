import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../apiKey.dart';
import '../model/newsarticle_model.dart';

class News {
  List<NewsArticle> newsList = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?sources=google-news-in,google-news,cnn&apiKey=$apiKey";
    // "https://newsapi.org/v2/top-headlines/sources?language=en&apiKey=$apiKey";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach(
        (element) {
          if (element['urlToImage'] != null &&
                  element['description'] != null &&
                  element['content'] != null
              // element['author'] != null
              ) {
            NewsArticle article = NewsArticle(
              title: element['title'],
              // author: element['author'],
              description: element['description'],
              urlToImage: element['urlToImage'],
              publshedAt: DateTime.parse(element['publishedAt']),
              content: element["content"],
              articleUrl: element["url"],
            );
            newsList.add(article);
          }
        },
      );
    }
  }
}

class NewsForCategory {
  List<NewsArticle> newsList = [];

  Future<void> getNewsForCategory(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=$apiKey";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null &&
                element['description'] != null &&
                element['content'] != null
            // element['author'] != null
            ) {
          NewsArticle article = NewsArticle(
            title: element['title'],
            // author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          newsList.add(article);
        }
      });
    }
  }
}

class NewsSearchBar {
  List<NewsArticle> newsList = [];

  Future<void> getNews(String searchKeyword) async {
    String url =
        "https://newsapi.org/v2/everything?q=$searchKeyword&from=${DateFormat('yyyy-MM-dd').format(DateTime.now())}&sortBy=popularity&language=en&apiKey=$apiKey";

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach(
        (element) {
          if (element['urlToImage'] != null &&
                  element['description'] != null &&
                  element['content'] != null
              // element['author'] != null
              ) {
            NewsArticle article = NewsArticle(
              title: element['title'],
              // author: element['author'],
              description: element['description'],
              urlToImage: element['urlToImage'],
              publshedAt: DateTime.parse(element['publishedAt']),
              content: element["content"],
              articleUrl: element["url"],
            );
            newsList.add(article);
          }
        },
      );
    }
  }
}
