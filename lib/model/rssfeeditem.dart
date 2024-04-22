import 'package:freezed_annotation/freezed_annotation.dart';

part 'rssfeeditem.freezed.dart';
part 'rssfeeditem.g.dart';

@freezed
class NewsModel with _$NewsModel {
  factory NewsModel({
    int? id,
    required String? url,
    required String? name,
  }) = _NewsModel;

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
}

List<NewsModel> newsData = [
  NewsModel(
      id: 1,
      name: 'NDTV',
      url: "https://feeds.feedburner.com/ndtvnews-trending-news"),
];
