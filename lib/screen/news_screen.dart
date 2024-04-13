import 'package:dart_rss/dart_rss.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:rss_newsapp/logic/bloc/rss_feed_bloc.dart';
import 'package:rss_newsapp/repository/news_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_tabbar/dynamic_tabbar.dart';
import 'package:rss_newsapp/screen/webView_screen.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key, required this.title});
  final String title;

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  RssFeed _rssFeed = RssFeed();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _urlTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  bool isScrollable = true;
  bool showNextIcon = true;
  bool showBackIcon = true;
  Widget? leading;
  Widget? trailing;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.center,
                  ),
                ),
                Expanded(
                  child: DynamicTabBarWidget(
                    dynamicTabs: tabs,
                    isScrollable: isScrollable,
                    onTabControllerUpdated: (controller) {
                      debugPrint("onTabControllerUpdated");
                    },
                    onTabChanged: (index) {
                      debugPrint("Tab changed: $index");
                    },
                    onAddTabMoveTo: MoveToTab.last,
                    showBackIcon: showBackIcon,
                    showNextIcon: showNextIcon,
                    leading: leading,
                    trailing: trailing,
                  ),
                ),
              ],
            ),
            Positioned(
                top: 620,
                right: 20,
                child: Container(
                  margin: EdgeInsets.only(left: 210, bottom: 20),
                  child: FloatingActionButton(
                    onPressed: () {
                      // addTab();
                      _modalSheet(context);
                    },
                    child: Icon(Icons.add),
                  ),
                ))
          ],
        ));
  }

  _modalSheet(BuildContext context) {
    final rssbloc = BlocProvider.of<RssFeedBloc>(context);
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: const Text(
                      "Subscribe New feed",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 30, left: 30, top: 10),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _nameTextController,
                            decoration: InputDecoration(
                                hintText: 'Enter Chanel Name..',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _urlTextController,
                            decoration: InputDecoration(
                                hintText: 'Enter RssFedd url..',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          )
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        addTab();

                        rssbloc.add(RssFeedEvent.submitUrl(
                            url: _urlTextController.text));
                        Navigator.pop(context);
                      },
                      child: Text('Submit')),
                  // ListTile(
                  //   leading: new Icon(Icons.share),
                  //   title: new Text('Share'),
                  //   onTap: () {
                  //     Navigator.pop(context);
                  //   },
                  // ),
                ],
              ),
            ));
    // return showModalBottomSheet(
    //     isScrollControlled: true,
    //     context: context,
    //     builder: (context) {
    //       Padding(
    //         padding: EdgeInsets.only(
    //             bottom: MediaQuery.of(context).viewInsets.bottom),
    //       );
    //       return
    //     });
  }

  void addTab() {
    setState(() {
      var tabNumber = tabs.length + 1;
      var tabName = _nameTextController.text.toString();
      tabs.add(
        TabData(
          index: tabNumber,
          title: Tab(
            child: InkWell(
              child: Text('${tabName} '),
              onLongPress: () {
                removeTab(tabs.length - 1);
              },
            ),
          ),
          content: _buildTabView(context),
        ),
      );
    });
  }

  void removeTab(int id) {
    if (id > 1)
      setState(() {
        tabs.removeAt(id);
      });
  }
}

// String tabName = '';

List<TabData> tabs = [
  // TabData(
  //   index: 1,
  //   title: const Tab(
  //     child: Text('Tab 1'),
  //   ),
  //   content: const Center(child: Text('Content for Tab 1')),
  // ),
  // TabData(
  //   index: 2,
  //   title: const Tab(
  //     child: Text('Tab 2'),
  //   ),
  //   content: const Center(child: Text('Content for Tab 2')),
  // ),
  // Add more tabs as needed
];

Widget _buildTabView(
  BuildContext context,
) {
  return BlocBuilder<RssFeedBloc, RssFeedState>(
    builder: (context, state) {
      return state.when(initialState: () {
        return FlutterLogo();
      }, loadingState: () {
        return Center(child: CircularProgressIndicator());
      }, loadedState: (feedList) {
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
                            return state.when(initialState: () {
                              return const FlutterLogo();
                            }, loadingState: () {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }, loadedState: (newsList) {
                              return Expanded(
                                child: ListView.builder(
                                    itemCount: newsList.length,
                                    itemBuilder: (context, int index) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      WebViewScreen(newsUrl: feedList[index].link.toString(),)));
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
                                                      feedList[index].media !=
                                                              null
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
                            }, errorState: (error) {
                              return const Center(
                                child: Text('Error....'),
                              );
                            });
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
      }, errorState: (error) {
        return const Center(child: Text('Error----'));
      });
    },
  );
}

// class NewsScreen extends StatefulWidget {
//   const NewsScreen({super.key});

//   @override
//   State<NewsScreen> createState() => _NewsScreenState();
// }

// class _NewsScreenState extends State<NewsScreen> {
//   NewsRepository newsRepository = NewsRepository();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   TextEditingController _urlController = TextEditingController();

//   @override
//   initState() {
//     super.initState();
//     newsRepository.fetchRssFeed();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//     );
// return Scaffold(
//     appBar: AppBar(
//       title: Text("Top News"),
//     ),
//     body: BlocBuilder<RssFeedBloc, RssFeedState>(
//       builder: (context, state) {
//         return state.when(initialState: () {
//           return FlutterLogo();
//         }, loadingState: () {
//           return CircularProgressIndicator();
//         }, loadedState: (feedList) {
//           return Column(
//             children: [
//               Container(
//                   margin: const EdgeInsets.only(top: 20),
//                   height: 270,
//                   width: 390,
//                   child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: feedList.length,
//                       // itemBuilder: (context, int index) {
//                       //   return Image.network(feedList[index + 1].media != null
//                       //       ? feedList[index + 1].media!.contents[0].url.toString()
//                       //       : "Null");
//                       // }
//                       itemBuilder: (context, int index) {
//                         if (index < feedList.length) {
//                           print(
//                               'Your image Url is here...${feedList[10].description}');
//                           return Stack(
//                             children: [
//                               Container(
//                                 margin: EdgeInsets.only(left: 7, right: 10),
//                                 decoration: BoxDecoration(
//                                     color: Colors.black,
//                                     borderRadius:
//                                         BorderRadius.circular(16)),
//                                 height: 300,
//                                 width: 340,
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(16),
//                                   child: Image.network(
//                                     feedList[index].media != null
//                                         ? feedList[index]
//                                                 .media!
//                                                 .contents
//                                                 .isNotEmpty
//                                             ? feedList[index]
//                                                 .media!
//                                                 .contents[0]
//                                                 .url
//                                                 .toString()
//                                             : "Null"
//                                         : "Null",
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                               Positioned(
//                                 bottom: 22,
//                                 left: 7,
//                                 child: Container(
//                                   padding: const EdgeInsets.symmetric(
//                                       vertical: 5, horizontal: 10),
//                                   decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius:
//                                           BorderRadius.circular(12)),
//                                   margin: EdgeInsets.only(left: 10),
//                                   height: 110,
//                                   width: 320,
//                                   child: Column(
//                                     children: [
//                                       Text(
//                                         feedList[index].title.toString(),
//                                         style: const TextStyle(
//                                             fontWeight: FontWeight.w100),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               )
//                             ],
//                           );
//                         } else {
//                           // Handle the case where the index is out of range
//                           return SizedBox(); // or any other fallback widget
//                         }
//                       })),
//               Expanded(
//                   child: Container(
//                 margin: const EdgeInsets.only(top: 10, left: 10),
//                 width: 390,
//                 color: Colors.white,
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         const Text(
//                           'Subscribed News',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         const SizedBox(
//                           width: 110,
//                         ),
//                         InkWell(
//                           child: Icon(Icons.add_circle_outline),
//                           onTap: () {
//                             showModalBottomSheet(
//                                 context: context,
//                                 builder: (context) {
//                                   return Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: <Widget>[
//                                       Container(
//                                         margin: EdgeInsets.only(top: 50),
//                                         child: const Text(
//                                           "Subscribe New feed",
//                                           style: TextStyle(fontSize: 20),
//                                         ),
//                                       ),
//                                       Container(
//                                         margin: const EdgeInsets.only(
//                                             right: 30, left: 30, top: 10),
//                                         child: Form(
//                                             child: TextFormField(
//                                           controller: _urlController,
//                                           decoration: InputDecoration(
//                                               hintText: 'enter url....',
//                                               border: OutlineInputBorder(
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           10))),
//                                         )),
//                                       ),
//                                       ElevatedButton(
//                                           onPressed: () {
//                                             Navigator.pop(context);
//                                           },
//                                           child: Text('Submit')),
//                                       // ListTile(
//                                       //   leading: new Icon(Icons.share),
//                                       //   title: new Text('Share'),
//                                       //   onTap: () {
//                                       //     Navigator.pop(context);
//                                       //   },
//                                       // ),
//                                     ],
//                                   );
//                                 });
//                           },
//                         )
//                       ],
//                     ),
//                     Container(
//                       child: BlocBuilder<RssFeedBloc, RssFeedState>(
//                           builder: (context, state) {
//                         return state.when(initialState: () {
//                           return const FlutterLogo();
//                         }, loadingState: () {
//                           return const Center(
//                             child: CircularProgressIndicator(),
//                           );
//                         }, loadedState: (newsList) {
//                           return Expanded(
//                             child: ListView.builder(
//                                 itemCount: newsList.length,
//                                 itemBuilder: (context, int index) {
//                                   return Card(
//                                       child: Container(
//                                     width: 370,
//                                     height: 80,
//                                     child: Column(
//                                       children: [
//                                         Row(
//                                           children: [
//                                             Container(
//                                               width: 80,
//                                               height: 80,
//                                               child: Image.network(
//                                                 feedList[index].media !=
//                                                         null
//                                                     ? feedList[index]
//                                                             .media!
//                                                             .contents
//                                                             .isNotEmpty
//                                                         ? feedList[index]
//                                                             .media!
//                                                             .contents[0]
//                                                             .url
//                                                             .toString()
//                                                         : "Null"
//                                                     : "Null",
//                                                 fit: BoxFit.cover,
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: 5,
//                                             ),
//                                             Expanded(
//                                               child: Text(newsList[index]
//                                                   .title
//                                                   .toString()),
//                                             )
//                                           ],
//                                         )
//                                       ],
//                                     ),
//                                   ));
//                                 }),
//                           );
//                         }, errorState: (error) {
//                           return const Center(
//                             child: Text('Error....'),
//                           );
//                         });
//                       }),
//                     )
//                   ],
//                 ),
//               ))
//             ],
//           );
//         }, errorState: (error) {
//           return const Center(child: Text('Error----'));
//         });
//       },
//     ));
//   }
// }

// ListView.builder(
//                 itemCount: feedList.length,
//                 // itemBuilder: (context, int index) {
//                 //   return Image.network(feedList[index + 1].media != null
//                 //       ? feedList[index + 1].media!.contents[0].url.toString()
//                 //       : "Null");
//                 // }
//                 itemBuilder: (context, int index) {
//                   if (index < feedList.length) {
//                     return Column(
//                       children: [
//                         Text(feedList[index].title.toString()),
//                         Image.network(feedList[index].media != null
//                             ? feedList[index].media!.contents.isNotEmpty
//                                 ? feedList[index]
//                                     .media!
//                                     .contents[0]
//                                     .url
//                                     .toString()
//                                 : "Null"
//                             : "Null"),
//                       ],
//                     );
//                   } else {
//                     // Handle the case where the index is out of range
//                     return SizedBox(); // or any other fallback widget
//                   }
//                 }),
