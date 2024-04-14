import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewScreen extends StatefulWidget {
  WebViewScreen({super.key, required this.newsUrl});
  final String newsUrl;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
  late InAppWebViewController _inAppWebViewController;
}

class _WebViewScreenState extends State<WebViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        child: Stack(
          children: [
            InAppWebView(
                initialUrlRequest: URLRequest(url: WebUri(widget.newsUrl))),
          ],
        ),
      ),
    );
  }
}
