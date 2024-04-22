part of 'rss_feed_bloc.dart';

@freezed
class RssFeedEvent with _$RssFeedEvent {
  const factory RssFeedEvent.fetchFeed({required String? url}) = _FetchFeed;
  const factory RssFeedEvent.fetchDb() = _FetchDb;
  const factory RssFeedEvent.insertNameUrl(String name, String url) =
      _InsertNameUrl;
}
