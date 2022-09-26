part of 'tv_bloc.dart';

abstract class TvState extends Equatable {
  const TvState();
}

class TvEmpty extends TvState {
  @override
  List<Object?> get props => [];
}

class TvLoading extends TvState {
  @override
  List<Object?> get props => [];
}

class TvError extends TvState {
  final String message;

  const TvError(this.message);

  @override
  List<Object?> get props => [message];
}

// Tv
class TvHasData extends TvState {
  final List<TvSeries> result;

  const TvHasData(this.result);

  @override
  List<Object?> get props => [result];
}

// Detail Tv
class TvDetailHasData extends TvState {
  final TvSeriesDetailEntities resultTvDetail;

  const TvDetailHasData(this.resultTvDetail);

  @override
  List<Object?> get props => [resultTvDetail];
}

class TvRecomendHasData extends TvState {
  final List<TvSeries> result;

  const TvRecomendHasData(this.result);

  @override
  List<Object?> get props => [result];
}

// Watchlist Tv
class WatchlistTvHasData extends TvState {
  final List<TvSeries> result;

  const WatchlistTvHasData(this.result);

  @override
  List<Object?> get props => [result];
}

class WatchListTvMessage extends TvState {
  final String message;

  const WatchListTvMessage(this.message);

  @override
  List<Object?> get props => [message];
}

class LoadWatchListTvHasData extends TvState {
  final bool isAddedToWatchlist;

  const LoadWatchListTvHasData(this.isAddedToWatchlist);

  @override
  List<Object?> get props => [isAddedToWatchlist];
}
