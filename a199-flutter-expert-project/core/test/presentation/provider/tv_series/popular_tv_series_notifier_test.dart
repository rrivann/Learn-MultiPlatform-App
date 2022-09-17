import 'package:dartz/dartz.dart';
import 'package:core/core.dart';

import 'package:core/domain/entities/tv_series/tv_series.dart';
import 'package:core/domain/usecases/tv_series/get_popular_tv_series.dart';
import 'package:core/presentation/provider/tv_series/popular_tv_series_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'popular_tv_series_notifier_test.mocks.dart';

@GenerateMocks([GetPopularTvSeries])
void main() {
  late MockGetPopularTvSeries mockGetPopularTvSeries;
  late PopularTvSeriesNotifier notifier;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetPopularTvSeries = MockGetPopularTvSeries();
    notifier = PopularTvSeriesNotifier(mockGetPopularTvSeries)
      ..addListener(() {
        listenerCallCount++;
      });
  });

  final tTvSerie = TvSeries(
    backdropPath: "/pdfCr8W0wBCpdjbZXSxnKhZtosP.jpg",
    firstAirDate: "2022-09-01",
    genreIds: const [10765, 10759, 18],
    id: 84773,
    name: "The Lord of the Rings: The Rings of Power",
    originCountry: const ["US"],
    originalLanguage: "en",
    originalName: "The Lord of the Rings: The Rings of Power",
    overview:
        "Beginning in a time of relative peace, we follow an ensemble cast of characters as they confront the re-emergence of evil to Middle-earth. From the darkest depths of the Misty Mountains, to the majestic forests of Lindon, to the breathtaking island kingdom of Númenor, to the furthest reaches of the map, these kingdoms and characters will carve out legacies that live on long after they are gone.",
    popularity: 4962.027,
    posterPath: "/suyNxglk17Cpk8rCM2kZgqKdftk.jpg",
    voteAverage: 7.6,
    voteCount: 541,
  );

  final tTvSeriesList = <TvSeries>[tTvSerie];

  test('should change state to loading when usecase is called', () async {
    // arrange
    when(mockGetPopularTvSeries.execute())
        .thenAnswer((_) async => Right(tTvSeriesList));
    // act
    notifier.fetchPopularTvSeries();
    // assert
    expect(notifier.state, RequestState.loading);
    expect(listenerCallCount, 1);
  });

  test('should change tv series data when data is gotten successfully',
      () async {
    // arrange
    when(mockGetPopularTvSeries.execute())
        .thenAnswer((_) async => Right(tTvSeriesList));
    // act
    await notifier.fetchPopularTvSeries();
    // assert
    expect(notifier.state, RequestState.loaded);
    expect(notifier.tvSeries, tTvSeriesList);
    expect(listenerCallCount, 2);
  });

  test('should return error when data is unsuccessful', () async {
    // arrange
    when(mockGetPopularTvSeries.execute())
        .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
    // act
    await notifier.fetchPopularTvSeries();
    // assert
    expect(notifier.state, RequestState.error);
    expect(notifier.message, 'Server Failure');
    expect(listenerCallCount, 2);
  });
}
