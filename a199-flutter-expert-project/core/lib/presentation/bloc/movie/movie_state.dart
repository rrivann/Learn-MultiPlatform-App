part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();
}

class MovieEmpty extends MovieState {
  @override
  List<Object?> get props => [];
}

class MovieLoading extends MovieState {
  @override
  List<Object?> get props => [];
}

class MovieError extends MovieState {
  final String message;

  const MovieError(this.message);

  @override
  List<Object?> get props => [message];
}

// Movie
class MovieHasData extends MovieState {
  final List<Movie> result;

  const MovieHasData(this.result);

  @override
  List<Object?> get props => [result];
}

// Detail Movie
class MovieDetailHasData extends MovieState {
  final MovieDetail resultMovieDetail;

  const MovieDetailHasData(this.resultMovieDetail);

  @override
  List<Object?> get props => [resultMovieDetail];
}

class MovieRecomendHasData extends MovieState {
  final List<Movie> result;

  const MovieRecomendHasData(this.result);

  @override
  List<Object?> get props => [result];
}

// Watchlist Movie
class WatchlistMovieHasData extends MovieState {
  final List<Movie> result;

  const WatchlistMovieHasData(this.result);

  @override
  List<Object?> get props => [result];
}

class WatchListMessage extends MovieState {
  final String message;

  const WatchListMessage(this.message);

  @override
  List<Object?> get props => [message];
}

class LoadWatchListHasData extends MovieState {
  final bool isAddedToWatchlist;

  const LoadWatchListHasData(this.isAddedToWatchlist);

  @override
  List<Object?> get props => [isAddedToWatchlist];
}
