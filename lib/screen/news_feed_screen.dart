// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:rss_newsapp/logic/bloc/rss_feed_bloc.dart';
// import 'package:rss_newsapp/repository/news_repository.dart';

// class NewsFeedScreen extends StatefulWidget {
//   @override
//   _NewsFeedScreenState createState() => _NewsFeedScreenState();
// }

// class _NewsFeedScreenState extends State<NewsFeedScreen>
//     with TickerProviderStateMixin {
//   NewsRepository newsRepository = NewsRepository();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   TextEditingController _urlController = TextEditingController();
//   final int _startingTabCount = 1;

//   List<Tab> _tabs = [];
//   final List<Widget> _generalWidgets = [];
//   late TabController _tabController;

//   List<Tab> _addedTabs = []; // List to store dynamically added tabs

//   @override
//   void initState() {
//     _tabs = getTabs(_startingTabCount);
//     _tabController = getTabController();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final rssbloc = BlocProvider.of<RssFeedBloc>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Dynamic TBV"),
//         bottom: TabBar(
//           tabs: _tabs,
//           controller: _tabController,
//         ),
//         actions: <Widget>[
//           IconButton(
//               icon: Icon(Icons.add),
//               onPressed: () {
//                 rssbloc.add(RssFeedEvent.fetchFeed());
//                 _addAnotherTab();
//               }),
//           IconButton(
//             icon: Icon(Icons.remove),
//             onPressed: _removeTab,
//           ),
//         ],
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: TabBarView(
//               physics: NeverScrollableScrollPhysics(),
//               controller: _tabController,
//               children: getWidgets(),
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(left: 210, bottom: 30),
//             child: FloatingActionButton(
//               onPressed: () {
//                 showModalBottomSheet(
//                     context: context,
//                     builder: (context) {
//                       return Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: <Widget>[
//                           Container(
//                             margin: EdgeInsets.only(top: 50),
//                             child: const Text(
//                               "Subscribe New feed",
//                               style: TextStyle(fontSize: 20),
//                             ),
//                           ),
//                           Container(
//                             margin: const EdgeInsets.only(
//                                 right: 30, left: 30, top: 10),
//                             child: Form(
//                                 child: TextFormField(
//                               controller: _urlController,
//                               decoration: InputDecoration(
//                                   hintText: 'enter url....',
//                                   border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(10))),
//                             )),
//                           ),
//                           ElevatedButton(
//                               onPressed: () {
//                                 rssbloc.add(RssFeedEvent.fetchFeed());
//                                 onPressed:
//                                 _addAnotherTab();
//                                 Navigator.pop(context);
//                               },
//                               child: Text('Submit')),
//                           // ListTile(
//                           //   leading: new Icon(Icons.share),
//                           //   title: new Text('Share'),
//                           //   onTap: () {
//                           //     Navigator.pop(context);
//                           //   },
//                           // ),
//                         ],
//                       );
//                     });
//               },
//               child: const Icon(Icons.add),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   TabController getTabController() {
//     return TabController(length: _tabs.length, vsync: this)
//       ..addListener(_updatePage);
//   }

//   Tab getTab(int widgetNumber) {
//     return Tab(
//       text: "$widgetNumber",
//     );
//   }

//   Widget getWidget(int widgetNumber) {
//     return Center(
//       child: _buildTabView(context),
//     );
//   }

//   // Widget getWidget(int widgetNumber) {
//   //   return Center(
//   //     child: Text("Widget nr: $widgetNumber"),
//   //   );
//   // }

//   List<Tab> getTabs(int count) {
//     _tabs.clear();
//     for (int i = 0; i < count; i++) {
//       _tabs.add(getTab(i));
//     }
//     return _tabs;
//   }

//   List<Widget> getWidgets() {
//     _generalWidgets.clear();
//     for (int i = 0; i < _tabs.length; i++) {
//       _generalWidgets.add(getWidget(i));
//     }
//     return _generalWidgets;
//   }

//   // void _addIfCanAnotherTab() {
//   //   if (_startingTabCount == _tabController.length) {
//   //   } else {
//   //     _addAnotherTab();
//   //   }
//   // }

//   // void _addAnotherTab() {
//   //   _tabs = getTabs(_tabs.length + 1);
//   //   _tabController.index = 0;
//   //   _tabController = getTabController();
//   //   _updatePage();
//   // }
//   void _addAnotherTab({int count = 1}) {
//     for (int i = 0; i < count; i++) {
//       _addedTabs.add(getTab(_tabs.length + i));
//     }
//     _tabs = [..._tabs, ..._addedTabs];
//     _tabController = getTabController();
//     _updatePage();
//   }

//   void _removeTab() {
//     _tabs = getTabs(_tabs.length - 1);
//     _tabController.index = 0;
//     _tabController = getTabController();
//     _updatePage();
//   }

//   void _updatePage() {
//     setState(() {});
//   }

//   //Tab helpers

//   // void showWarningTabAddDialog() {
//   //   showDialog(
//   //       context: context,
//   //       builder: (context) => AlertDialog(
//   //             title: Text("Cannot add more tabs"),
//   //             content: Text("Let's avoid crashing, shall we?"),
//   //             actions: <Widget>[
//   //               ElevatedButton(
//   //                   child: Text("Crash it!"),
//   //                   onPressed: () {
//   //                     _addAnotherTab();
//   //                     Navigator.pop(context);
//   //                   }),
//   //               ElevatedButton(
//   //                   child: Text("Ok"), onPressed: () => Navigator.pop(context))
//   //             ],
//   //           ));
//   // }
// }

