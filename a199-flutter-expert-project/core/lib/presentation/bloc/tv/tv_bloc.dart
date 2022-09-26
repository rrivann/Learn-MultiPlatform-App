import 'package:core/domain/entities/tv_series/tv_series.dart';
import 'package:core/domain/entities/tv_series/tv_series_detail.dart';
import 'package:core/domain/usecases/tv_series/get_now_playing_tv_series.dart';
import 'package:core/domain/usecases/tv_series/get_popular_tv_series.dart';
import 'package:core/domain/usecases/tv_series/get_top_rated_tv_series.dart';
import 'package:core/domain/usecases/tv_series/get_tv_series_detail.dart';
import 'package:core/domain/usecases/tv_series/get_tv_series_recommendations.dart';
import 'package:core/domain/usecases/tv_series/get_watchlist_status_tv_series.dart';
import 'package:core/domain/usecases/tv_series/get_watchlist_tv_series.dart';
import 'package:core/domain/usecases/tv_series/remove_watchlist_tv_series.dart';
import 'package:core/domain/usecases/tv_series/save_watchlist_tv_series.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tv_event.dart';
part 'tv_state.dart';

// Tv
class NowTvBloc extends Bloc<TvEvent, TvState> {
  final GetNowPlayingTvSeries _getNowPlayingTvSeries;

  NowTvBloc(this._getNowPlayingTvSeries) : super(TvEmpty()) {
    on<FetchNowPlayingTv>((event, emit) async {
      emit(TvLoading());
      final result = await _getNowPlayingTvSeries.execute();
      result.fold(
        (l) => emit(TvError(l.message)),
        (r) => emit(TvHasData(r)),
      );
    });
  }
}

class PopularTvBloc extends Bloc<TvEvent, TvState> {
  final GetPopularTvSeries _getPopularTvSeries;

  PopularTvBloc(this._getPopularTvSeries) : super(TvEmpty()) {
    on<FetchPopularTv>((event, emit) async {
      emit(TvLoading());
      final result = await _getPopularTvSeries.execute();
      result.fold(
        (l) => emit(TvError(l.message)),
        (r) => emit(TvHasData(r)),
      );
    });
  }
}

class TopTvBloc extends Bloc<TvEvent, TvState> {
  final GetTopRatedTvSeries _getTopRatedTvSeries;

  TopTvBloc(this._getTopRatedTvSeries) : super(TvEmpty()) {
    on<FetchTopRatedTv>((event, emit) async {
      emit(TvLoading());
      final result = await _getTopRatedTvSeries.execute();
      result.fold(
        (l) => emit(TvError(l.message)),
        (r) => emit(TvHasData(r)),
      );
    });
  }
}

// Detail Tv
class DetailTvBloc extends Bloc<TvEvent, TvState> {
  final GetTvSeriesDetail _getTvSeriesDetail;

  DetailTvBloc(this._getTvSeriesDetail) : super(TvEmpty()) {
    on<FetchDetailTv>((event, emit) async {
      final id = event.id;
      emit(TvLoading());
      final result = await _getTvSeriesDetail.execute(id);
      result.fold(
        (l) => emit(TvError(l.message)),
        (r) async => emit(TvDetailHasData(r)),
      );
    });
  }
}

class RecommendedTvBloc extends Bloc<TvEvent, TvState> {
  final GetTvSeriesRecommendations _getTvSeriesRecommendations;
  RecommendedTvBloc(this._getTvSeriesRecommendations) : super(TvEmpty()) {
    on<FetchRecommendedTv>(
      (event, emit) async {
        final id = event.id;
        emit(TvLoading());
        final result = await _getTvSeriesRecommendations.execute(id);
        result.fold(
          (l) => emit(TvError(l.message)),
          (r) => emit(TvRecomendHasData(r)),
        );
      },
    );
  }
}

// Watchlist Tv
class WatchlistTvBloc extends Bloc<TvEvent, TvState> {
  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  final GetWatchlistTvSeries _getWatchlistTvSeries;
  final GetWatchListStatusTvSeries _getWatchListStatusTvSeries;
  final SaveWatchlistTvSeries _saveWatchlistTvSeries;
  final RemoveWatchlistTvSeries _removeWatchlistTvSeries;

  WatchlistTvBloc(this._getWatchlistTvSeries, this._getWatchListStatusTvSeries,
      this._saveWatchlistTvSeries, this._removeWatchlistTvSeries)
      : super(TvEmpty()) {
    on<FetchWatchlistTv>(
      (event, emit) async {
        emit(TvLoading());
        final result = await _getWatchlistTvSeries.execute();
        result.fold(
          (l) => emit(TvError(l.message)),
          (r) => emit(WatchlistTvHasData(r)),
        );
      },
    );

    on<LoadWatchlistTvStatus>(
      (event, emit) async {
        final id = event.id;
        emit(TvLoading());
        final result = await _getWatchListStatusTvSeries.execute(id);
        emit(LoadWatchListTvHasData(result));
      },
    );

    on<SaveWatchlistTv>(
      (event, emit) async {
        final tv = event.tvSeriesDetailEntities;
        emit(TvLoading());
        final result = await _saveWatchlistTvSeries.execute(tv);
        result.fold(
          (l) => emit(TvError(l.message)),
          (r) => emit(WatchListTvMessage(r)),
        );
      },
    );

    on<RemoveWatchlistTv>(
      (event, emit) async {
        final tv = event.tvSeriesDetailEntities;
        emit(TvLoading());
        final result = await _removeWatchlistTvSeries.execute(tv);
        result.fold(
          (l) => emit(TvError(l.message)),
          (r) => emit(WatchListTvMessage(r)),
        );
      },
    );
  }
}
