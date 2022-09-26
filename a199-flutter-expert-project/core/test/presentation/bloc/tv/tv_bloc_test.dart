import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/genre.dart';
import 'package:core/domain/entities/tv_series/tv_series.dart';
import 'package:core/domain/entities/tv_series/tv_series_detail.dart';
import 'package:core/domain/usecases/tv_series/get_now_playing_tv_series.dart';
import 'package:core/domain/usecases/tv_series/get_popular_tv_series.dart';
import 'package:core/domain/usecases/tv_series/get_top_rated_tv_series.dart';
import 'package:core/domain/usecases/tv_series/get_tv_series_detail.dart';
import 'package:core/domain/usecases/tv_series/get_tv_series_recommendations.dart';
import 'package:core/domain/usecases/tv_series/get_watchlist_status_tv_series.dart';
import 'package:core/domain/usecases/tv_series/get_watchlist_tv_series.dart';
import 'package:core/domain/usecases/tv_series/remove_watchlist_tv_series.dart';
import 'package:core/domain/usecases/tv_series/save_watchlist_tv_series.dart';
import 'package:core/presentation/bloc/tv/tv_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'tv_bloc_test.mocks.dart';

@GenerateMocks([
  GetNowPlayingTvSeries,
  GetPopularTvSeries,
  GetTopRatedTvSeries,
  GetTvSeriesDetail,
  GetTvSeriesRecommendations,
  GetWatchListStatusTvSeries,
  SaveWatchlistTvSeries,
  RemoveWatchlistTvSeries,
  GetWatchlistTvSeries
])
void main() {
  late NowTvBloc nowTvBloc;
  late PopularTvBloc popularTvBloc;
  late TopTvBloc topTvBloc;
  late DetailTvBloc detailTvBloc;
  late RecommendedTvBloc recommendedTvBloc;
  late WatchlistTvBloc watchlistTvBloc;

  late MockGetNowPlayingTvSeries mockGetNowPlayingTvSeries;
  late MockGetPopularTvSeries mockGetPopularTvSeries;
  late MockGetTopRatedTvSeries mockGetTopRatedTvSeries;
  late MockGetTvSeriesDetail mockGetTvSeriesDetail;
  late MockGetTvSeriesRecommendations mockGetTvSeriesRecommendations;
  late MockGetWatchListStatusTvSeries mockGetWatchListStatusTvSeries;
  late MockSaveWatchlistTvSeries mockSaveWatchlistTvSeries;
  late MockRemoveWatchlistTvSeries mockRemoveWatchlistTvSeries;
  late MockGetWatchlistTvSeries mockGetWatchlistTvSeries;

  setUp(() {
    mockGetNowPlayingTvSeries = MockGetNowPlayingTvSeries();
    mockGetPopularTvSeries = MockGetPopularTvSeries();
    mockGetTopRatedTvSeries = MockGetTopRatedTvSeries();
    mockGetTvSeriesDetail = MockGetTvSeriesDetail();
    mockGetTvSeriesRecommendations = MockGetTvSeriesRecommendations();
    mockGetWatchListStatusTvSeries = MockGetWatchListStatusTvSeries();
    mockSaveWatchlistTvSeries = MockSaveWatchlistTvSeries();
    mockRemoveWatchlistTvSeries = MockRemoveWatchlistTvSeries();
    mockGetWatchlistTvSeries = MockGetWatchlistTvSeries();

    nowTvBloc = NowTvBloc(mockGetNowPlayingTvSeries);
    popularTvBloc = PopularTvBloc(mockGetPopularTvSeries);
    topTvBloc = TopTvBloc(mockGetTopRatedTvSeries);
    detailTvBloc = DetailTvBloc(mockGetTvSeriesDetail);
    recommendedTvBloc = RecommendedTvBloc(mockGetTvSeriesRecommendations);
    watchlistTvBloc = WatchlistTvBloc(
        mockGetWatchlistTvSeries,
        mockGetWatchListStatusTvSeries,
        mockSaveWatchlistTvSeries,
        mockRemoveWatchlistTvSeries);
  });

  final tTvModel = TvSeries(
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
  final tTvList = <TvSeries>[tTvModel];

  final tTvDetail = TvSeriesDetailEntities(
    adult: false,
    backdropPath: "/pdfCr8W0wBCpdjbZXSxnKhZtosP.jpg",
    episodeRunTime: const [60],
    firstAirDate: DateTime(2022 - 09 - 01),
    genres: const [
      Genre(id: 10765, name: "Sci-Fi & Fantasy"),
      Genre(id: 10759, name: "Action & Adventure"),
      Genre(id: 18, name: "Drama")
    ],
    homepage: "https://www.amazon.com/dp/B09QHC2LZM",
    id: 84773,
    inProduction: false,
    languages: const ["en"],
    lastAirDate: DateTime(2022 - 09 - 08),
    name: "The Lord of the Rings: The Rings of Power",
    numberOfEpisodes: 8,
    numberOfSeasons: 1,
    originCountry: const ["US"],
    originalLanguage: "en",
    originalName: "The Lord of the Rings: The Rings of Power",
    overview:
        "Beginning in a time of relative peace, we follow an ensemble cast of characters as they confront the re-emergence of evil to Middle-earth. From the darkest depths of the Misty Mountains, to the majestic forests of Lindon, to the breathtaking island kingdom of Númenor, to the furthest reaches of the map, these kingdoms and characters will carve out legacies that live on long after they are gone.",
    popularity: 4962.027,
    posterPath: "/suyNxglk17Cpk8rCM2kZgqKdftk.jpg",
    status: "Returning Series",
    tagline: "Journey to Middle-earth.",
    type: "Scripted",
    voteAverage: 7.554,
    voteCount: 555,
  );

  const tId = 84773;

  group('now playing tv', () {
    test('initial state should be empty', () {
      expect(nowTvBloc.state, TvEmpty());
    });

    blocTest(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetNowPlayingTvSeries.execute())
            .thenAnswer((_) async => Right(tTvList));
        return nowTvBloc;
      },
      act: (bloc) => bloc.add(FetchNowPlayingTv()),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        TvLoading(),
        TvHasData(tTvList),
      ],
      verify: (bloc) => verify(mockGetNowPlayingTvSeries.execute()),
    );

    blocTest(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockGetNowPlayingTvSeries.execute()).thenAnswer(
            (realInvocation) async =>
                const Left(ServerFailure('Server Failure')));
        return nowTvBloc;
      },
      act: (bloc) => bloc.add(FetchNowPlayingTv()),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        TvLoading(),
        const TvError('Server Failure'),
      ],
      verify: (bloc) => verify(mockGetNowPlayingTvSeries.execute()),
    );
  });

  group('popular tv', () {
    test('initial state should be empty', () {
      expect(popularTvBloc.state, TvEmpty());
    });

    blocTest(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetPopularTvSeries.execute())
            .thenAnswer((_) async => Right(tTvList));
        return popularTvBloc;
      },
      act: (bloc) => bloc.add(FetchPopularTv()),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        TvLoading(),
        TvHasData(tTvList),
      ],
      verify: (bloc) => verify(mockGetPopularTvSeries.execute()),
    );

    blocTest(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockGetPopularTvSeries.execute()).thenAnswer(
            (realInvocation) async =>
                const Left(ServerFailure('Server Failure')));
        return popularTvBloc;
      },
      act: (bloc) => bloc.add(FetchPopularTv()),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        TvLoading(),
        const TvError('Server Failure'),
      ],
      verify: (bloc) => verify(mockGetPopularTvSeries.execute()),
    );
  });

  group('top rate tv', () {
    test('initial state should be empty', () {
      expect(topTvBloc.state, TvEmpty());
    });

    blocTest(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetTopRatedTvSeries.execute())
            .thenAnswer((_) async => Right(tTvList));
        return topTvBloc;
      },
      act: (bloc) => bloc.add(FetchTopRatedTv()),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        TvLoading(),
        TvHasData(tTvList),
      ],
      verify: (bloc) => verify(mockGetTopRatedTvSeries.execute()),
    );

    blocTest(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockGetTopRatedTvSeries.execute()).thenAnswer(
            (realInvocation) async =>
                const Left(ServerFailure('Server Failure')));
        return topTvBloc;
      },
      act: (bloc) => bloc.add(FetchTopRatedTv()),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        TvLoading(),
        const TvError('Server Failure'),
      ],
      verify: (bloc) => verify(mockGetTopRatedTvSeries.execute()),
    );
  });

  group('Detail tv', () {
    test('initial state should be empty', () {
      expect(detailTvBloc.state, TvEmpty());
    });

    blocTest(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetTvSeriesDetail.execute(tId))
            .thenAnswer((_) async => Right(tTvDetail));
        return detailTvBloc;
      },
      act: (bloc) => bloc.add(const FetchDetailTv(tId)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        TvLoading(),
        TvDetailHasData(tTvDetail),
      ],
      verify: (bloc) => verify(mockGetTvSeriesDetail.execute(tId)),
    );

    blocTest(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockGetTvSeriesDetail.execute(tId)).thenAnswer(
            (realInvocation) async =>
                const Left(ServerFailure('Server Failure')));
        return detailTvBloc;
      },
      act: (bloc) => bloc.add(const FetchDetailTv(tId)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        TvLoading(),
        const TvError('Server Failure'),
      ],
      verify: (bloc) => verify(mockGetTvSeriesDetail.execute(tId)),
    );
  });

  group('Recommended tv', () {
    test('initial state should be empty', () {
      expect(recommendedTvBloc.state, TvEmpty());
    });

    blocTest(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetTvSeriesRecommendations.execute(tId))
            .thenAnswer((_) async => Right(tTvList));
        return recommendedTvBloc;
      },
      act: (bloc) => bloc.add(const FetchRecommendedTv(tId)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        TvLoading(),
        TvRecomendHasData(tTvList),
      ],
      verify: (bloc) => verify(mockGetTvSeriesRecommendations.execute(tId)),
    );

    blocTest(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockGetTvSeriesRecommendations.execute(tId)).thenAnswer(
            (realInvocation) async =>
                const Left(ServerFailure('Server Failure')));
        return recommendedTvBloc;
      },
      act: (bloc) => bloc.add(const FetchRecommendedTv(tId)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        TvLoading(),
        const TvError('Server Failure'),
      ],
      verify: (bloc) => verify(mockGetTvSeriesRecommendations.execute(tId)),
    );
  });

  group('Watchlist Tv', () {
    test('initial state should be empty', () {
      expect(watchlistTvBloc.state, TvEmpty());
    });

    group('Fetch Watchlist Tv', () {
      blocTest(
        'Should emit [Loading, HasData] when data is gotten successfully',
        build: () {
          when(mockGetWatchlistTvSeries.execute())
              .thenAnswer((_) async => Right(tTvList));
          return watchlistTvBloc;
        },
        act: (bloc) => bloc.add(FetchWatchlistTv()),
        wait: const Duration(milliseconds: 500),
        expect: () => [
          TvLoading(),
          WatchlistTvHasData(tTvList),
        ],
        verify: (bloc) => verify(mockGetWatchlistTvSeries.execute()),
      );

      blocTest(
        'Should emit [Loading, Error] when get search is unsuccessful',
        build: () {
          when(mockGetWatchlistTvSeries.execute()).thenAnswer(
              (_) async => const Left(ServerFailure('Server Failure')));
          return watchlistTvBloc;
        },
        act: (bloc) => bloc.add(FetchWatchlistTv()),
        wait: const Duration(milliseconds: 500),
        expect: () => [
          TvLoading(),
          const TvError('Server Failure'),
        ],
        verify: (bloc) => verify(mockGetWatchlistTvSeries.execute()),
      );
    });

    group('Load Watchlist Tv', () {
      blocTest(
        'Should emit [Loading, HasData] when data is gotten successfully',
        build: () {
          when(mockGetWatchListStatusTvSeries.execute(tId))
              .thenAnswer((_) async => true);
          return watchlistTvBloc;
        },
        act: (bloc) => bloc.add(const LoadWatchlistTvStatus(tId)),
        wait: const Duration(milliseconds: 500),
        expect: () => [
          TvLoading(),
          const LoadWatchListTvHasData(true),
        ],
        verify: (bloc) => verify(mockGetWatchListStatusTvSeries.execute(tId)),
      );

      blocTest(
        'Should emit [Loading, Error] when get search is unsuccessful',
        build: () {
          when(mockGetWatchListStatusTvSeries.execute(tId))
              .thenAnswer((_) async => false);
          return watchlistTvBloc;
        },
        act: (bloc) => bloc.add(const LoadWatchlistTvStatus(tId)),
        wait: const Duration(milliseconds: 500),
        expect: () => [
          TvLoading(),
          const LoadWatchListTvHasData(false),
        ],
        verify: (bloc) => verify(mockGetWatchListStatusTvSeries.execute(tId)),
      );
    });

    group('Save Watchlist Tv', () {
      blocTest(
        'Should emit [Loading, HasData] when data is gotten successfully',
        build: () {
          when(mockSaveWatchlistTvSeries.execute(tTvDetail)).thenAnswer(
              (_) async =>
                  const Right(WatchlistTvBloc.watchlistAddSuccessMessage));
          return watchlistTvBloc;
        },
        act: (bloc) => bloc.add(SaveWatchlistTv(tTvDetail)),
        wait: const Duration(milliseconds: 500),
        expect: () => [
          TvLoading(),
          const WatchListTvMessage(WatchlistTvBloc.watchlistAddSuccessMessage),
        ],
        verify: (bloc) => verify(mockSaveWatchlistTvSeries.execute(tTvDetail)),
      );

      blocTest(
        'Should emit [Loading, Error] when get search is unsuccessful',
        build: () {
          when(mockSaveWatchlistTvSeries.execute(tTvDetail)).thenAnswer(
              (_) async => const Left(ServerFailure('Server Failure')));
          return watchlistTvBloc;
        },
        act: (bloc) => bloc.add(SaveWatchlistTv(tTvDetail)),
        wait: const Duration(milliseconds: 500),
        expect: () => [
          TvLoading(),
          const TvError('Server Failure'),
        ],
        verify: (bloc) => verify(mockSaveWatchlistTvSeries.execute(tTvDetail)),
      );
    });

    group('Remove Watchlist Tv', () {
      blocTest(
        'Should emit [Loading, HasData] when data is gotten successfully',
        build: () {
          when(mockRemoveWatchlistTvSeries.execute(tTvDetail)).thenAnswer(
              (_) async =>
                  const Right(WatchlistTvBloc.watchlistAddSuccessMessage));
          return watchlistTvBloc;
        },
        act: (bloc) => bloc.add(RemoveWatchlistTv(tTvDetail)),
        wait: const Duration(milliseconds: 500),
        expect: () => [
          TvLoading(),
          const WatchListTvMessage(WatchlistTvBloc.watchlistAddSuccessMessage),
        ],
        verify: (bloc) =>
            verify(mockRemoveWatchlistTvSeries.execute(tTvDetail)),
      );

      blocTest(
        'Should emit [Loading, Error] when get search is unsuccessful',
        build: () {
          when(mockRemoveWatchlistTvSeries.execute(tTvDetail)).thenAnswer(
              (_) async => const Left(ServerFailure('Server Failure')));
          return watchlistTvBloc;
        },
        act: (bloc) => bloc.add(RemoveWatchlistTv(tTvDetail)),
        wait: const Duration(milliseconds: 500),
        expect: () => [
          TvLoading(),
          const TvError('Server Failure'),
        ],
        verify: (bloc) =>
            verify(mockRemoveWatchlistTvSeries.execute(tTvDetail)),
      );
    });
  });
}
