import 'dart:convert';

import 'package:dart_rss/dart_rss.dart';
import 'package:flutter/material.dart';
import 'package:rss_newsapp/model/rssfeeditem.dart';
import 'package:rss_newsapp/network/dio_factory.dart';

class NewsRepository {
  DioFactory diofactory = DioFactory();
  var url = 'https://feeds.feedburner.com/ndtvnews-top-stories';
  // var SubscribeUrl = 'https://feeds.feedburner.com/ndtvnews-top-stories';

  Future<List<RssItem>> fetchRssFeed() async {
    var response = await diofactory.dio.get(url);
    var bodyString = response.data;
    var channel = RssFeed.parse(bodyString);
    var feedList = channel.items;

    // print('Your image Url is here...${feedList[10].media!.contents[0]}');
    return feedList;
  }

  Future<List<RssItem>> subscribeNewsFeed(String url) async {
    var feedList = await diofactory.dio.get(url).then((response) {
      return response.data;
    }).then((bodyString) {
      var channel = RssFeed.parse(bodyString);
      print('channel title: ${channel.title}');
      return channel.items; // Return a list of items, not just the channel
    });
    return feedList;
  }
}






  // Future<List<RssFeedItem>> fetchRssFeed() async {
  //   try {
  //     final response = await diofactory.dio
  //         .get('https://feeds.feedburner.com/ndtvnews-top-stories'); //Xml Data
  //     RssFeed.parse(response.data);
  //     RssFeed.parse(response.data);
  //     final jsonData = xml2json.toParker();
  //     final data = json.decode(jsonData);
  //     final feedList = data['rss']['channel'];
  //     debugPrint('Data printed --------- > ${data['rss']}');
  //     print("------------------$feedList");

  //     // final List<RssFeedItem> rssFeedItems =
  //     //     feedList.map((itemJson) => RssFeedItem.fromJson(itemJson)).toList();

  //     // print(' your feeed item is herer $rssFeedItems');

  //     return rssFeedItems;
  //   } catch (e) {
  //     throw e;
  //   }
  // }
// }

// class NewsRepository {
//   // List _feedItems = [];
//   DioFactory diofactory = DioFactory();
//   Xml2Json xml2json = Xml2Json();
 
//   Future<List<RssFeedItem>> fetchRssFeed() async {
//     try {
//       final response = await diofactory.dio
//           .get('https://feeds.feedburner.com/ndtvnews-top-stories'); //Xml Data
//       RssFeed.parse(response.data);
//       final jsonData = xml2json.toParker();
//       print('JSON Data: $jsonData');
//       final data = json.decode(jsonData);
//       final feedList = data['rss']['channel'];
//       debugPrint('Data printed --------- > ${data['rss']['channel']}');
//       print("------------------$feedList");

//       final List<RssFeedItem> rssFeedItems =
//           feedList.map((itemJson) => RssFeedItem.fromJson(itemJson)).toList();

//       print(' your feeed item is herer $rssFeedItems');

//       return rssFeedItems;
//     } catch (e) {
//       throw e;
//     }
//   }
// }
