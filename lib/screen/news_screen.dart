import 'package:dynamic_tabbar/dynamic_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rss_newsapp/logic/bloc/rss_feed_bloc.dart';
import 'package:rss_newsapp/widget/tab_view_widget.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key, required this.title});
  final String title;

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _urlTextController = TextEditingController();
  final TextEditingController _nameTextController = TextEditingController();
  bool isScrollable = true;
  bool showNextIcon = true;
  bool showBackIcon = true;
  Widget? leading;
  Widget? trailing;

  @override
  void initState() {
    addTab();
    fetchData();

    super.initState();
  }

  void fetchData() {
    final rssbloc = BlocProvider.of<RssFeedBloc>(context);
    rssbloc.add(RssFeedEvent.fetchFeed());
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
                    child: const Icon(Icons.add),
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
                          const SizedBox(
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
                        _nameTextController.clear();
                        _urlTextController.clear();
                        Navigator.pop(context);
                      },
                      child: Text('Submit')),
                ],
              ),
            ));
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
          content: const TabViewWidget(),
        ),
      );
    });
  }

  void removeTab(int id) {
    if (id > 1) {
      setState(() {
        tabs.removeAt(id);
      });
    }
  }
}

List<TabData> tabs = [
  TabData(
    index: 1,
    title: const Tab(
      child: Text('Tab 1'),
    ),
    content: Center(child: TabViewWidget()),
  ),

  // Add more tabs as needed
];
