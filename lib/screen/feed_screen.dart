import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rss_newsapp/database/db_heleper.dart';
import 'package:rss_newsapp/logic/bloc/rss_feed_bloc.dart';
import 'package:rss_newsapp/widget/tabview_widget.dart';

class FeedScreen extends StatefulWidget {
  FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;
  final DataBaseHelper instance = DataBaseHelper.init();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _urlTextController = TextEditingController();
  final TextEditingController _nameTextController = TextEditingController();
  List<String> categories = ["mint"];
  Map<String, String> categoryUrls = {
    "mint": "https://www.livemint.com/rss/money"
  };

  @override
  void initState() {
    super.initState();
    if (categories.isNotEmpty) {
      _tabController = TabController(
          vsync: this, length: categories.length, initialIndex: 0);
      _pageController = PageController(initialPage: 0);
      fetchData(categoryUrls[categories[0]]!); // Load data for the initial tab
    }
    fetchChannelData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _addNewTab() async {
    final name = _nameTextController.text;
    final url = _urlTextController.text;
    final result = await instance.insertChannel(name, url);
    if (result != -1) {
      setState(() {
        categories.add(name);
        categoryUrls[name] = url;
        _tabController.dispose();
        _tabController = TabController(length: categories.length, vsync: this);
        _pageController.dispose();
        _pageController = PageController(initialPage: categories.length - 1);
        fetchData(url);
      });
    }
  }

  void fetchData(String url) {
    final rssBloc = BlocProvider.of<RssFeedBloc>(context);
    rssBloc.add(RssFeedEvent.fetchFeed(url: url));
  }

  void _removeTab(int tabIndex) async {
    final removedCategory = categories.removeAt(tabIndex);
    final removedUrl = categoryUrls.remove(removedCategory);
    await instance.deleteChannel(removedCategory, removedUrl!);

    int newIndex = tabIndex - 1; // Adjust the index to stay within bounds
    if (newIndex < 0 && categories.isNotEmpty) {
      newIndex = 0; // If all tabs are not removed, reset to the first tab
    }

    setState(() {
      _tabController.dispose();
      _pageController.dispose();
      _tabController = TabController(
          vsync: this, length: categories.length, initialIndex: newIndex);
      _pageController = PageController(initialPage: newIndex);

      if (categories.isNotEmpty) {
        fetchData(categoryUrls[
            categories[newIndex]]!); // Fetch data for the new current tab
      }
    });
  }

  void fetchChannelData() async {
    final List<Map<String, dynamic>> channels =
        await instance.getChannelNamesAndUrls();
    setState(() {
      for (final channel in channels) {
        final name = channel['name'] as String;
        final url = channel['url'] as String;
        categories.add(name);
        categoryUrls[name] = url;
      }
      _tabController = TabController(length: categories.length, vsync: this);
      _pageController = PageController();
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(390, 844));

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('News')),
        backgroundColor: Colors.black,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: TabBar(
            controller: _tabController,
            indicatorWeight: 5.r,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.deepPurple,
            labelColor: Colors.white70,
            unselectedLabelColor: Colors.white30,
            labelPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 3.w),
            isScrollable: true,
            tabs: List<Widget>.generate(categories.length, (int index) {
              return Padding(
                padding: EdgeInsets.only(left: 9.w, right: 9.w),
                child: GestureDetector(
                  onLongPress: () => _showRemoveDialog(context, index),
                  child: Tab(text: categories[index]),
                ),
              );
            }),
            onTap: (index) {
              _pageController.jumpToPage(index);
            },
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          _tabController.animateTo(index);
          String? apiUrl = categoryUrls[categories[index]];
          if (apiUrl != null) {
            fetchData(apiUrl);
          } else {
            print('API URL is null for selected index: $index');
          }
        },
        children: List<Widget>.generate(categories.length, (index) {
          return BlocBuilder<RssFeedBloc, RssFeedState>(
            builder: (context, state) {
              return state.maybeWhen(
                loadedState: (rssFeedItem) => ListView.builder(
                  itemCount: rssFeedItem.length,
                  itemBuilder: (context, itemIndex) =>
                      TabWidget(rssItem: rssFeedItem[itemIndex]),
                ),
                orElse: () => const Center(child: CircularProgressIndicator()),
              );
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _modalSheet(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showRemoveDialog(BuildContext context, int tabIndex) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content:
              const Text('Are you sure you want to unsubscribe this news?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                _removeTab(tabIndex);
                Navigator.of(context).pop();
              },
              child: const Text('Unsubscribe'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  _modalSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) => Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20.w,
            right: 20.w,
            top: 20.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20.h),
              Text(
                "Subscribe New Feed",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 20.h),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameTextController,
                      decoration: InputDecoration(
                        labelText: 'Channel Name',
                        hintText: 'Enter channel name',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter channel name' : null,
                    ),
                    SizedBox(height: 20.h),
                    TextFormField(
                      controller: _urlTextController,
                      decoration: InputDecoration(
                        labelText: 'RSS Feed URL',
                        hintText: 'Enter RSS feed URL',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter RSS feed URL';
                        }
                        RegExp regex = RegExp(
                            r'^(http|https):\/\/[^ "]+(\.[^ "]+)+[^ "]*\/?(rss|feed)([^ "]+)?$',
                            caseSensitive: false);
                        if (!regex.hasMatch(value)) {
                          return 'Please enter a valid RSS feed URL';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _addNewTab();
                          _nameTextController.clear();
                          _urlTextController.clear();
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 12.h, horizontal: 30.w),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                    ),
                    SizedBox(height: 20.h),
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







// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:rss_newsapp/database/db_heleper.dart';
// import 'package:rss_newsapp/logic/bloc/rss_feed_bloc.dart';
// import 'package:rss_newsapp/widget/tabview_widget.dart';

// class FeedScreen extends StatefulWidget {
//   FeedScreen({Key? key}) : super(key: key);

//   @override
//   State<FeedScreen> createState() => _FeedScreenState();
// }

// class _FeedScreenState extends State<FeedScreen> with TickerProviderStateMixin {
//   late TabController _tabController;
//   final DataBaseHelper instance = DataBaseHelper.init();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _urlTextController = TextEditingController();
//   final TextEditingController _nameTextController = TextEditingController();
//   List<String> categories = ["mint"];
//   Map<String, String> categoryUrls = {
//     "mint": "https://www.livemint.com/rss/money"
//   };

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: categories.length, vsync: this);
//     fetchData(categoryUrls[categories.first]!);
//     fetchChannelData();
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   void _addNewTab() async {
//     final name = _nameTextController.text;
//     final url = _urlTextController.text;
//     final result = await instance.insertChannel(name, url);
//     if (result != -1) {
//       setState(() {
//         categories.add(name);
//         categoryUrls[name] = url;
//         _tabController.dispose();
//         _tabController = TabController(length: categories.length, vsync: this);
//         _tabController.animateTo(categories.length - 1);
//         fetchData(url);
//       });
//     }
//   }

//   void fetchData(String url) {
//     final rssBloc = BlocProvider.of<RssFeedBloc>(context);
//     rssBloc.add(RssFeedEvent.fetchFeed(url: url));
//   }

//   void _removeTab(int tabIndex) async {
//     final removedCategory = categories.removeAt(tabIndex);
//     final removedUrl = categoryUrls.remove(removedCategory);
//     await instance.deleteChannel(removedCategory, removedUrl!);
//     setState(() {
//       _tabController.dispose();
//       _tabController = TabController(length: categories.length, vsync: this);
//     });
//   }

//   void fetchChannelData() async {
//     final List<Map<String, dynamic>> channels =
//         await instance.getChannelNamesAndUrls();
//     setState(() {
//       for (final channel in channels) {
//         final name = channel['name'] as String;
//         final url = channel['url'] as String;
//         categories.add(name);
//         categoryUrls[name] = url;
//       }
//       _tabController = TabController(length: categories.length, vsync: this);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     ScreenUtil.init(context, designSize: const Size(390, 844));

//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(child: Text('News')),
//         backgroundColor: Colors.black,
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(kToolbarHeight),
//           child: TabBar(
//             controller: _tabController,
//             indicatorWeight: 5.r,
//             indicatorSize: TabBarIndicatorSize.label,
//             indicatorColor: Colors.deepPurple,
//             labelColor: Colors.white70,
//             unselectedLabelColor: Colors.white30,
//             labelPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 3.w),
//             isScrollable: true,
//             tabs: List<Widget>.generate(categories.length, (int index) {
//               return Padding(
//                 padding: EdgeInsets.only(left: 9.w, right: 9.w),
//                 child: GestureDetector(
//                   onLongPress: () => _showRemoveDialog(context, index),
//                   child: Tab(text: categories[index]),
//                 ),
//               );
//             }),
//             onTap: (selectedIndex) {
//               _tabController.animateTo(selectedIndex);
//               String? apiUrl = categoryUrls[categories[selectedIndex]];
//               if (apiUrl != null) {
//                 fetchData(apiUrl);
//               } else {
//                 print('API URL is null for selected index: $selectedIndex');
//               }
//             },
//           ),
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: List<Widget>.generate(categories.length, (int index) {
//           return BlocBuilder<RssFeedBloc, RssFeedState>(
//             builder: (context, state) {
//               return state.maybeWhen(
//                 loadedState: (rssFeedItem) => ListView.builder(
//                   itemCount: rssFeedItem.length,
//                   itemBuilder: (context, itemIndex) =>
//                       TabWidget(rssItem: rssFeedItem[itemIndex]),
//                 ),
//                 orElse: () => const Center(child: CircularProgressIndicator()),
//               );
//             },
//           );
//         }),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _modalSheet(context),
//         child: const Icon(Icons.add),
//       ),
//     );
//   }

//   void _showRemoveDialog(BuildContext context, int tabIndex) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           content:
//               const Text('Are you sure you want to unsubscribe this news?'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 _removeTab(tabIndex);
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Unsubscribe'),
//             ),
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: const Text('Cancel'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   _modalSheet(BuildContext context) {
//     return showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (context) => Padding(
//         padding:
//             EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Container(
//               margin: EdgeInsets.only(top: 50.h),
//               child:
//                   Text("Subscribe New feed", style: TextStyle(fontSize: 20.sp)),
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       controller: _nameTextController,
//                       decoration: InputDecoration(
//                         hintText: 'Enter Channel Name..',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.r),
//                         ),
//                       ),
//                       validator: (value) =>
//                           value!.isEmpty ? 'Please enter channel name' : null,
//                     ),
//                     SizedBox(height: 10.h),
//                     TextFormField(
//                       controller: _urlTextController,
//                       decoration: InputDecoration(
//                         hintText: 'Enter RssFeed url..',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.r),
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Please enter RSS feed URL';
//                         }
//                         RegExp regex = RegExp(
//                             r'^(http|https):\/\/[^ "]+(\.[^ "]+)+[^ "]*\/?(rss|feed)([^ "]+)?$',
//                             caseSensitive: false);
//                         if (!regex.hasMatch(value)) {
//                           return 'Please enter a valid RSS feed URL';
//                         }
//                         return null;
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   _addNewTab();
//                   Navigator.pop(context);
//                 }
//               },
//               child: const Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
