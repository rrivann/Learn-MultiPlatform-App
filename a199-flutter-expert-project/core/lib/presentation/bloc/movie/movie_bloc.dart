import 'package:core/domain/entities/movie/movie.dart';
import 'package:core/domain/entities/movie/movie_detail.dart';
import 'package:core/domain/usecases/movie/get_movie_detail.dart';
import 'package:core/domain/usecases/movie/get_movie_recommendations.dart';
import 'package:core/domain/usecases/movie/get_now_playing_movies.dart';
import 'package:core/domain/usecases/movie/get_popular_movies.dart';
import 'package:core/domain/usecases/movie/get_top_rated_movies.dart';
import 'package:core/domain/usecases/movie/get_watchlist_movies.dart';
import 'package:core/domain/usecases/movie/get_watchlist_status.dart';
import 'package:core/domain/usecases/movie/remove_watchlist.dart';
import 'package:core/domain/usecases/movie/save_watchlist.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_event.dart';
part 'movie_state.dart';

// Movie
class NowMovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingMovies _getNowPlayingMovies;

  NowMovieBloc(this._getNowPlayingMovies) : super(MovieEmpty()) {
    on<FetchNowPlayingMovies>((event, emit) async {
      emit(MovieLoading());
      final result = await _getNowPlayingMovies.execute();
      result.fold(
        (l) => emit(MovieError(l.message)),
        (r) => emit(MovieHasData(r)),
      );
    });
  }
}

class PopularMovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetPopularMovies _getPopularMovies;

  PopularMovieBloc(this._getPopularMovies) : super(MovieEmpty()) {
    on<FetchPopularMovies>((event, emit) async {
      emit(MovieLoading());
      final result = await _getPopularMovies.execute();
      result.fold(
        (l) => emit(MovieError(l.message)),
        (r) => emit(MovieHasData(r)),
      );
    });
  }
}

class TopMovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetTopRatedMovies _getTopRatedMovies;

  TopMovieBloc(this._getTopRatedMovies) : super(MovieEmpty()) {
    on<FetchTopRatedMovies>((event, emit) async {
      emit(MovieLoading());
      final result = await _getTopRatedMovies.execute();
      result.fold(
        (l) => emit(MovieError(l.message)),
        (r) => emit(MovieHasData(r)),
      );
    });
  }
}

// Detail Movie
class DetailMovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetMovieDetail _getMovieDetail;

  DetailMovieBloc(this._getMovieDetail) : super(MovieEmpty()) {
    on<FetchDetailMovies>((event, emit) async {
      final id = event.id;
      emit(MovieLoading());
      final result = await _getMovieDetail.execute(id);
      result.fold(
        (l) => emit(MovieError(l.message)),
        (r) async => emit(MovieDetailHasData(r)),
      );
    });
  }
}

class RecommendedMovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetMovieRecommendations _getMovieRecommendations;
  RecommendedMovieBloc(this._getMovieRecommendations) : super(MovieEmpty()) {
    on<FetchRecommendedMovie>(
      (event, emit) async {
        final id = event.id;
        emit(MovieLoading());
        final result = await _getMovieRecommendations.execute(id);
        result.fold(
          (l) => emit(MovieError(l.message)),
          (r) => emit(MovieRecomendHasData(r)),
        );
      },
    );
  }
}

// Watchlist Movie
class WatchlistBloc extends Bloc<MovieEvent, MovieState> {
  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  final GetWatchlistMovies _getWatchlistMovies;
  final GetWatchListStatus _getWatchListStatus;
  final SaveWatchlist _saveWatchlist;
  final RemoveWatchlist _removeWatchlist;

  WatchlistBloc(this._getWatchlistMovies, this._getWatchListStatus,
      this._saveWatchlist, this._removeWatchlist)
      : super(MovieEmpty()) {
    on<FetchWatchlistMovies>(
      (event, emit) async {
        emit(MovieLoading());
        final result = await _getWatchlistMovies.execute();
        result.fold(
          (l) => emit(MovieError(l.message)),
          (r) => emit(WatchlistMovieHasData(r)),
        );
      },
    );

    on<LoadWatchlistStatus>(
      (event, emit) async {
        final id = event.id;
        emit(MovieLoading());
        final result = await _getWatchListStatus.execute(id);
        emit(LoadWatchListHasData(result));
      },
    );

    on<SaveWatchlistMovie>(
      (event, emit) async {
        final movie = event.movie;
        emit(MovieLoading());
        final result = await _saveWatchlist.execute(movie);
        result.fold(
          (l) => emit(MovieError(l.message)),
          (r) => emit(WatchListMessage(r)),
        );
      },
    );

    on<RemoveWatchlistMovie>(
      (event, emit) async {
        final movie = event.movie;
        emit(MovieLoading());
        final result = await _removeWatchlist.execute(movie);
        result.fold(
          (l) => emit(MovieError(l.message)),
          (r) => emit(WatchListMessage(r)),
        );
      },
    );
  }
}
