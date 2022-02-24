import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsbuddy/UI/news_card.dart';
import 'package:newsbuddy/data/news.dart';
import '../model/newsarticle_model.dart';

class SearchPage extends StatefulWidget {
  String searchKewyword;
  SearchPage({Key? key, required this.searchKewyword}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<NewsArticle> newsArticle = [];
  bool _loading = true;
  // late List<HeaderMenu> myCategory;
  void newsLoading() async {
    NewsSearchBar news = NewsSearchBar();

    await news.getNews(widget.searchKewyword);
    newsArticle = news.newsList;
    setState(
      () {
        _loading = false;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _loading = true;
    print(widget.searchKewyword);
    newsLoading();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "News Buddy",
      theme: ThemeData(
        // textTheme: GoogleFonts.ubuntuTextTheme(),
        textTheme: GoogleFonts.poppinsTextTheme(),
        // primaryColor: Colors.white,
      ),
      home: Scaffold(
        body: _loading
            ? const Center(
                child: CircularProgressIndicator(color: Colors.black),
              )
            : SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 15),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Showing results for \"${widget.searchKewyword}\"",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: newsArticle.length,
                        itemBuilder: ((context, index) {
                          return NewsListCard(
                              postUrl: newsArticle[index].articleUrl,
                              imgUrl: newsArticle[index].urlToImage,
                              title: newsArticle[index].title,
                              content: newsArticle[index].content,
                              date: newsArticle[index].publshedAt);
                        }),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
