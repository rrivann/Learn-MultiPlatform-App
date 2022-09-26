import 'package:core/presentation/bloc/tv/tv_bloc.dart';
import 'package:core/presentation/pages/tv_series/home_tv_series_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dummy_data/tv_series/dummy_objects.dart';
import '../../../helpers/tv_series/test_helper_tv.dart';

void main() {
  late NowPlayingTvBlocHelper nowPlayingTvBlocHelper;
  late PopularBlocHelper popularBlocHelper;
  late TopRatedTvBlocHelper topRatedTvBlocHelper;

  setUpAll(() {
    nowPlayingTvBlocHelper = NowPlayingTvBlocHelper();
    registerFallbackValue(DetailTvEventHelpers());
    registerFallbackValue(DetailTvStateHelper());

    popularBlocHelper = PopularBlocHelper();
    registerFallbackValue(WatchlistEventHelper());
    registerFallbackValue(WatchlistStateHelper());

    topRatedTvBlocHelper = TopRatedTvBlocHelper();
    registerFallbackValue(TvRecommendEventHelper());
    registerFallbackValue(TvRecommendStateHelper());
  });

  Widget makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NowTvBloc>(
          create: (_) => nowPlayingTvBlocHelper,
        ),
        BlocProvider<PopularTvBloc>(
          create: (_) => popularBlocHelper,
        ),
        BlocProvider<TopTvBloc>(
          create: (_) => topRatedTvBlocHelper,
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  tearDown(() {
    nowPlayingTvBlocHelper.close();
    popularBlocHelper.close();
    topRatedTvBlocHelper.close();
  });

  testWidgets('Page should display ListView when Data is loaded',
      (WidgetTester tester) async {
    when(() => nowPlayingTvBlocHelper.state).thenReturn(TvLoading());
    when(() => nowPlayingTvBlocHelper.state)
        .thenReturn(TvHasData(testTvSeriesList));
    when(() => popularBlocHelper.state).thenReturn(TvHasData(testTvSeriesList));
    when(() => nowPlayingTvBlocHelper.state).thenReturn(TvLoading());
    when(() => topRatedTvBlocHelper.state)
        .thenReturn(TvHasData(testTvSeriesList));
    when(() => nowPlayingTvBlocHelper.state).thenReturn(TvLoading());

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(makeTestableWidget(const HomeTvSeriesPage()));

    expect(listViewFinder, findsWidgets);
  });
}
