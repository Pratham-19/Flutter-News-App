class NewsArticle {
  String title;
  // String author;
  String description;
  String urlToImage;
  DateTime publshedAt;
  String content;
  String articleUrl;

  NewsArticle({
    required this.title,
    required this.description,
    // required this.author,
    required this.content,
    required this.publshedAt,
    required this.urlToImage,
    required this.articleUrl,
  });
}
