import 'package:bloc/bloc.dart';
import 'package:dart_rss/dart_rss.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rss_newsapp/database/db_heleper.dart';
import 'package:rss_newsapp/model/rssfeeditem.dart';
import 'package:rss_newsapp/repository/news_repository.dart';

part 'rss_feed_bloc.freezed.dart';
part 'rss_feed_event.dart';
part 'rss_feed_state.dart';

class RssFeedBloc extends Bloc<RssFeedEvent, RssFeedState> {
  RssFeedBloc() : super(const _InitialState()) {
    NewsRepository newsRepository = NewsRepository();

    on<_FetchFeed>((event, emit) async {
      try {
        emit(const RssFeedState.loadingState());

        var newsList = await newsRepository.fetchRssFeed(event.url.toString());

        emit(RssFeedState.loadedState(rssFeedItem: newsList));
      } catch (e) {
        emit(RssFeedState.errorState(e.toString()));
      }
    });

    on<_FetchDb>((event, emit) async {
      try {
        emit(const RssFeedState.loadingState());

        var fetchList = await DataBaseHelper.init().getNewsData();
        emit(RssFeedState.fetchDatabase(
          newodel: fetchList,
        ));
      } catch (e) {
        emit(RssFeedState.errorState(e.toString()));
      }
    });
  }
}
