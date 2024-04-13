part of 'rss_feed_bloc.dart';

@freezed
class RssFeedEvent with _$RssFeedEvent {
  const factory RssFeedEvent.fetchFeed() = _FetchFeed;
  const factory RssFeedEvent.submitUrl({required String url}) = _SubmitUrl;
}
