import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_rss/domain/rss_item.dart';
import 'package:flutter/material.dart';
import 'package:rss_newsapp/screen/webView_screen.dart';

class TabWidget extends StatefulWidget {
  const TabWidget({super.key, required this.rssItem});
  final RssItem rssItem;

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => WebViewScreen(
                      newsUrl: widget.rssItem.link.toString(),
                    )));
          },
          child: Card(
              child: Container(
            width: 370,
            height: 80,
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(10)),
                      child: SizedBox(
                          width: 80,
                          height: 80,
                          child: widget.rssItem.media != null &&
                                  widget.rssItem.media!.contents.isNotEmpty &&
                                  widget.rssItem.media!.contents[0].url != null
                              ? CachedNetworkImage(
                                  imageUrl: widget
                                      .rssItem.media!.contents[0].url
                                      .toString(),
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                )
                              : Container()),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(widget.rssItem.title.toString(), maxLines: 2),
                    )
                  ],
                )
              ],
            ),
          )),
        ),
      ],
    );
  }
}
