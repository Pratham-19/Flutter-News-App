import 'package:flutter/material.dart';
import 'package:newsbuddy/UI/article_view.dart';

class NewsListCard extends StatelessWidget {
  final String title;
  final String content;
  final String postUrl;
  final String imgUrl;
  final DateTime date;
  const NewsListCard({
    Key? key,
    required this.imgUrl,
    required this.title,
    // required this.author,
    required this.content,
    required this.date,
    required this.postUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleView(
                postUrl: postUrl,
                title: title,
                // author: author,
                content: content,
                date: date,
                imagePath: imgUrl),
          ),
        );
        // context: context,
        // builder: (_) {
        //   return ArticleView(
        //       postUrl: postUrl,
        //       title: title,
        //       // author: author,
        //       content: content,
        //       date: date,
        //       imagePath: imgUrl);
        // });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(122, 235, 233, 233),
          ),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.s,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 5, top: 12, bottom: 5, left: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imgUrl,
                    height: 200,
                    width: 310,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              // Divider(
              //   color: Colors.black,
              //   height: 5,
              // ),
              SizedBox(
                width: 315,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                  child: Text(
                    title,
                    // maxLines: 4,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.only(
          //           right: 11, top: 17, bottom: 13, left: 9),
          //       child: ClipRRect(
          //         borderRadius: BorderRadius.circular(10),
          //         child: Image.network(
          //           imgUrl,
          //           height: 100,
          //           width: 90,
          //           fit: BoxFit.cover,
          //         ),
          //       ),
          //     ),
          //     SizedBox(
          //       width: 210,
          //       child: Padding(
          //         padding:
          //             const EdgeInsets.symmetric(vertical: 19, horizontal: 5),
          //         child: Text(
          //           title,
          //           // maxLines: 4,
          //           textAlign: TextAlign.start,
          //           style: const TextStyle(
          //               fontSize: 14, fontWeight: FontWeight.w500),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
