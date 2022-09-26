import 'package:core/presentation/bloc/tv/tv_bloc.dart';
import 'package:core/presentation/pages/tv_series/tv_series_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dummy_data/tv_series/dummy_objects.dart';
import '../../../helpers/tv_series/test_helper_tv.dart';

void main() {
  late DetailTvBlocHelper detailTvBlocHelper;
  late WatchlistBlocHelper watchlistBlocHelper;
  late TvRecommendedBlocHelper tvRecommendedBlocHelper;

  setUpAll(() {
    detailTvBlocHelper = DetailTvBlocHelper();
    registerFallbackValue(DetailTvEventHelpers());
    registerFallbackValue(DetailTvStateHelper());

    watchlistBlocHelper = WatchlistBlocHelper();
    registerFallbackValue(WatchlistEventHelper());
    registerFallbackValue(WatchlistStateHelper());

    tvRecommendedBlocHelper = TvRecommendedBlocHelper();
    registerFallbackValue(TvRecommendEventHelper());
    registerFallbackValue(TvRecommendStateHelper());
  });

  Widget makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DetailTvBloc>(
          create: (_) => detailTvBlocHelper,
        ),
        BlocProvider<WatchlistTvBloc>(
          create: (_) => watchlistBlocHelper,
        ),
        BlocProvider<RecommendedTvBloc>(
          create: (_) => tvRecommendedBlocHelper,
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  tearDown(() {
    detailTvBlocHelper.close();
    watchlistBlocHelper.close();
    tvRecommendedBlocHelper.close();
  });

  const id = 84773;

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => detailTvBlocHelper.state).thenReturn(TvLoading());
    when(() => watchlistBlocHelper.state).thenReturn(TvLoading());
    when(() => tvRecommendedBlocHelper.state).thenReturn(TvLoading());

    final circularProgress = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(makeTestableWidget(const TvSeriesDetailPage(
      id: id,
    )));
    await tester.pump();

    expect(circularProgress, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display add icon when tv not added to watchlist',
      (WidgetTester tester) async {
    when(() => detailTvBlocHelper.state)
        .thenReturn(TvDetailHasData(testTvSeriesDetail));
    when(() => watchlistBlocHelper.state)
        .thenReturn(const LoadWatchListTvHasData(false));
    when(() => tvRecommendedBlocHelper.state)
        .thenReturn(TvRecomendHasData(testTvSeriesList));

    final addIconFinder = find.byIcon(Icons.add);

    await tester
        .pumpWidget(makeTestableWidget(const TvSeriesDetailPage(id: id)));
    await tester.pump();

    expect(addIconFinder, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should dispay check icon when tv is added to wathclist',
      (WidgetTester tester) async {
    when(() => detailTvBlocHelper.state)
        .thenReturn(TvDetailHasData(testTvSeriesDetail));
    when(() => watchlistBlocHelper.state)
        .thenReturn(const LoadWatchListTvHasData(true));
    when(() => tvRecommendedBlocHelper.state)
        .thenReturn(TvRecomendHasData(testTvSeriesList));

    final checkIconFinder = find.byIcon(Icons.check);

    await tester
        .pumpWidget(makeTestableWidget(const TvSeriesDetailPage(id: id)));
    await tester.pump();

    expect(checkIconFinder, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display Snackbar when added to watchlist',
      (WidgetTester tester) async {
    when(() => detailTvBlocHelper.state).thenReturn(TvLoading());
    when(() => detailTvBlocHelper.state)
        .thenReturn(TvDetailHasData(testTvSeriesDetail));
    when(() => tvRecommendedBlocHelper.state).thenReturn(TvLoading());
    when(() => tvRecommendedBlocHelper.state).thenReturn(TvEmpty());
    when(() => watchlistBlocHelper.state)
        .thenReturn(const LoadWatchListTvHasData(true));
    when(() => watchlistBlocHelper.state)
        .thenReturn(const WatchListTvMessage('Added to Watchlist'));

    final watchlistButton = find.byType(ElevatedButton);

    await tester
        .pumpWidget(makeTestableWidget(const TvSeriesDetailPage(id: id)));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Added to Watchlist'), findsOneWidget);
  });

  testWidgets('Page should display widget text all required',
      (WidgetTester tester) async {
    when(() => detailTvBlocHelper.state)
        .thenReturn(TvDetailHasData(testTvSeriesDetail));
    when(() => watchlistBlocHelper.state)
        .thenReturn(WatchlistTvHasData(testTvSeriesList));
    when(() => tvRecommendedBlocHelper.state)
        .thenReturn(TvRecomendHasData(testTvSeriesList));

    await tester
        .pumpWidget(makeTestableWidget(const TvSeriesDetailPage(id: id)));
    await tester.pump();

    expect(find.text('Watchlist'), findsOneWidget);
    expect(find.text('Overview'), findsOneWidget);
    expect(find.text('Recommendations'), findsOneWidget);
    expect(find.byKey(const Key('detail_tv')), findsOneWidget);
  });
}
