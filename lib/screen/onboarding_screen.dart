import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rss_newsapp/screen/feed_screen.dart';

class OnBoradingScreen extends StatefulWidget with SU {
  const OnBoradingScreen({super.key});

  @override
  State<OnBoradingScreen> createState() => _OnBoradingScreenState();
}

class _OnBoradingScreenState extends State<OnBoradingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 390.w,
                  height: 755.h,
                  child: Image.asset('assets/images/feedFuse.jpg',
                      fit: BoxFit.fill),
                ),
                Positioned(
                  top: 580.h,
                  left: 110.w,
                  child: SizedBox(
                    width: 150.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(18.r)), // Responsive radius
                            side: const BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepPurple),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FeedScreen()));
                      },
                      child: const Text(
                        'Read-Feed',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 248, 248)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
