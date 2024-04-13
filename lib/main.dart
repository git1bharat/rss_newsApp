import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rss_newsapp/logic/bloc/bloc_observer.dart';
import 'package:rss_newsapp/logic/bloc/rss_feed_bloc.dart';
import 'package:rss_newsapp/screen/home_screen.dart';
import 'package:rss_newsapp/screen/news_feed_screen.dart';
import 'package:rss_newsapp/screen/news_screen.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<RssFeedBloc>(
            create: (context) => RssFeedBloc(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          // darkTheme: ThemeData(brightness: Brightness.dark),
          // themeMode: ThemeMode.dark,
          home: FeedScreen(title: "News"),
        ));
  }
}
