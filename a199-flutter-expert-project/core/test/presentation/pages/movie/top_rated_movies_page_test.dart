import 'package:core/presentation/bloc/movie/movie_bloc.dart';
import 'package:core/presentation/pages/movie/top_rated_movies_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dummy_data/movie/dummy_objects.dart';
import '../../../helpers/movie/test_helper_movie.dart';

void main() {
  late TopRatedMoviesBlocHelper topRatedMoviesBlocHelper;

  setUpAll(() {
    topRatedMoviesBlocHelper = TopRatedMoviesBlocHelper();
    registerFallbackValue(DetailMovieEventHelpers());
    registerFallbackValue(DetailMovieStateHelper());
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<TopMovieBloc>(
      create: (_) => topRatedMoviesBlocHelper,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  tearDown(() {
    topRatedMoviesBlocHelper.close();
  });

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => topRatedMoviesBlocHelper.state).thenReturn(MovieLoading());

    final circularProgress = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(makeTestableWidget(const TopRatedMoviesPage()));
    await tester.pump();

    expect(circularProgress, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(() => topRatedMoviesBlocHelper.state).thenReturn(MovieLoading());
    when(() => topRatedMoviesBlocHelper.state)
        .thenReturn(MovieHasData(testMovieList));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(makeTestableWidget(const TopRatedMoviesPage()));
    await tester.pump();

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => topRatedMoviesBlocHelper.state)
        .thenReturn(const MovieError('Error message'));

    final textMessageKeyFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(makeTestableWidget(const TopRatedMoviesPage()));
    await tester.pump();

    expect(textMessageKeyFinder, findsOneWidget);
  });
}
