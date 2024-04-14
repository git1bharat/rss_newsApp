part of 'rss_feed_bloc.dart';

@freezed
class RssFeedState with _$RssFeedState {
  const factory RssFeedState.initialState() = _InitialState;
  const factory RssFeedState.loadingState() = _LoadingState;
  const factory RssFeedState.loadedState({required List<RssItem> rssFeedItem}) =
      _LoadedState;

  const factory RssFeedState.errorState(String error) = _ErrorState;
}
