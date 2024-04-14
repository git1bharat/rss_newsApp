import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rss_newsapp/logic/bloc/rss_feed_bloc.dart';
import 'package:rss_newsapp/screen/webView_screen.dart';

class TabViewWidget extends StatefulWidget {
  const TabViewWidget({super.key});

  @override
  State<TabViewWidget> createState() => _TabViewWidgetState();
}

class _TabViewWidgetState extends State<TabViewWidget> {
  @override
  Widget build(BuildContext context) {
    return   BlocBuilder<RssFeedBloc, RssFeedState>(
    builder: (context, state) {
      return state.maybeWhen(
        initialState: () {
          return FlutterLogo();
        },
        loadingState: () {
          return Center(child: CircularProgressIndicator());
        },
        loadedState: (feedList) {
          return Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: 270,
                  width: 390,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: feedList.length,
                      // itemBuilder: (context, int index) {
                      //   return Image.network(feedList[index + 1].media != null
                      //       ? feedList[index + 1].media!.contents[0].url.toString()
                      //       : "Null");
                      // }
                      itemBuilder: (context, int index) {
                        if (index < feedList.length) {
                          print('Your image Url is here...${feedList[2].link}');
                          return Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 7, right: 10),
                                decoration: BoxDecoration(
                                    // color: Colors.black,
                                    borderRadius: BorderRadius.circular(16)),
                                height: 300,
                                width: 340,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(
                                    feedList[index].title != null
                                        ? feedList[index]
                                                .media!
                                                .contents
                                                .isNotEmpty
                                            ? feedList[index]
                                                .media!
                                                .contents[0]
                                                .url
                                                .toString()
                                            : "Null"
                                        : "Null",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 22,
                                left: 7,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12)),
                                  margin: EdgeInsets.only(left: 10),
                                  height: 110,
                                  width: 320,
                                  child: Column(
                                    children: [
                                      Text(
                                        feedList[index].title.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w100),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        } else {
                          // Handle the case where the index is out of range
                          return SizedBox(); // or any other fallback widget
                        }
                      })),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 10, left: 10),
                  width: 390,
                  // color: Colors.white,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          const Row(
                            children: [
                              Text(
                                'Subscribed News',
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                width: 110,
                              ),
                            ],
                          ),
                          Container(
                            child: BlocBuilder<RssFeedBloc, RssFeedState>(
                                builder: (context, state) {
                              return state.maybeWhen(
                                initialState: () {
                                  return const FlutterLogo();
                                },
                                loadingState: () {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                                loadedState: (newsList) {
                                  return Expanded(
                                    child: ListView.builder(
                                        itemCount: newsList.length,
                                        itemBuilder: (context, int index) {
                                          return InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          WebViewScreen(
                                                            newsUrl:
                                                                feedList[index]
                                                                    .link
                                                                    .toString(),
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
                                                      Container(
                                                        width: 80,
                                                        height: 80,
                                                        child: Image.network(
                                                          feedList[index]
                                                                      .media !=
                                                                  null
                                                              ? feedList[index]
                                                                      .media!
                                                                      .contents
                                                                      .isNotEmpty
                                                                  ? feedList[
                                                                          index]
                                                                      .media!
                                                                      .contents[
                                                                          0]
                                                                      .url
                                                                      .toString()
                                                                  : "Null"
                                                              : "Null",
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                            newsList[index]
                                                                .title
                                                                .toString(),
                                                            maxLines: 2),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )),
                                          );
                                        }),
                                  );
                                },
                                errorState: (error) {
                                  return const Center(
                                    child: Text('Error....'),
                                  );
                                },
                                orElse: () => Container(),
                              );
                            }),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        errorState: (error) {
          return const Center(child: Text('Error----'));
        },
        orElse: () {
          return Container();
        },
      );
    },
  );
  }
}