part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object?> get props => [];
}

// Movie
class FetchNowPlayingMovies extends MovieEvent {}

class FetchPopularMovies extends MovieEvent {}

class FetchTopRatedMovies extends MovieEvent {}

// Detail Movie
class FetchDetailMovies extends MovieEvent {
  final int id;

  const FetchDetailMovies(this.id);

  @override
  List<Object?> get props => [id];
}

class FetchRecommendedMovie extends MovieEvent {
  final int id;

  const FetchRecommendedMovie(this.id);

  @override
  List<Object?> get props => [id];
}

// Watchlist Movie
class FetchWatchlistMovies extends MovieEvent {}

class SaveWatchlistMovie extends MovieEvent {
  final MovieDetail movie;

  const SaveWatchlistMovie(this.movie);

  @override
  List<Object?> get props => [movie];
}

class RemoveWatchlistMovie extends MovieEvent {
  final MovieDetail movie;

  const RemoveWatchlistMovie(this.movie);

  @override
  List<Object?> get props => [movie];
}

class LoadWatchlistStatus extends MovieEvent {
  final int id;

  const LoadWatchlistStatus(this.id);

  @override
  List<Object?> get props => [id];
}
