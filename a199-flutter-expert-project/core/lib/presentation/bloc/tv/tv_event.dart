part of 'tv_bloc.dart';

abstract class TvEvent extends Equatable {
  const TvEvent();

  @override
  List<Object?> get props => [];
}

// Tv
class FetchNowPlayingTv extends TvEvent {}

class FetchPopularTv extends TvEvent {}

class FetchTopRatedTv extends TvEvent {}

// Detail Tv
class FetchDetailTv extends TvEvent {
  final int id;

  const FetchDetailTv(this.id);

  @override
  List<Object?> get props => [id];
}

class FetchRecommendedTv extends TvEvent {
  final int id;

  const FetchRecommendedTv(this.id);

  @override
  List<Object?> get props => [id];
}

// Watchlist Tv
class FetchWatchlistTv extends TvEvent {}

class SaveWatchlistTv extends TvEvent {
  final TvSeriesDetailEntities tvSeriesDetailEntities;

  const SaveWatchlistTv(this.tvSeriesDetailEntities);

  @override
  List<Object?> get props => [tvSeriesDetailEntities];
}

class RemoveWatchlistTv extends TvEvent {
  final TvSeriesDetailEntities tvSeriesDetailEntities;

  const RemoveWatchlistTv(this.tvSeriesDetailEntities);

  @override
  List<Object?> get props => [tvSeriesDetailEntities];
}

class LoadWatchlistTvStatus extends TvEvent {
  final int id;

  const LoadWatchlistTvStatus(this.id);

  @override
  List<Object?> get props => [id];
}
