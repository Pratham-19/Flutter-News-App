// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsbuddy/UI/category_menu.dart';
import 'package:newsbuddy/UI/news_card.dart';
import 'package:newsbuddy/UI/search_page.dart';
import 'package:newsbuddy/data/category_menu_data.dart';
import 'package:newsbuddy/model/newsarticle_model.dart';
import 'package:intl/intl.dart';
// import 'package:intl';
import 'data/news.dart';
import 'model/category_menu_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final newsController = TextEditingController();
  var time = TimeOfDay.fromDateTime(DateTime.now());
  var date = DateTime.now();
  String heading(time) {
    if (time < 13) {
      return "Good Morning";
    } else if (time < 18) {
      return "Good Afternoon";
    }
    return "Good Evening";
  }

  String category = "general";
  List<NewsArticle> newsArticle = [];
  bool _loading = true;
  List<HeaderMenu> myCategory;
  void newsLoading() async {
    NewsForCategory news = NewsForCategory();
    await news.getNewsForCategory(category);
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
    myCategory = headerMenu();
    newsLoading();
  }

  void categoryChange(String cat) {
    setState(() {
      category = cat;
      _loading = true;
    });
    newsLoading();
  }

  // listGenerator(List<NewsArticle> newsArticle) {
  //   for (int i = 0; i < newsArticle.length; i++) {
  //     NewsListCard(
  //       imgUrl: newsArticle[i].urlToImage,
  //       title: newsArticle[i].title,
  //       // author: newsArticle[index].author,
  //       content: newsArticle[i].content,
  //       date: newsArticle[i].publshedAt,
  //       // posturl: article[index].articleUrl,
  //     );
  //   }
  // }

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
        appBar: AppBar(
          toolbarHeight: 80,
          actions: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 9, top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat("d MMM ").format(date),
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(),
                      child: Text(DateFormat('EEE').format(date),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 18)),
                    )
                  ],
                ),
              ),
            )
          ],
          elevation: 0,
          backgroundColor: const Color.fromARGB(120, 255, 255, 255),
          title: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Container(
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(153, 209, 207, 207),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      // suffixIcon: Icon(CupertinoIcons.search),
                      suffixIcon: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchPage(
                                    searchKewyword: newsController.text),
                              ),
                            );
                          },
                          icon: const Icon(CupertinoIcons.search)),
                      hintText: "Search News",
                      border: InputBorder.none,
                    ),
                    controller: newsController,
                    onEditingComplete: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SearchPage(searchKewyword: newsController.text),
                        ),
                      );
                      // SearchPage(
                      //   searchKewyword: newsController.toString(),
                      // );
                    },
                    // onChanged: (keyword) {
                    //   SearchPage(
                    //     searchKewyword: keyword,
                    //   );
                    // enableIMEPersonalizedLearning: true,
                  ),
                ),
              ),
            ),
          ),
        ),
        body:
            // SingleChildScrollView(
            SingleChildScrollView(
          // slivers: [
          // const SliverAppBar(
          //   backgroundColor: Color.fromARGB(153, 209, 207, 207),
          //   expandedHeight: 200,
          //   pinned: true,
          //   flexibleSpace: FlexibleSpaceBar(
          //     title: Align(
          //       alignment: Alignment.centerLeft,
          //       child: Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          //         child: Text(
          //           "Top reads of the day",
          //           style: TextStyle(fontSize: 23),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // SliverToBoxAdapter(
          //     child: Column(
          //   children: [
          //     Align(
          //       alignment: Alignment.topLeft,
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         // mainAxisAlignment: MainAxisAlignment.start,
          //         children: [
          //           const SizedBox(
          //             height: 12,
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.only(left: 12),
          //             child: Text(
          //               heading(time.hour),
          //               style: const TextStyle(fontSize: 30),
          //             ),
          //           ),
          //           const Padding(
          //             padding: EdgeInsets.only(
          //               left: 12,
          //             ),
          //             child: Text(
          //               "Explore the world by one click",
          //               style: TextStyle(fontSize: 17),
          //             ),
          //           )
          //         ],
          //       ),
          //     ),
          //     const SizedBox(
          //       height: 33,
          //     ),
          //     Expanded(
          //       // child: SizedBox(
          //       //   height: 170,
          //       child: ListView.builder(
          //         shrinkWrap: true,
          //         scrollDirection: Axis.horizontal,
          //         itemCount: myCategory.length,
          //         itemBuilder: (context, index) {
          //           return TopCategoryMenu(
          //             imagePath: myCategory[index].imagePath,
          //             title: myCategory[index].title,
          //             categoryChange: categoryChange,
          //           );
          //         },
          //       ),
          //       // ),
          //     ),
          //     const Align(
          //       alignment: Alignment.centerLeft,
          //       child: Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          //         child: Text(
          //           "Top reads of the day",
          //           style: TextStyle(fontSize: 23),
          //         ),
          //       ),
          //     ),
          //   ],
          // )),
          // _loading
          //     ? const SliverToBoxAdapter(
          //         child: SizedBox(
          //           height: 300,
          //           child: Align(
          //             alignment: Alignment.center,
          //             child: CircularProgressIndicator(
          //               color: Colors.black,
          //             ),
          //           ),
          //         ),
          //       )
          //     : SliverList(
          //         delegate: SliverChildBuilderDelegate(
          //         (context, index) {
          //           return NewsListCard(
          //             imgUrl: newsArticle[index].urlToImage,
          //             title: newsArticle[index].title,
          //             // author: newsArticle[index].author,
          //             content: newsArticle[index].content,
          //             date: newsArticle[index].publshedAt,
          //           );
          //           // posturl: article[index].articleUrl,
          //         },
          //         childCount: newsArticle.length,
          //       )),
          // SliverFillRemaining(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          heading(time.hour),
                          style: const TextStyle(fontSize: 30),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 12,
                        ),
                        child: Text(
                          "Explore the world by one click",
                          style: TextStyle(fontSize: 17),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 33,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.5,
                  // child: SizedBox(
                  //   height: 170,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: myCategory.length,
                    itemBuilder: (context, index) {
                      return TopCategoryMenu(
                        imagePath: myCategory[index].imagePath,
                        title: myCategory[index].title,
                        categoryChange: categoryChange,
                      );
                    },
                  ),
                  // ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                    child: Text(
                      "Top reads of the day",
                      style: TextStyle(fontSize: 23),
                    ),
                  ),
                ),
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
                        // child: listGenerator(newsArticle),
                        // SizedBox(
                        //   height: 300,
                        //   width: 335,
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
                        // ),
                      ),
              ],
            ),
          ),

          // ],
        ),
      ),

      // ),
    );
  }
}
