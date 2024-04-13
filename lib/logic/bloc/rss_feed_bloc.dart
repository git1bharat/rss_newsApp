import 'package:bloc/bloc.dart';
import 'package:dart_rss/dart_rss.dart';
import 'package:dart_rss/domain/rss1_item.dart';
import 'package:dynamic_tabbar/dynamic_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rss_newsapp/model/rssfeeditem.dart';
import 'package:rss_newsapp/repository/news_repository.dart';

part 'rss_feed_event.dart';
part 'rss_feed_state.dart';
part 'rss_feed_bloc.freezed.dart';

class RssFeedBloc extends Bloc<RssFeedEvent, RssFeedState> {
  RssFeedBloc() : super(_InitialState()) {
    NewsRepository newsRepository = NewsRepository();

    List<TabData> _tabs = [];
    // on<_FetchFeed>((event, emit) async {
    //   try {
    //     print('1111111111111111111111111111111111111111111111');
    //     emit(RssFeedState.loadingState());
    //     print('22222222222222222222222222222222222222222222222');
    //     var newsList = await newsRepository.fetchRssFeed();
    //     print('33333333333333333333333${newsList}');
    //     emit(RssFeedState.loadedState(rssFeedItem: newsList));
    //     print('4444444444444444444444444444444444444444');
    //   } catch (e) {
    //     emit(RssFeedState.errorState(e.toString()));
    //   }
    // });

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
