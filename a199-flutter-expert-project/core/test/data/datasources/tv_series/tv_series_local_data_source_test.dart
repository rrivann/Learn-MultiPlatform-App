import 'dart:convert';
import 'dart:io';

import 'package:core/common/base_url.dart';
import 'package:core/core.dart';
import 'package:core/data/datasources/tv_series/tv_series_local_data_source.dart';
import 'package:core/data/datasources/tv_series/tv_series_remote_data_source.dart';
import 'package:core/data/models/tv_series/tv_series_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../dummy_data/tv_series/dummy_objects.dart';
import '../../../helpers/tv_series/test_helper.mocks.dart';
import '../../../json_reader.dart';
import 'package:http/http.dart' as http;

void main() {
  late TvSeriesLocalDataSourceImpl dataSource;
  late MockTvSeriesDatabaseHelper mockDatabaseHelper;
  late TvSeriesRemoteDataSourceImpl remoteDataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockDatabaseHelper = MockTvSeriesDatabaseHelper();
    dataSource =
        TvSeriesLocalDataSourceImpl(databaseHelper: mockDatabaseHelper);

    mockHttpClient = MockHttpClient();
    remoteDataSource = TvSeriesRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('save watchlist', () {
    final tTvSeriesList = TvSeriesResponse.fromJson(
            json.decode(readJson('dummy_data/tv_series/now_playing.json')))
        .tvSeriesList;
    test('should return success message when insert to database is success',
        () async {
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/airing_today?$apiKey')))
          .thenAnswer((_) async => http.Response(
                  readJson('dummy_data/tv_series/now_playing.json'), 200,
                  headers: {
                    HttpHeaders.contentTypeHeader:
                        'application/json; charset=utf-8',
                  }));
      final result2 = await remoteDataSource.getNowPlayingTvSeries();

      expect(result2, equals(tTvSeriesList));

      // arrange
      when(mockDatabaseHelper.insertWatchlist(testTvSeriesTable))
          .thenAnswer((_) async => 1);
      // act
      final result = await dataSource.insertWatchlist(testTvSeriesTable);
      // assert
      expect(result, 'Added to Watchlist');
    });

    test('should throw DatabaseException when insert to database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.insertWatchlist(testTvSeriesTable))
          .thenThrow(Exception());
      // act
      final call = dataSource.insertWatchlist(testTvSeriesTable);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('remove watchlist', () {
    test('should return success message when remove from database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.removeWatchlist(testTvSeriesTable))
          .thenAnswer((_) async => 1);
      // act
      final result = await dataSource.removeWatchlist(testTvSeriesTable);
      // assert
      expect(result, 'Removed from Watchlist');
    });

    test('should throw DatabaseException when remove from database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.removeWatchlist(testTvSeriesTable))
          .thenThrow(Exception());
      // act
      final call = dataSource.removeWatchlist(testTvSeriesTable);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('Get Tv Series Detail By Id', () {
    const tId = 1;

    test('should return Tv Series Detail Table when data is found', () async {
      // arrange
      when(mockDatabaseHelper.getTvSeriesById(tId))
          .thenAnswer((_) async => testTvSeriesMap);
      // act
      final result = await dataSource.getTvSeriesById(tId);
      // assert
      expect(result, testTvSeriesTable);
    });

    test('should return null when data is not found', () async {
      // arrange
      when(mockDatabaseHelper.getTvSeriesById(tId))
          .thenAnswer((_) async => null);
      // act
      final result = await dataSource.getTvSeriesById(tId);
      // assert
      expect(result, null);
    });
  });

  group('get watchlist tv-series', () {
    test('should return list of TvSeriesTable from database', () async {
      // arrange
      when(mockDatabaseHelper.getWatchlistTvSeries())
          .thenAnswer((_) async => [testTvSeriesMap]);
      // act
      final result = await dataSource.getWatchlistTvSeries();
      // assert
      expect(result, [testTvSeriesTable]);
    });
  });

  group('cache now playing tv series', () {
    test('should call database helper to save data', () async {
      // arrange
      when(mockDatabaseHelper.clearCache('now playing'))
          .thenAnswer((_) async => 1);
      // act
      await dataSource.cacheNowPlayingTvSeries([testTvSeriesCache]);
      // assert
      verify(mockDatabaseHelper.clearCache('now playing'));
      verify(mockDatabaseHelper
          .insertCacheTransaction([testTvSeriesCache], 'now playing'));
    });

    test('should return list of tv series from db when data exist', () async {
      // arrange
      when(mockDatabaseHelper.getCacheTvSeries('now playing'))
          .thenAnswer((_) async => [testTvSeriesCacheMap]);
      // act
      final result = await dataSource.getCachedNowPlayingTvSeriess();
      // assert
      expect(result, [testTvSeriesCache]);
    });

    test('should throw CacheException when cache data is not exist', () async {
      // arrange
      when(mockDatabaseHelper.getCacheTvSeries('now playing'))
          .thenAnswer((_) async => []);
      // act
      final call = dataSource.getCachedNowPlayingTvSeriess();
      // assert
      expect(() => call, throwsA(isA<CacheException>()));
    });
  });
}
