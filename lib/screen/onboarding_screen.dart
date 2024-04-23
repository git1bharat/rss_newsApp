import 'package:flutter/material.dart';
import 'package:rss_newsapp/screen/feed_screen.dart';

class OnBoradingScreen extends StatefulWidget {
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
                    width: 390,
                    height: 755,
                    child: Image.asset('assets/images/feedFuse.jpg',
                        fit: BoxFit.fill)),
                Positioned(
                    top: 580,
                    left: 110,
                    child: SizedBox(
                      width: 150,
                      child: ElevatedButton(
                          style: const ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(18),
                                      ),
                                      side: BorderSide(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)))),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.deepPurple)),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => FeedScreen()));
                          },
                          child: const Text(
                            'Read-Feed',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 248, 248)),
                          )),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
