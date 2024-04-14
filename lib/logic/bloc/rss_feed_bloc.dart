import 'package:bloc/bloc.dart';
import 'package:dart_rss/dart_rss.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rss_newsapp/repository/news_repository.dart';

part 'rss_feed_bloc.freezed.dart';
part 'rss_feed_event.dart';
part 'rss_feed_state.dart';

class RssFeedBloc extends Bloc<RssFeedEvent, RssFeedState> {
  RssFeedBloc() : super(_InitialState()) {
    NewsRepository newsRepository = NewsRepository();

    on<_FetchFeed>((event, emit) async {
      try {
        emit(RssFeedState.loadingState());

        var newsList = await newsRepository.fetchRssFeed();

        emit(RssFeedState.loadedState(rssFeedItem: newsList));
      } catch (e) {
        emit(RssFeedState.errorState(e.toString()));
      }
    });

    on<_SubmitUrl>((event, emit) async {
      try {
        emit(RssFeedState.loadingState());

        var newsList = await newsRepository.subscribeNewsFeed(event!.url);
        emit(RssFeedState.loadedState(rssFeedItem: newsList));
      } catch (e) {
        emit(RssFeedState.errorState(e.toString()));
      }
    });
  }
}
