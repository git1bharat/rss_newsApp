import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rss_newsapp/database/db_heleper.dart';
import 'package:rss_newsapp/logic/bloc/rss_feed_bloc.dart';
import 'package:rss_newsapp/widget/tabview_widget.dart';

class FeedScreen extends StatefulWidget {
  FeedScreen({
    super.key,
  });

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final DataBaseHelper instance = DataBaseHelper.init();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _urlTextController = TextEditingController();
  final TextEditingController _nameTextController = TextEditingController();
  bool isScrollable = true;
  bool showNextIcon = true;
  bool showBackIcon = true;

  final ScrollController _scrollController = ScrollController();

  List<String> categories = ["mint"];
  Map<String, String> categoryUrls = {
    "mint": "https://www.livemint.com/rss/money"
  };

  @override
  void initState() {
    fetchData(categoryUrls[categories.first]!);
    fetchChannelData();
    super.initState();
  }

  void _addNewTab() async {
    final name = _nameTextController.text;
    final url = _urlTextController.text;
    final result = await instance.insertChannel(name, url);
    if (result != -1) {
      setState(() {
        categories.add(name);
        categoryUrls[name] = url;
      });
    }
  }

  void fetchData(String url) {
    final rssbloc = BlocProvider.of<RssFeedBloc>(context);
    rssbloc.add(RssFeedEvent.fetchFeed(url: url));
  }

  void _removeTab(int tabIndex) async {
    final removedCategory = categories.removeAt(tabIndex);
    final removedUrl = categoryUrls.remove(removedCategory);
    await instance.deleteChannel(removedCategory, removedUrl!);
    setState(() {});
  }

  void fetchChannelData() async {
    final List<Map<String, dynamic>> channels =
        await DataBaseHelper.instance.getChannelNamesAndUrls();

    setState(() {
      for (final channel in channels) {
        final name = channel['name'] as String;
        final url = channel['url'] as String;
        categories.add(name);
        categoryUrls[name] = url;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: categories.length,
        child: Scaffold(
            appBar: AppBar(
              title: Center(child: Text('News')),
              backgroundColor: Colors.black,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: TabBar(
                      indicatorWeight: 5,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.deepPurple,
                      labelColor: Colors.white70,
                      unselectedLabelColor: Colors.white30,
                      labelPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 3),
                      isScrollable: true,
                      tabs:
                          List<Widget>.generate(categories.length, (int index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 9.0,
                            right: 9,
                          ),
                          child: GestureDetector(
                              onLongPress: () {
                                _showRemoveDialog(context, index);
                              },
                              child: Tab(text: categories[index])),
                        );
                      }),
                      onTap: (selectedIndex) {
                        String? apiUrl =
                            categoryUrls[categories[selectedIndex]];
                        if (apiUrl != null) {
                          fetchData(apiUrl);
                        } else {
                          print(
                              'API URL is null for selected index: $selectedIndex');
                        }
                      }),
                ),
              ),
            ),
            body: Stack(
              children: [
                TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children:
                      List<Widget>.generate(categories.length, (int index) {
                    return BlocBuilder<RssFeedBloc, RssFeedState>(
                        builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => Container(),
                        initialState: () => const Center(
                          child: FlutterLogo(),
                        ),
                        loadingState: () => const Center(
                          child: Center(child: CircularProgressIndicator()),
                        ),
                        loadedState: (feedList) {
                          return Container(
                              width: 390,
                              height: 500,
                              child: ListView.builder(
                                  controller: _scrollController,
                                  itemCount: feedList.length,
                                  itemBuilder: (context, int index) {
                                    return Column(
                                      children: [
                                        TabWidget(
                                          rssItem: feedList[index],
                                        )
                                      ],
                                    );
                                  }));
                        },
                        errorState: (error) =>
                            Center(child: const Text('Error..')),
                      );
                    });
                  }),
                ),
                Positioned(
                  top: 580,
                  left: 280,
                  child: FloatingActionButton(
                    onPressed: () {
                      _modalSheet(context);
                    },
                    child: Icon(Icons.add),
                  ),
                )
              ],
            )));
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
              child: const Text('unsubscribe'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  _modalSheet(BuildContext context) {
    final rssbloc = BlocProvider.of<RssFeedBloc>(context);
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
                        hintText: 'Enter Channel Name..',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter channel name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _urlTextController,
                      decoration: InputDecoration(
                        hintText: 'Enter RssFeed url..',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
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
                    )
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _addNewTab();

                  rssbloc.add(
                      RssFeedEvent.fetchFeed(url: _urlTextController.text));
                  _nameTextController.clear();
                  _urlTextController.clear();
                  Navigator.pop(context);
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
