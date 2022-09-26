import 'package:core/presentation/bloc/tv/tv_bloc.dart';
import 'package:core/presentation/pages/tv_series/popular_tv_series_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dummy_data/tv_series/dummy_objects.dart';
import '../../../helpers/tv_series/test_helper_tv.dart';

void main() {
  late PopularBlocHelper popularBlocHelper;

  setUpAll(() {
    popularBlocHelper = PopularBlocHelper();
    registerFallbackValue(DetailTvEventHelpers());
    registerFallbackValue(DetailTvStateHelper());
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<PopularTvBloc>(
      create: (_) => popularBlocHelper,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  tearDown(() {
    popularBlocHelper.close();
  });

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => popularBlocHelper.state).thenReturn(TvLoading());

    final circularProgress = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(makeTestableWidget(const PopularTvSeriesPage()));
    await tester.pump();

    expect(circularProgress, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(() => popularBlocHelper.state).thenReturn(TvLoading());
    when(() => popularBlocHelper.state).thenReturn(TvHasData(testTvSeriesList));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(makeTestableWidget(const PopularTvSeriesPage()));
    await tester.pump();

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => popularBlocHelper.state)
        .thenReturn(const TvError('Error message'));

    final textMessageKeyFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(makeTestableWidget(const PopularTvSeriesPage()));
    await tester.pump();

    expect(textMessageKeyFinder, findsOneWidget);
  });
}
