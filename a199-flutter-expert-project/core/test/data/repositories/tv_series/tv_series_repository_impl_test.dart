import 'dart:io';

import 'package:core/core.dart';
import 'package:core/data/models/genre_model.dart';
import 'package:core/data/models/tv_series/tv_series_detail_model.dart';
import 'package:core/data/models/tv_series/tv_series_model.dart';
import 'package:core/data/repositories/tv_series/tv_series_repository_impl.dart';
import 'package:core/domain/entities/tv_series/tv_series.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/tv_series/dummy_objects.dart';
import '../../../helpers/tv_series/test_helper.mocks.dart';

void main() {
  late TvSeriesRepositoryImpl repository;
  late MockTvSeriesRemoteDataSource mockRemoteDataSource;
  late MockTvSeriesLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockTvSeriesRemoteDataSource();
    mockLocalDataSource = MockTvSeriesLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = TvSeriesRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  const tTvSeriesModel = TvSeriesModel(
    backdropPath: "/pdfCr8W0wBCpdjbZXSxnKhZtosP.jpg",
    firstAirDate: "2022-09-01",
    genreIds: [10765, 10759, 18],
    id: 84773,
    name: "The Lord of the Rings: The Rings of Power",
    originCountry: ["US"],
    originalLanguage: "en",
    originalName: "The Lord of the Rings: The Rings of Power",
    overview:
        "Beginning in a time of relative peace, we follow an ensemble cast of characters as they confront the re-emergence of evil to Middle-earth. From the darkest depths of the Misty Mountains, to the majestic forests of Lindon, to the breathtaking island kingdom of Númenor, to the furthest reaches of the map, these kingdoms and characters will carve out legacies that live on long after they are gone.",
    popularity: 4962.027,
    posterPath: "/suyNxglk17Cpk8rCM2kZgqKdftk.jpg",
    voteAverage: 7.6,
    voteCount: 541,
  );

  final tTvSeries = TvSeries(
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

  final tTvSeriesModelList = <TvSeriesModel>[tTvSeriesModel];
  final tTvSeriesList = <TvSeries>[tTvSeries];

  group('Now Playing Tv Series', () {
    test('should check if the device is online', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getNowPlayingTvSeries())
          .thenAnswer((_) async => []);
      // act
      await repository.getNowPlayingTvSeries();
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    group('when device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.getNowPlayingTvSeries())
            .thenAnswer((_) async => tTvSeriesModelList);
        // act
        final result = await repository.getNowPlayingTvSeries();
        // assert
        verify(mockRemoteDataSource.getNowPlayingTvSeries());
        /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
        final resultList = result.getOrElse(() => []);
        expect(resultList, tTvSeriesList);
      });

      test(
          'should cache data locally when the call to remote data source is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.getNowPlayingTvSeries())
            .thenAnswer((_) async => tTvSeriesModelList);
        // act
        await repository.getNowPlayingTvSeries();
        // assert
        verify(mockRemoteDataSource.getNowPlayingTvSeries());
        verify(
            mockLocalDataSource.cacheNowPlayingTvSeries([testTvSeriesCache]));
      });

      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        // arrange
        when(mockRemoteDataSource.getNowPlayingTvSeries())
            .thenThrow(ServerException());
        // act
        final result = await repository.getNowPlayingTvSeries();
        // assert
        verify(mockRemoteDataSource.getNowPlayingTvSeries());
        expect(result, equals(const Left(ServerFailure(''))));
      });
    });

    group('when device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test('should return cached data when device is offline', () async {
        // arrange
        when(mockLocalDataSource.getCachedNowPlayingTvSeriess())
            .thenAnswer((_) async => [testTvSeriesCache]);
        // act
        final result = await repository.getNowPlayingTvSeries();
        // assert
        verify(mockLocalDataSource.getCachedNowPlayingTvSeriess());
        final resultList = result.getOrElse(() => []);
        expect(resultList, [testTvSeriesFromCache]);
      });

      test('should return CacheFailure when app has no cache', () async {
        // arrange
        when(mockLocalDataSource.getCachedNowPlayingTvSeriess())
            .thenThrow(CacheException('No Cache'));
        // act
        final result = await repository.getNowPlayingTvSeries();
        // assert
        verify(mockLocalDataSource.getCachedNowPlayingTvSeriess());
        expect(result, const Left(CacheFailure('No Cache')));
      });
    });
  });

  group('Popular TvSeries', () {
    test('should return tv series list when call to data source is success',
        () async {
      // arrange
      when(mockRemoteDataSource.getPopularTvSeries())
          .thenAnswer((_) async => tTvSeriesModelList);
      // act
      final result = await repository.getPopularTvSeries();
      // assert
      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTvSeriesList);
    });

    test(
        'should return server failure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getPopularTvSeries())
          .thenThrow(ServerException());
      // act
      final result = await repository.getPopularTvSeries();
      // assert
      expect(result, const Left(ServerFailure('')));
    });

    test(
        'should return connection failure when device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getPopularTvSeries())
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getPopularTvSeries();
      // assert
      expect(
          result, const Left(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Top Rated TvSeries', () {
    test('should return Tv Series list when call to data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTopRatedTvSeries())
          .thenAnswer((_) async => tTvSeriesModelList);
      // act
      final result = await repository.getTopRatedTvSeries();
      // assert
      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTvSeriesList);
    });

    test('should return ServerFailure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTopRatedTvSeries())
          .thenThrow(ServerException());
      // act
      final result = await repository.getTopRatedTvSeries();
      // assert
      expect(result, const Left(ServerFailure('')));
    });

    test(
        'should return ConnectionFailure when device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getTopRatedTvSeries())
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getTopRatedTvSeries();
      // assert
      expect(
          result, const Left(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Get Tv Series Detail', () {
    const tId = 84773;

    final tTvSeriesDetailModel = TvSeriesDetail(
      adult: false,
      backdropPath: "/pdfCr8W0wBCpdjbZXSxnKhZtosP.jpg",
      episodeRunTime: const [60],
      firstAirDate: DateTime(2022 - 09 - 01),
      genres: const [
        GenreModel(id: 10765, name: "Sci-Fi & Fantasy"),
        GenreModel(id: 10759, name: "Action & Adventure"),
        GenreModel(id: 18, name: "Drama")
      ],
      homepage: "https://www.amazon.com/dp/B09QHC2LZM",
      id: 84773,
      inProduction: true,
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

    test(
        'should return tv series detail data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTvSeriesDetail(tId))
          .thenAnswer((_) async => tTvSeriesDetailModel);
      // act
      final result = await repository.getTvSerieDetail(tId);
      // assert
      verify(mockRemoteDataSource.getTvSeriesDetail(tId));
      expect(result, equals(Right(testTvSeriesDetail)));
    });

    test(
        'should return Server Failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTvSeriesDetail(tId))
          .thenThrow(ServerException());
      // act
      final result = await repository.getTvSerieDetail(tId);
      // assert
      verify(mockRemoteDataSource.getTvSeriesDetail(tId));
      expect(result, equals(const Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getTvSeriesDetail(tId))
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getTvSerieDetail(tId);
      // assert
      verify(mockRemoteDataSource.getTvSeriesDetail(tId));
      expect(result,
          equals(const Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Get Tv Series Recommendations', () {
    final tTvSeriesRecomendations = <TvSeriesModel>[];
    const tId = 84773;

    test('should return data (Tv Series list) when the call is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTvSeriesRecommendations(tId))
          .thenAnswer((_) async => tTvSeriesRecomendations);
      // act
      final result = await repository.getTvSerieRecommendations(tId);
      // assert
      verify(mockRemoteDataSource.getTvSeriesRecommendations(tId));
      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      final resultList = result.getOrElse(() => []);
      expect(resultList, equals(tTvSeriesRecomendations));
    });

    test(
        'should return server failure when call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTvSeriesRecommendations(tId))
          .thenThrow(ServerException());
      // act
      final result = await repository.getTvSerieRecommendations(tId);
      // assertbuild runner
      verify(mockRemoteDataSource.getTvSeriesRecommendations(tId));
      expect(result, equals(const Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getTvSeriesRecommendations(tId))
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getTvSerieRecommendations(tId);
      // assert
      verify(mockRemoteDataSource.getTvSeriesRecommendations(tId));
      expect(result,
          equals(const Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Seach TvSeries', () {
    const tQuery = 'spiderman';

    test('should return tv series list when call to data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.searchTvSeries(tQuery))
          .thenAnswer((_) async => tTvSeriesModelList);
      // act
      final result = await repository.searchTvSeries(tQuery);
      // assert
      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTvSeriesList);
    });

    test('should return ServerFailure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.searchTvSeries(tQuery))
          .thenThrow(ServerException());
      // act
      final result = await repository.searchTvSeries(tQuery);
      // assert
      expect(result, const Left(ServerFailure('')));
    });

    test(
        'should return ConnectionFailure when device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.searchTvSeries(tQuery))
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await repository.searchTvSeries(tQuery);
      // assert
      expect(
          result, const Left(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('save watchlist', () {
    test('should return success message when saving successful', () async {
      // arrange
      when(mockLocalDataSource.insertWatchlist(testTvSeriesTable))
          .thenAnswer((_) async => 'Added to Watchlist');
      // act
      final result = await repository.saveWatchlistTvSeries(testTvSeriesDetail);
      // assert
      expect(result, const Right('Added to Watchlist'));
    });

    test('should return DatabaseFailure when saving unsuccessful', () async {
      // arrange
      when(mockLocalDataSource.insertWatchlist(testTvSeriesTable))
          .thenThrow(DatabaseException('Failed to add watchlist'));
      // act
      final result = await repository.saveWatchlistTvSeries(testTvSeriesDetail);
      // assert
      expect(result, const Left(DatabaseFailure('Failed to add watchlist')));
    });
  });

  group('remove watchlist', () {
    test('should return success message when remove successful', () async {
      // arrange
      when(mockLocalDataSource.removeWatchlist(testTvSeriesTable))
          .thenAnswer((_) async => 'Removed from watchlist');
      // act
      final result =
          await repository.removeWatchlistTvSeries(testTvSeriesDetail);
      // assert
      expect(result, const Right('Removed from watchlist'));
    });

    test('should return DatabaseFailure when remove unsuccessful', () async {
      // arrange
      when(mockLocalDataSource.removeWatchlist(testTvSeriesTable))
          .thenThrow(DatabaseException('Failed to remove watchlist'));
      // act
      final result =
          await repository.removeWatchlistTvSeries(testTvSeriesDetail);
      // assert
      expect(result, const Left(DatabaseFailure('Failed to remove watchlist')));
    });
  });

  group('get watchlist status', () {
    test('should return watch status whether data is found', () async {
      // arrange
      const tId = 84773;
      when(mockLocalDataSource.getTvSeriesById(tId))
          .thenAnswer((_) async => null);
      // act
      final result = await repository.isAddedToWatchlistTvSeries(tId);
      // assert
      expect(result, false);
    });
  });

  group('get watchlist TvSeries', () {
    test('should return list of TvSeries', () async {
      // arrange
      when(mockLocalDataSource.getWatchlistTvSeries())
          .thenAnswer((_) async => [testTvSeriesTable]);
      // act
      final result = await repository.getWatchlistTvSeries();
      // assert
      final resultList = result.getOrElse(() => []);
      expect(resultList, [testWatchlistTvSeries]);
    });
  });
}
