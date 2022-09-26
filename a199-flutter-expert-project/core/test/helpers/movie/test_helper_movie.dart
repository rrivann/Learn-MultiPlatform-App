import 'package:core/presentation/bloc/movie/movie_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

// now playing movies bloc
class NowPlayingMoviesEventHelper extends Fake implements MovieEvent {}

class NowPlayingMoviesStateHelper extends Fake implements MovieState {}

class NowPlayingMoviesBlocHelper extends MockBloc<MovieEvent, MovieState>
    implements NowMovieBloc {}

// popular movies bloc
class PopularMoviesEventHelper extends Fake implements MovieEvent {}

class PopularMoviesStateHelper extends Fake implements MovieState {}

class PopularBlocHelper extends MockBloc<MovieEvent, MovieState>
    implements PopularMovieBloc {}

// top rated movies bloc
class TopRatedMoviesEventHelper extends Fake implements MovieEvent {}

class TopRatedMoviesStateHelper extends Fake implements MovieState {}

class TopRatedMoviesBlocHelper extends MockBloc<MovieEvent, MovieState>
    implements TopMovieBloc {}

// detail movie bloc
class DetailMovieEventHelpers extends Fake implements MovieEvent {}

class DetailMovieStateHelper extends Fake implements MovieState {}

class DetailMovieBlocHelper extends MockBloc<MovieEvent, MovieState>
    implements DetailMovieBloc {}

// movie recommendations bloc
class MovieRecommendEventHelper extends Fake implements MovieEvent {}

class MovieRecommendStateHelper extends Fake implements MovieState {}

class MovieRecommendedBlocHelper extends MockBloc<MovieEvent, MovieState>
    implements RecommendedMovieBloc {}

// watchlist movies bloc
class WatchlistEventHelper extends Fake implements MovieEvent {}

class WatchlistStateHelper extends Fake implements MovieState {}

class WatchlistBlocHelper extends MockBloc<MovieEvent, MovieState>
    implements WatchlistBloc {}
