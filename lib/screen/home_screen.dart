// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:rss_newsapp/logic/bloc/rss_feed_bloc.dart';
// import 'package:rss_newsapp/screen/news_feed_screen.dart';
// import 'package:rss_newsapp/screen/news_screen.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final rssbloc = BlocProvider.of<RssFeedBloc>(context);
//     return Scaffold(
//       body: Center(
//           child: Column(
//         children: [
//           const SizedBox(
//             height: 200,
//           ),
//           InkWell(
//             child: const CircleAvatar(
//               radius: 30,
//               backgroundImage: AssetImage(
//                 'assets/images/ajtak2.jpg',
//               ),
//             ),
//             onTap: () {
//               Navigator.of(context).push(MaterialPageRoute(
//                   builder: (context) => MyHomePage(
//                         title: 'News',
//                       )));
//               // rssbloc.add(RssFeedEvent.fetchFeed());
//             },
//           ),
//           Container(
//             width: 2,
//             height: 60,
//             color: Colors.black,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               InkWell(
//                 child: const CircleAvatar(
//                   backgroundImage: AssetImage(
//                     'assets/images/abp.png',
//                   ),
//                   radius: 30,
//                 ),
//                 onTap: () {
//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => MyHomePage(
//                             title: 'dTv',
//                           )));
//                 },
//               ),
//               Container(
//                 width: 60,
//                 height: 2,
//                 color: Colors.black,
//               ),
//               const CircleAvatar(
//                   radius: 50, child: Center(child: Text('News'))),
//               Container(
//                 width: 60,
//                 height: 2,
//                 color: Colors.black,
//               ),
//               InkWell(
//                 child: const CircleAvatar(
//                   radius: 30,
//                   backgroundImage: AssetImage(
//                     'assets/images/ndtv.jpg',
//                   ),
//                 ),
//                 onTap: () {
//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => MyHomePage(
//                             title: 'News',
//                           )));
//                 },
//               ),
//             ],
//           ),
//           Container(
//             width: 2,
//             height: 60,
//             color: Colors.black,
//           ),
//           InkWell(
//             child: const CircleAvatar(
//               radius: 30,
//               backgroundImage: AssetImage(
//                 'assets/images/bbc.png',
//               ),
//             ),
//             onTap: () {
//               Navigator.of(context).push(MaterialPageRoute(
//                   builder: (context) => MyHomePage(
//                         title: 'News',
//                       )));
//             },
//           ),
//         ],
//       )),
//     );
//   }
// }
