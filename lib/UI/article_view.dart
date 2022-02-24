import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String title;
  final String content;
  final String postUrl;
  final String imagePath;
  final DateTime date;

  const ArticleView({
    Key? key,
    required this.title,
    required this.postUrl,
    required this.content,
    required this.date,
    required this.imagePath,
  }) : super(key: key);

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: WebView(
            initialUrl: widget.postUrl,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
          ),
        ),
      ),
    );
    // @override
    // Widget build(BuildContext context) {
    //   return AlertDialog(
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //     // insetPadding: EdgeInsets.zero,
    //     contentPadding: EdgeInsets.zero,
    //     // actions: [
    //     //   IconButton(
    //     //       onPressed: () => Navigator.of(context).pop(),
    //     //       icon: const Icon(Icons.arrow_back))
    //     // ],
    //     scrollable: true,
    //     content: Container(
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //       height: MediaQuery.of(context).size.height,
    //       width: MediaQuery.of(context).size.width,
    //       child: WebView(
    //         // onProgress: (_) => CircularProgressIndicator(),
    //         initialUrl: widget.postUrl,
    //         onWebViewCreated: (WebViewController webViewController) {
    //           _controller.complete(webViewController);
    //         },
    //       ),
    //     ),
    //     // Stack(
    //   children: [
    //     ClipRRect(
    //       borderRadius: BorderRadius.circular(10),
    //       child: Image.network(
    //         widget.imagePath,
    //         // height: 200,
    //         width: 310,
    //         fit: BoxFit.cover,
    //       ),
    //     ),
    //     Container(
    //       decoration: BoxDecoration(
    //         color: Colors.black26,
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //       child: Column(
    //         children: [
    //           Text(widget.title),
    //           // Text(author),
    //           Text(widget.content)
    //         ],
    //       ),
    //     ),
    //   ],
    // ),
    // );
  }
}
