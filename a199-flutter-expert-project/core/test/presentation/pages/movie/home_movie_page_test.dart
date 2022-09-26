import 'package:core/presentation/bloc/movie/movie_bloc.dart';
import 'package:core/presentation/pages/movie/home_movie_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dummy_data/movie/dummy_objects.dart';
import '../../../helpers/movie/test_helper_movie.dart';

void main() {
  late NowPlayingMoviesBlocHelper nowPlayingMoviesBlocHelper;
  late PopularBlocHelper popularBlocHelper;
  late TopRatedMoviesBlocHelper topRatedMoviesBlocHelper;

  setUpAll(() {
    nowPlayingMoviesBlocHelper = NowPlayingMoviesBlocHelper();
    registerFallbackValue(DetailMovieEventHelpers());
    registerFallbackValue(DetailMovieStateHelper());

    popularBlocHelper = PopularBlocHelper();
    registerFallbackValue(WatchlistEventHelper());
    registerFallbackValue(WatchlistStateHelper());

    topRatedMoviesBlocHelper = TopRatedMoviesBlocHelper();
    registerFallbackValue(MovieRecommendEventHelper());
    registerFallbackValue(MovieRecommendStateHelper());
  });

  Widget makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NowMovieBloc>(
          create: (_) => nowPlayingMoviesBlocHelper,
        ),
        BlocProvider<PopularMovieBloc>(
          create: (_) => popularBlocHelper,
        ),
        BlocProvider<TopMovieBloc>(
          create: (_) => topRatedMoviesBlocHelper,
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  tearDown(() {
    nowPlayingMoviesBlocHelper.close();
    popularBlocHelper.close();
    topRatedMoviesBlocHelper.close();
  });

  testWidgets('Page should display ListView when Data is loaded',
      (WidgetTester tester) async {
    when(() => nowPlayingMoviesBlocHelper.state).thenReturn(MovieLoading());
    when(() => nowPlayingMoviesBlocHelper.state)
        .thenReturn(MovieHasData(testMovieList));
    when(() => popularBlocHelper.state).thenReturn(MovieHasData(testMovieList));
    when(() => nowPlayingMoviesBlocHelper.state).thenReturn(MovieLoading());
    when(() => topRatedMoviesBlocHelper.state)
        .thenReturn(MovieHasData(testMovieList));
    when(() => nowPlayingMoviesBlocHelper.state).thenReturn(MovieLoading());

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(makeTestableWidget(const HomeMoviePage()));

    expect(listViewFinder, findsWidgets);
  });
}
