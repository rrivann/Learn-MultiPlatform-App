import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/genre.dart';
import 'package:core/domain/entities/movie/movie.dart';
import 'package:core/domain/entities/movie/movie_detail.dart';
import 'package:core/domain/usecases/movie/get_movie_detail.dart';
import 'package:core/domain/usecases/movie/get_movie_recommendations.dart';
import 'package:core/domain/usecases/movie/get_now_playing_movies.dart';
import 'package:core/domain/usecases/movie/get_popular_movies.dart';
import 'package:core/domain/usecases/movie/get_top_rated_movies.dart';
import 'package:core/domain/usecases/movie/get_watchlist_movies.dart';
import 'package:core/domain/usecases/movie/get_watchlist_status.dart';
import 'package:core/domain/usecases/movie/remove_watchlist.dart';
import 'package:core/domain/usecases/movie/save_watchlist.dart';
import 'package:core/presentation/bloc/movie/movie_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'movie_bloc_test.mocks.dart';

@GenerateMocks([
  GetNowPlayingMovies,
  GetPopularMovies,
  GetTopRatedMovies,
  GetMovieDetail,
  GetMovieRecommendations,
  GetWatchListStatus,
  SaveWatchlist,
  RemoveWatchlist,
  GetWatchlistMovies
])
void main() {
  late NowMovieBloc nowMovieBloc;
  late PopularMovieBloc popularMovieBloc;
  late TopMovieBloc topMovieBloc;
  late DetailMovieBloc detailMovieBloc;
  late RecommendedMovieBloc recommendedMovieBloc;
  late WatchlistBloc watchlistBloc;

  late MockGetNowPlayingMovies mockGetNowPlayingMovies;
  late MockGetPopularMovies mockGetPopularMovies;
  late MockGetTopRatedMovies mockGetTopRatedMovies;
  late MockGetMovieDetail mockGetMovieDetail;
  late MockGetMovieRecommendations mockGetMovieRecommendations;
  late MockGetWatchListStatus mockGetWatchListStatus;
  late MockSaveWatchlist mockSaveWatchlist;
  late MockRemoveWatchlist mockRemoveWatchlist;
  late MockGetWatchlistMovies mockGetWatchlistMovies;

  setUp(() {
    mockGetNowPlayingMovies = MockGetNowPlayingMovies();
    mockGetPopularMovies = MockGetPopularMovies();
    mockGetTopRatedMovies = MockGetTopRatedMovies();
    mockGetMovieDetail = MockGetMovieDetail();
    mockGetMovieRecommendations = MockGetMovieRecommendations();
    mockGetWatchListStatus = MockGetWatchListStatus();
    mockSaveWatchlist = MockSaveWatchlist();
    mockRemoveWatchlist = MockRemoveWatchlist();
    mockGetWatchlistMovies = MockGetWatchlistMovies();

    nowMovieBloc = NowMovieBloc(mockGetNowPlayingMovies);
    popularMovieBloc = PopularMovieBloc(mockGetPopularMovies);
    topMovieBloc = TopMovieBloc(mockGetTopRatedMovies);
    detailMovieBloc = DetailMovieBloc(mockGetMovieDetail);
    recommendedMovieBloc = RecommendedMovieBloc(mockGetMovieRecommendations);
    watchlistBloc = WatchlistBloc(mockGetWatchlistMovies,
        mockGetWatchListStatus, mockSaveWatchlist, mockRemoveWatchlist);
  });

  final tMovieModel = Movie(
    adult: false,
    backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
    genreIds: const [14, 28],
    id: 557,
    originalTitle: 'Spider-Man',
    overview:
        'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
    popularity: 60.441,
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    releaseDate: '2002-05-01',
    title: 'Spider-Man',
    video: false,
    voteAverage: 7.2,
    voteCount: 13507,
  );
  final tMovieList = <Movie>[tMovieModel];

  const tMovieDetail = MovieDetail(
    adult: false,
    backdropPath: 'backdropPath',
    genres: [Genre(id: 1, name: 'Action')],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    runtime: 120,
    title: 'title',
    voteAverage: 1,
    voteCount: 1,
  );

  const tId = 1;

  group('now playing movie', () {
    test('initial state should be empty', () {
      expect(nowMovieBloc.state, MovieEmpty());
    });

    blocTest(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetNowPlayingMovies.execute())
            .thenAnswer((_) async => Right(tMovieList));
        return nowMovieBloc;
      },
      act: (bloc) => bloc.add(FetchNowPlayingMovies()),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        MovieLoading(),
        MovieHasData(tMovieList),
      ],
      verify: (bloc) => verify(mockGetNowPlayingMovies.execute()),
    );

    blocTest(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockGetNowPlayingMovies.execute()).thenAnswer(
            (realInvocation) async =>
                const Left(ServerFailure('Server Failure')));
        return nowMovieBloc;
      },
      act: (bloc) => bloc.add(FetchNowPlayingMovies()),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        MovieLoading(),
        const MovieError('Server Failure'),
      ],
      verify: (bloc) => verify(mockGetNowPlayingMovies.execute()),
    );
  });

  group('popular movie', () {
    test('initial state should be empty', () {
      expect(popularMovieBloc.state, MovieEmpty());
    });

    blocTest(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetPopularMovies.execute())
            .thenAnswer((_) async => Right(tMovieList));
        return popularMovieBloc;
      },
      act: (bloc) => bloc.add(FetchPopularMovies()),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        MovieLoading(),
        MovieHasData(tMovieList),
      ],
      verify: (bloc) => verify(mockGetPopularMovies.execute()),
    );

    blocTest(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockGetPopularMovies.execute()).thenAnswer(
            (realInvocation) async =>
                const Left(ServerFailure('Server Failure')));
        return popularMovieBloc;
      },
      act: (bloc) => bloc.add(FetchPopularMovies()),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        MovieLoading(),
        const MovieError('Server Failure'),
      ],
      verify: (bloc) => verify(mockGetPopularMovies.execute()),
    );
  });

  group('top rate movie', () {
    test('initial state should be empty', () {
      expect(topMovieBloc.state, MovieEmpty());
    });

    blocTest(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetTopRatedMovies.execute())
            .thenAnswer((_) async => Right(tMovieList));
        return topMovieBloc;
      },
      act: (bloc) => bloc.add(FetchTopRatedMovies()),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        MovieLoading(),
        MovieHasData(tMovieList),
      ],
      verify: (bloc) => verify(mockGetTopRatedMovies.execute()),
    );

    blocTest(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockGetTopRatedMovies.execute()).thenAnswer(
            (realInvocation) async =>
                const Left(ServerFailure('Server Failure')));
        return topMovieBloc;
      },
      act: (bloc) => bloc.add(FetchTopRatedMovies()),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        MovieLoading(),
        const MovieError('Server Failure'),
      ],
      verify: (bloc) => verify(mockGetTopRatedMovies.execute()),
    );
  });

  group('Detail movie', () {
    test('initial state should be empty', () {
      expect(detailMovieBloc.state, MovieEmpty());
    });

    blocTest(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetMovieDetail.execute(tId))
            .thenAnswer((_) async => const Right(tMovieDetail));
        return detailMovieBloc;
      },
      act: (bloc) => bloc.add(const FetchDetailMovies(tId)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        MovieLoading(),
        const MovieDetailHasData(tMovieDetail),
      ],
      verify: (bloc) => verify(mockGetMovieDetail.execute(tId)),
    );

    blocTest(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockGetMovieDetail.execute(tId)).thenAnswer(
            (realInvocation) async =>
                const Left(ServerFailure('Server Failure')));
        return detailMovieBloc;
      },
      act: (bloc) => bloc.add(const FetchDetailMovies(tId)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        MovieLoading(),
        const MovieError('Server Failure'),
      ],
      verify: (bloc) => verify(mockGetMovieDetail.execute(tId)),
    );
  });

  group('Recommended Movie', () {
    test('initial state should be empty', () {
      expect(recommendedMovieBloc.state, MovieEmpty());
    });

    blocTest(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetMovieRecommendations.execute(tId))
            .thenAnswer((_) async => Right(tMovieList));
        return recommendedMovieBloc;
      },
      act: (bloc) => bloc.add(const FetchRecommendedMovie(tId)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        MovieLoading(),
        MovieRecomendHasData(tMovieList),
      ],
      verify: (bloc) => verify(mockGetMovieRecommendations.execute(tId)),
    );

    blocTest(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockGetMovieRecommendations.execute(tId)).thenAnswer(
            (realInvocation) async =>
                const Left(ServerFailure('Server Failure')));
        return recommendedMovieBloc;
      },
      act: (bloc) => bloc.add(const FetchRecommendedMovie(tId)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        MovieLoading(),
        const MovieError('Server Failure'),
      ],
      verify: (bloc) => verify(mockGetMovieRecommendations.execute(tId)),
    );
  });

  group('Watchlist Movie', () {
    test('initial state should be empty', () {
      expect(watchlistBloc.state, MovieEmpty());
    });

    group('Fetch Watchlist Movie', () {
      blocTest(
        'Should emit [Loading, HasData] when data is gotten successfully',
        build: () {
          when(mockGetWatchlistMovies.execute())
              .thenAnswer((_) async => Right(tMovieList));
          return watchlistBloc;
        },
        act: (bloc) => bloc.add(FetchWatchlistMovies()),
        wait: const Duration(milliseconds: 500),
        expect: () => [
          MovieLoading(),
          WatchlistMovieHasData(tMovieList),
        ],
        verify: (bloc) => verify(mockGetWatchlistMovies.execute()),
      );

      blocTest(
        'Should emit [Loading, Error] when get search is unsuccessful',
        build: () {
          when(mockGetWatchlistMovies.execute()).thenAnswer(
              (_) async => const Left(ServerFailure('Server Failure')));
          return watchlistBloc;
        },
        act: (bloc) => bloc.add(FetchWatchlistMovies()),
        wait: const Duration(milliseconds: 500),
        expect: () => [
          MovieLoading(),
          const MovieError('Server Failure'),
        ],
        verify: (bloc) => verify(mockGetWatchlistMovies.execute()),
      );
    });

    group('Load Watchlist Movie', () {
      blocTest(
        'Should emit [Loading, HasData] when data is gotten successfully',
        build: () {
          when(mockGetWatchListStatus.execute(tId))
              .thenAnswer((_) async => true);
          return watchlistBloc;
        },
        act: (bloc) => bloc.add(const LoadWatchlistStatus(tId)),
        wait: const Duration(milliseconds: 500),
        expect: () => [
          MovieLoading(),
          const LoadWatchListHasData(true),
        ],
        verify: (bloc) => verify(mockGetWatchListStatus.execute(tId)),
      );

      blocTest(
        'Should emit [Loading, Error] when get search is unsuccessful',
        build: () {
          when(mockGetWatchListStatus.execute(tId))
              .thenAnswer((_) async => false);
          return watchlistBloc;
        },
        act: (bloc) => bloc.add(const LoadWatchlistStatus(tId)),
        wait: const Duration(milliseconds: 500),
        expect: () => [
          MovieLoading(),
          const LoadWatchListHasData(false),
        ],
        verify: (bloc) => verify(mockGetWatchListStatus.execute(tId)),
      );
    });

    group('Save Watchlist Movie', () {
      blocTest(
        'Should emit [Loading, HasData] when data is gotten successfully',
        build: () {
          when(mockSaveWatchlist.execute(tMovieDetail)).thenAnswer((_) async =>
              const Right(WatchlistBloc.watchlistAddSuccessMessage));
          return watchlistBloc;
        },
        act: (bloc) => bloc.add(const SaveWatchlistMovie(tMovieDetail)),
        wait: const Duration(milliseconds: 500),
        expect: () => [
          MovieLoading(),
          const WatchListMessage(WatchlistBloc.watchlistAddSuccessMessage),
        ],
        verify: (bloc) => verify(mockSaveWatchlist.execute(tMovieDetail)),
      );

      blocTest(
        'Should emit [Loading, Error] when get search is unsuccessful',
        build: () {
          when(mockSaveWatchlist.execute(tMovieDetail)).thenAnswer(
              (_) async => const Left(ServerFailure('Server Failure')));
          return watchlistBloc;
        },
        act: (bloc) => bloc.add(const SaveWatchlistMovie(tMovieDetail)),
        wait: const Duration(milliseconds: 500),
        expect: () => [
          MovieLoading(),
          const MovieError('Server Failure'),
        ],
        verify: (bloc) => verify(mockSaveWatchlist.execute(tMovieDetail)),
      );
    });

    group('Remove Watchlist Movie', () {
      blocTest(
        'Should emit [Loading, HasData] when data is gotten successfully',
        build: () {
          when(mockRemoveWatchlist.execute(tMovieDetail)).thenAnswer(
              (_) async =>
                  const Right(WatchlistBloc.watchlistAddSuccessMessage));
          return watchlistBloc;
        },
        act: (bloc) => bloc.add(const RemoveWatchlistMovie(tMovieDetail)),
        wait: const Duration(milliseconds: 500),
        expect: () => [
          MovieLoading(),
          const WatchListMessage(WatchlistBloc.watchlistAddSuccessMessage),
        ],
        verify: (bloc) => verify(mockRemoveWatchlist.execute(tMovieDetail)),
      );

      blocTest(
        'Should emit [Loading, Error] when get search is unsuccessful',
        build: () {
          when(mockRemoveWatchlist.execute(tMovieDetail)).thenAnswer(
              (_) async => const Left(ServerFailure('Server Failure')));
          return watchlistBloc;
        },
        act: (bloc) => bloc.add(const RemoveWatchlistMovie(tMovieDetail)),
        wait: const Duration(milliseconds: 500),
        expect: () => [
          MovieLoading(),
          const MovieError('Server Failure'),
        ],
        verify: (bloc) => verify(mockRemoveWatchlist.execute(tMovieDetail)),
      );
    });
  });
}
