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
      name: 'CNBC',
      url:
          "https://search.cnbc.com/rs/search/combinedcms/view.xml?partnerId=wrss01&id=100003114"),
];
