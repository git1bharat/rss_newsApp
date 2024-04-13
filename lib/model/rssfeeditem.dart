import 'package:freezed_annotation/freezed_annotation.dart';
part 'rssfeeditem.freezed.dart';
part 'rssfeeditem.g.dart';

@freezed
class NewsModel with _$NewsModel {
  factory NewsModel({
    required String title,
    String? link,
    String? url,
    String? description,
  }) = _NewsModel;

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
}
