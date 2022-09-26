import 'package:bloc_test/bloc_test.dart';
import 'package:core/presentation/bloc/tv/tv_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// now playing Tv bloc
class NowPlayingTvEventHelper extends Fake implements TvEvent {}

class NowPlayingTvStateHelper extends Fake implements TvState {}

class NowPlayingTvBlocHelper extends MockBloc<TvEvent, TvState>
    implements NowTvBloc {}

// popular Tv bloc
class PopularTvEventHelper extends Fake implements TvEvent {}

class PopularTvStateHelper extends Fake implements TvState {}

class PopularBlocHelper extends MockBloc<TvEvent, TvState>
    implements PopularTvBloc {}

// top rated Tv bloc
class TopRatedTvEventHelper extends Fake implements TvEvent {}

class TopRatedTvStateHelper extends Fake implements TvState {}

class TopRatedTvBlocHelper extends MockBloc<TvEvent, TvState>
    implements TopTvBloc {}

// detail Tv bloc
class DetailTvEventHelpers extends Fake implements TvEvent {}

class DetailTvStateHelper extends Fake implements TvState {}

class DetailTvBlocHelper extends MockBloc<TvEvent, TvState>
    implements DetailTvBloc {}

// Tv recommendations bloc
class TvRecommendEventHelper extends Fake implements TvEvent {}

class TvRecommendStateHelper extends Fake implements TvState {}

class TvRecommendedBlocHelper extends MockBloc<TvEvent, TvState>
    implements RecommendedTvBloc {}

// watchlist Tv bloc
class WatchlistEventHelper extends Fake implements TvEvent {}

class WatchlistStateHelper extends Fake implements TvState {}

class WatchlistBlocHelper extends MockBloc<TvEvent, TvState>
    implements WatchlistTvBloc {}
