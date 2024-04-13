// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rss_feed_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RssFeedEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchFeed,
    required TResult Function(String url) submitUrl,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchFeed,
    TResult? Function(String url)? submitUrl,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchFeed,
    TResult Function(String url)? submitUrl,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchFeed value) fetchFeed,
    required TResult Function(_SubmitUrl value) submitUrl,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchFeed value)? fetchFeed,
    TResult? Function(_SubmitUrl value)? submitUrl,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchFeed value)? fetchFeed,
    TResult Function(_SubmitUrl value)? submitUrl,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RssFeedEventCopyWith<$Res> {
  factory $RssFeedEventCopyWith(
          RssFeedEvent value, $Res Function(RssFeedEvent) then) =
      _$RssFeedEventCopyWithImpl<$Res, RssFeedEvent>;
}

/// @nodoc
class _$RssFeedEventCopyWithImpl<$Res, $Val extends RssFeedEvent>
    implements $RssFeedEventCopyWith<$Res> {
  _$RssFeedEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchFeedImplCopyWith<$Res> {
  factory _$$FetchFeedImplCopyWith(
          _$FetchFeedImpl value, $Res Function(_$FetchFeedImpl) then) =
      __$$FetchFeedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchFeedImplCopyWithImpl<$Res>
    extends _$RssFeedEventCopyWithImpl<$Res, _$FetchFeedImpl>
    implements _$$FetchFeedImplCopyWith<$Res> {
  __$$FetchFeedImplCopyWithImpl(
      _$FetchFeedImpl _value, $Res Function(_$FetchFeedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchFeedImpl implements _FetchFeed {
  const _$FetchFeedImpl();

  @override
  String toString() {
    return 'RssFeedEvent.fetchFeed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchFeedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchFeed,
    required TResult Function(String url) submitUrl,
  }) {
    return fetchFeed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchFeed,
    TResult? Function(String url)? submitUrl,
  }) {
    return fetchFeed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchFeed,
    TResult Function(String url)? submitUrl,
    required TResult orElse(),
  }) {
    if (fetchFeed != null) {
      return fetchFeed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchFeed value) fetchFeed,
    required TResult Function(_SubmitUrl value) submitUrl,
  }) {
    return fetchFeed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchFeed value)? fetchFeed,
    TResult? Function(_SubmitUrl value)? submitUrl,
  }) {
    return fetchFeed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchFeed value)? fetchFeed,
    TResult Function(_SubmitUrl value)? submitUrl,
    required TResult orElse(),
  }) {
    if (fetchFeed != null) {
      return fetchFeed(this);
    }
    return orElse();
  }
}

abstract class _FetchFeed implements RssFeedEvent {
  const factory _FetchFeed() = _$FetchFeedImpl;
}

/// @nodoc
abstract class _$$SubmitUrlImplCopyWith<$Res> {
  factory _$$SubmitUrlImplCopyWith(
          _$SubmitUrlImpl value, $Res Function(_$SubmitUrlImpl) then) =
      __$$SubmitUrlImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$SubmitUrlImplCopyWithImpl<$Res>
    extends _$RssFeedEventCopyWithImpl<$Res, _$SubmitUrlImpl>
    implements _$$SubmitUrlImplCopyWith<$Res> {
  __$$SubmitUrlImplCopyWithImpl(
      _$SubmitUrlImpl _value, $Res Function(_$SubmitUrlImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$SubmitUrlImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SubmitUrlImpl implements _SubmitUrl {
  const _$SubmitUrlImpl({required this.url});

  @override
  final String url;

  @override
  String toString() {
    return 'RssFeedEvent.submitUrl(url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitUrlImpl &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitUrlImplCopyWith<_$SubmitUrlImpl> get copyWith =>
      __$$SubmitUrlImplCopyWithImpl<_$SubmitUrlImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchFeed,
    required TResult Function(String url) submitUrl,
  }) {
    return submitUrl(url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchFeed,
    TResult? Function(String url)? submitUrl,
  }) {
    return submitUrl?.call(url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchFeed,
    TResult Function(String url)? submitUrl,
    required TResult orElse(),
  }) {
    if (submitUrl != null) {
      return submitUrl(url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchFeed value) fetchFeed,
    required TResult Function(_SubmitUrl value) submitUrl,
  }) {
    return submitUrl(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchFeed value)? fetchFeed,
    TResult? Function(_SubmitUrl value)? submitUrl,
  }) {
    return submitUrl?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchFeed value)? fetchFeed,
    TResult Function(_SubmitUrl value)? submitUrl,
    required TResult orElse(),
  }) {
    if (submitUrl != null) {
      return submitUrl(this);
    }
    return orElse();
  }
}

abstract class _SubmitUrl implements RssFeedEvent {
  const factory _SubmitUrl({required final String url}) = _$SubmitUrlImpl;

  String get url;
  @JsonKey(ignore: true)
  _$$SubmitUrlImplCopyWith<_$SubmitUrlImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RssFeedState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function() loadingState,
    required TResult Function(List<RssItem> rssFeedItem) loadedState,
    required TResult Function(String error) errorState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialState,
    TResult? Function()? loadingState,
    TResult? Function(List<RssItem> rssFeedItem)? loadedState,
    TResult? Function(String error)? errorState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? loadingState,
    TResult Function(List<RssItem> rssFeedItem)? loadedState,
    TResult Function(String error)? errorState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initialState,
    required TResult Function(_LoadingState value) loadingState,
    required TResult Function(_LoadedState value) loadedState,
    required TResult Function(_ErrorState value) errorState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initialState,
    TResult? Function(_LoadingState value)? loadingState,
    TResult? Function(_LoadedState value)? loadedState,
    TResult? Function(_ErrorState value)? errorState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initialState,
    TResult Function(_LoadingState value)? loadingState,
    TResult Function(_LoadedState value)? loadedState,
    TResult Function(_ErrorState value)? errorState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RssFeedStateCopyWith<$Res> {
  factory $RssFeedStateCopyWith(
          RssFeedState value, $Res Function(RssFeedState) then) =
      _$RssFeedStateCopyWithImpl<$Res, RssFeedState>;
}

/// @nodoc
class _$RssFeedStateCopyWithImpl<$Res, $Val extends RssFeedState>
    implements $RssFeedStateCopyWith<$Res> {
  _$RssFeedStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialStateImplCopyWith<$Res> {
  factory _$$InitialStateImplCopyWith(
          _$InitialStateImpl value, $Res Function(_$InitialStateImpl) then) =
      __$$InitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialStateImplCopyWithImpl<$Res>
    extends _$RssFeedStateCopyWithImpl<$Res, _$InitialStateImpl>
    implements _$$InitialStateImplCopyWith<$Res> {
  __$$InitialStateImplCopyWithImpl(
      _$InitialStateImpl _value, $Res Function(_$InitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialStateImpl implements _InitialState {
  const _$InitialStateImpl();

  @override
  String toString() {
    return 'RssFeedState.initialState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function() loadingState,
    required TResult Function(List<RssItem> rssFeedItem) loadedState,
    required TResult Function(String error) errorState,
  }) {
    return initialState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialState,
    TResult? Function()? loadingState,
    TResult? Function(List<RssItem> rssFeedItem)? loadedState,
    TResult? Function(String error)? errorState,
  }) {
    return initialState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? loadingState,
    TResult Function(List<RssItem> rssFeedItem)? loadedState,
    TResult Function(String error)? errorState,
    required TResult orElse(),
  }) {
    if (initialState != null) {
      return initialState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initialState,
    required TResult Function(_LoadingState value) loadingState,
    required TResult Function(_LoadedState value) loadedState,
    required TResult Function(_ErrorState value) errorState,
  }) {
    return initialState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initialState,
    TResult? Function(_LoadingState value)? loadingState,
    TResult? Function(_LoadedState value)? loadedState,
    TResult? Function(_ErrorState value)? errorState,
  }) {
    return initialState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initialState,
    TResult Function(_LoadingState value)? loadingState,
    TResult Function(_LoadedState value)? loadedState,
    TResult Function(_ErrorState value)? errorState,
    required TResult orElse(),
  }) {
    if (initialState != null) {
      return initialState(this);
    }
    return orElse();
  }
}

abstract class _InitialState implements RssFeedState {
  const factory _InitialState() = _$InitialStateImpl;
}

/// @nodoc
abstract class _$$LoadingStateImplCopyWith<$Res> {
  factory _$$LoadingStateImplCopyWith(
          _$LoadingStateImpl value, $Res Function(_$LoadingStateImpl) then) =
      __$$LoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingStateImplCopyWithImpl<$Res>
    extends _$RssFeedStateCopyWithImpl<$Res, _$LoadingStateImpl>
    implements _$$LoadingStateImplCopyWith<$Res> {
  __$$LoadingStateImplCopyWithImpl(
      _$LoadingStateImpl _value, $Res Function(_$LoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingStateImpl implements _LoadingState {
  const _$LoadingStateImpl();

  @override
  String toString() {
    return 'RssFeedState.loadingState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function() loadingState,
    required TResult Function(List<RssItem> rssFeedItem) loadedState,
    required TResult Function(String error) errorState,
  }) {
    return loadingState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialState,
    TResult? Function()? loadingState,
    TResult? Function(List<RssItem> rssFeedItem)? loadedState,
    TResult? Function(String error)? errorState,
  }) {
    return loadingState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? loadingState,
    TResult Function(List<RssItem> rssFeedItem)? loadedState,
    TResult Function(String error)? errorState,
    required TResult orElse(),
  }) {
    if (loadingState != null) {
      return loadingState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initialState,
    required TResult Function(_LoadingState value) loadingState,
    required TResult Function(_LoadedState value) loadedState,
    required TResult Function(_ErrorState value) errorState,
  }) {
    return loadingState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initialState,
    TResult? Function(_LoadingState value)? loadingState,
    TResult? Function(_LoadedState value)? loadedState,
    TResult? Function(_ErrorState value)? errorState,
  }) {
    return loadingState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initialState,
    TResult Function(_LoadingState value)? loadingState,
    TResult Function(_LoadedState value)? loadedState,
    TResult Function(_ErrorState value)? errorState,
    required TResult orElse(),
  }) {
    if (loadingState != null) {
      return loadingState(this);
    }
    return orElse();
  }
}

abstract class _LoadingState implements RssFeedState {
  const factory _LoadingState() = _$LoadingStateImpl;
}

/// @nodoc
abstract class _$$LoadedStateImplCopyWith<$Res> {
  factory _$$LoadedStateImplCopyWith(
          _$LoadedStateImpl value, $Res Function(_$LoadedStateImpl) then) =
      __$$LoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<RssItem> rssFeedItem});
}

/// @nodoc
class __$$LoadedStateImplCopyWithImpl<$Res>
    extends _$RssFeedStateCopyWithImpl<$Res, _$LoadedStateImpl>
    implements _$$LoadedStateImplCopyWith<$Res> {
  __$$LoadedStateImplCopyWithImpl(
      _$LoadedStateImpl _value, $Res Function(_$LoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rssFeedItem = null,
  }) {
    return _then(_$LoadedStateImpl(
      rssFeedItem: null == rssFeedItem
          ? _value._rssFeedItem
          : rssFeedItem // ignore: cast_nullable_to_non_nullable
              as List<RssItem>,
    ));
  }
}

/// @nodoc

class _$LoadedStateImpl implements _LoadedState {
  const _$LoadedStateImpl({required final List<RssItem> rssFeedItem})
      : _rssFeedItem = rssFeedItem;

  final List<RssItem> _rssFeedItem;
  @override
  List<RssItem> get rssFeedItem {
    if (_rssFeedItem is EqualUnmodifiableListView) return _rssFeedItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rssFeedItem);
  }

  @override
  String toString() {
    return 'RssFeedState.loadedState(rssFeedItem: $rssFeedItem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedStateImpl &&
            const DeepCollectionEquality()
                .equals(other._rssFeedItem, _rssFeedItem));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_rssFeedItem));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedStateImplCopyWith<_$LoadedStateImpl> get copyWith =>
      __$$LoadedStateImplCopyWithImpl<_$LoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function() loadingState,
    required TResult Function(List<RssItem> rssFeedItem) loadedState,
    required TResult Function(String error) errorState,
  }) {
    return loadedState(rssFeedItem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialState,
    TResult? Function()? loadingState,
    TResult? Function(List<RssItem> rssFeedItem)? loadedState,
    TResult? Function(String error)? errorState,
  }) {
    return loadedState?.call(rssFeedItem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? loadingState,
    TResult Function(List<RssItem> rssFeedItem)? loadedState,
    TResult Function(String error)? errorState,
    required TResult orElse(),
  }) {
    if (loadedState != null) {
      return loadedState(rssFeedItem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initialState,
    required TResult Function(_LoadingState value) loadingState,
    required TResult Function(_LoadedState value) loadedState,
    required TResult Function(_ErrorState value) errorState,
  }) {
    return loadedState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initialState,
    TResult? Function(_LoadingState value)? loadingState,
    TResult? Function(_LoadedState value)? loadedState,
    TResult? Function(_ErrorState value)? errorState,
  }) {
    return loadedState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initialState,
    TResult Function(_LoadingState value)? loadingState,
    TResult Function(_LoadedState value)? loadedState,
    TResult Function(_ErrorState value)? errorState,
    required TResult orElse(),
  }) {
    if (loadedState != null) {
      return loadedState(this);
    }
    return orElse();
  }
}

abstract class _LoadedState implements RssFeedState {
  const factory _LoadedState({required final List<RssItem> rssFeedItem}) =
      _$LoadedStateImpl;

  List<RssItem> get rssFeedItem;
  @JsonKey(ignore: true)
  _$$LoadedStateImplCopyWith<_$LoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorStateImplCopyWith<$Res> {
  factory _$$ErrorStateImplCopyWith(
          _$ErrorStateImpl value, $Res Function(_$ErrorStateImpl) then) =
      __$$ErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorStateImplCopyWithImpl<$Res>
    extends _$RssFeedStateCopyWithImpl<$Res, _$ErrorStateImpl>
    implements _$$ErrorStateImplCopyWith<$Res> {
  __$$ErrorStateImplCopyWithImpl(
      _$ErrorStateImpl _value, $Res Function(_$ErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorStateImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorStateImpl implements _ErrorState {
  const _$ErrorStateImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'RssFeedState.errorState(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorStateImplCopyWith<_$ErrorStateImpl> get copyWith =>
      __$$ErrorStateImplCopyWithImpl<_$ErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function() loadingState,
    required TResult Function(List<RssItem> rssFeedItem) loadedState,
    required TResult Function(String error) errorState,
  }) {
    return errorState(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialState,
    TResult? Function()? loadingState,
    TResult? Function(List<RssItem> rssFeedItem)? loadedState,
    TResult? Function(String error)? errorState,
  }) {
    return errorState?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? loadingState,
    TResult Function(List<RssItem> rssFeedItem)? loadedState,
    TResult Function(String error)? errorState,
    required TResult orElse(),
  }) {
    if (errorState != null) {
      return errorState(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initialState,
    required TResult Function(_LoadingState value) loadingState,
    required TResult Function(_LoadedState value) loadedState,
    required TResult Function(_ErrorState value) errorState,
  }) {
    return errorState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initialState,
    TResult? Function(_LoadingState value)? loadingState,
    TResult? Function(_LoadedState value)? loadedState,
    TResult? Function(_ErrorState value)? errorState,
  }) {
    return errorState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initialState,
    TResult Function(_LoadingState value)? loadingState,
    TResult Function(_LoadedState value)? loadedState,
    TResult Function(_ErrorState value)? errorState,
    required TResult orElse(),
  }) {
    if (errorState != null) {
      return errorState(this);
    }
    return orElse();
  }
}

abstract class _ErrorState implements RssFeedState {
  const factory _ErrorState(final String error) = _$ErrorStateImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$ErrorStateImplCopyWith<_$ErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
