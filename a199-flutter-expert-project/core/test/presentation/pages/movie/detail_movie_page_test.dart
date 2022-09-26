import 'package:core/presentation/bloc/movie/movie_bloc.dart';
import 'package:core/presentation/pages/movie/movie_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dummy_data/movie/dummy_objects.dart';
import '../../../helpers/movie/test_helper_movie.dart';

void main() {
  late DetailMovieBlocHelper detailMovieBlocHelper;
  late WatchlistBlocHelper watchlistBlocHelper;
  late MovieRecommendedBlocHelper movieRecommendedBlocHelper;

  setUpAll(() {
    detailMovieBlocHelper = DetailMovieBlocHelper();
    registerFallbackValue(DetailMovieEventHelpers());
    registerFallbackValue(DetailMovieStateHelper());

    watchlistBlocHelper = WatchlistBlocHelper();
    registerFallbackValue(WatchlistEventHelper());
    registerFallbackValue(WatchlistStateHelper());

    movieRecommendedBlocHelper = MovieRecommendedBlocHelper();
    registerFallbackValue(MovieRecommendEventHelper());
    registerFallbackValue(MovieRecommendStateHelper());
  });

  Widget makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DetailMovieBloc>(
          create: (_) => detailMovieBlocHelper,
        ),
        BlocProvider<WatchlistBloc>(
          create: (_) => watchlistBlocHelper,
        ),
        BlocProvider<RecommendedMovieBloc>(
          create: (_) => movieRecommendedBlocHelper,
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  tearDown(() {
    detailMovieBlocHelper.close();
    watchlistBlocHelper.close();
    movieRecommendedBlocHelper.close();
  });

  const id = 1;

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => detailMovieBlocHelper.state).thenReturn(MovieLoading());
    when(() => watchlistBlocHelper.state).thenReturn(MovieLoading());
    when(() => movieRecommendedBlocHelper.state).thenReturn(MovieLoading());

    final circularProgress = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(
      id: id,
    )));
    await tester.pump();

    expect(circularProgress, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display add icon when movie not added to watchlist',
      (WidgetTester tester) async {
    when(() => detailMovieBlocHelper.state)
        .thenReturn(const MovieDetailHasData(testMovieDetail));
    when(() => watchlistBlocHelper.state)
        .thenReturn(const LoadWatchListHasData(false));
    when(() => movieRecommendedBlocHelper.state)
        .thenReturn(MovieRecomendHasData(testMovieList));

    final addIconFinder = find.byIcon(Icons.add);

    await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: id)));
    await tester.pump();

    expect(addIconFinder, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should dispay check icon when movie is added to wathclist',
      (WidgetTester tester) async {
    when(() => detailMovieBlocHelper.state)
        .thenReturn(const MovieDetailHasData(testMovieDetail));
    when(() => watchlistBlocHelper.state)
        .thenReturn(const LoadWatchListHasData(true));
    when(() => movieRecommendedBlocHelper.state)
        .thenReturn(MovieRecomendHasData(testMovieList));

    final checkIconFinder = find.byIcon(Icons.check);

    await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: id)));
    await tester.pump();

    expect(checkIconFinder, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display Snackbar when added to watchlist',
      (WidgetTester tester) async {
    when(() => detailMovieBlocHelper.state).thenReturn(MovieLoading());
    when(() => detailMovieBlocHelper.state)
        .thenReturn(const MovieDetailHasData(testMovieDetail));
    when(() => movieRecommendedBlocHelper.state).thenReturn(MovieLoading());
    when(() => movieRecommendedBlocHelper.state).thenReturn(MovieEmpty());
    when(() => watchlistBlocHelper.state)
        .thenReturn(const LoadWatchListHasData(true));
    when(() => watchlistBlocHelper.state)
        .thenReturn(const WatchListMessage('Added to Watchlist'));

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: id)));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Added to Watchlist'), findsOneWidget);
  });

  testWidgets('Page should display widget text all required',
      (WidgetTester tester) async {
    when(() => detailMovieBlocHelper.state)
        .thenReturn(const MovieDetailHasData(testMovieDetail));
    when(() => watchlistBlocHelper.state)
        .thenReturn(WatchlistMovieHasData(testMovieList));
    when(() => movieRecommendedBlocHelper.state)
        .thenReturn(MovieRecomendHasData(testMovieList));

    await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: id)));
    await tester.pump();

    expect(find.text('Watchlist'), findsOneWidget);
    expect(find.text('Overview'), findsOneWidget);
    expect(find.text('Recommendations'), findsOneWidget);
    expect(find.byKey(const Key('detail_movie')), findsOneWidget);
  });
}
