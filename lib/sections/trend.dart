import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../UI/news_card.dart';
import '../data/news.dart';
import '../model/newsarticle_model.dart';

class TrendPage extends StatefulWidget {
  const TrendPage({Key? key}) : super(key: key);

  @override
  _TrendPageState createState() => _TrendPageState();
}

class _TrendPageState extends State<TrendPage> {
  List<NewsArticle> newsArticle = [];
  bool _loading = true;
  // late List<HeaderMenu> myCategory;
  void newsLoading() async {
    News news = News();
    await news.getNews();
    newsArticle = news.newsList;
    if (this.mounted) {
      setState(
        () {
          _loading = false;
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _loading = true;
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
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 9),
                            child: Text(
                              "Walk with Trend",
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 9,
                            ),
                            child: Text(
                              "Don't stay behind, read the trend",
                              style: TextStyle(fontSize: 17),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 35),
                    _loading
                        ? const SizedBox(
                            height: 300,
                            child: Align(
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(
                                color: Colors.black,
                              ),
                            ),
                          )
                        : Expanded(
                            child: SizedBox(
                              height: 300,
                              width: 335,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return NewsListCard(
                                    imgUrl: newsArticle[index].urlToImage,
                                    title: newsArticle[index].title,
                                    // author: newsArticle[index].author,
                                    content: newsArticle[index].content,
                                    date: newsArticle[index].publshedAt,
                                    postUrl: newsArticle[index].articleUrl,
                                  );
                                },
                                itemCount: newsArticle.length,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
