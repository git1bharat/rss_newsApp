import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rss_newsapp/logic/bloc/bloc_observer.dart';
import 'package:rss_newsapp/logic/bloc/rss_feed_bloc.dart';
import 'package:rss_newsapp/screen/feed_screen.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RssFeedBloc>(
          create: (context) => RssFeedBloc(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 756),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(brightness: Brightness.dark),
          themeMode: ThemeMode.dark,
          home: SafeArea(
            child: FlutterSplashScreen.fadeIn(
              duration: const Duration(milliseconds: 3500),
              backgroundColor: Colors.white,
              onInit: () {
                debugPrint("On Init");
              },
              onEnd: () {
                debugPrint("On End");
              },
              childWidget: Container(
                width: 390.w, // Use ScreenUtil to make width responsive
                height: 756.h, // Use ScreenUtil to make height responsive
                child: Image.asset(
                  "assets/images/feedFuse.jpg",
                  fit: BoxFit.fill,
                ),
              ),
              onAnimationEnd: () => debugPrint("On Fade In End"),
              nextScreen: FeedScreen(),
            ),
          ),
        ),
      ),
    );
  }
}
