import 'dart:convert';

import 'package:core/common/base_url.dart';
import 'package:core/core.dart';
import 'package:core/data/datasources/tv_series/tv_series_remote_data_source.dart';
import 'package:core/data/models/tv_series/tv_series_detail_model.dart';
import 'package:core/data/models/tv_series/tv_series_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../../helpers/tv_series/test_helper.mocks.dart';
import '../../../json_reader.dart';

void main() {
  late TvSeriesRemoteDataSourceImpl remoteDataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    remoteDataSource = TvSeriesRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('get Now Playing Tv Series', () {
    final tTvSeriesList = TvSeriesResponse.fromJson(
            json.decode(readJson('dummy_data/tv_series/now_playing.json')))
        .tvSeriesList;
    test('should return list of Tv Series Model when the response code is 200',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/airing_today?$apiKey')))
          .thenAnswer((_) async => http.Response(
              readJson('dummy_data/tv_series/now_playing.json'), 200));

      // act
      final result = await remoteDataSource.getNowPlayingTvSeries();

      // assert
      expect(result, equals(tTvSeriesList));
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/airing_today?$apiKey')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = remoteDataSource.getNowPlayingTvSeries();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get Popular TvSeries', () {
    final tTvSeriesList = TvSeriesResponse.fromJson(
            json.decode(readJson('dummy_data/tv_series/popular.json')))
        .tvSeriesList;

    test('should return list of tv series when response is success (200)',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/popular?$apiKey')))
          .thenAnswer((_) async => http.Response(
              readJson('dummy_data/tv_series/popular.json'), 200));
      // act
      final result = await remoteDataSource.getPopularTvSeries();
      // assert
      expect(result, tTvSeriesList);
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/popular?$apiKey')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = remoteDataSource.getPopularTvSeries();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get Top Rated Tv Series', () {
    final tTvSeriesList = TvSeriesResponse.fromJson(
            json.decode(readJson('dummy_data/tv_series/top_rated.json')))
        .tvSeriesList;

    test('should return list of tv series when response code is 200 ',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/top_rated?$apiKey')))
          .thenAnswer((_) async => http.Response(
              readJson('dummy_data/tv_series/top_rated.json'), 200));
      // act
      final result = await remoteDataSource.getTopRatedTvSeries();
      // assert
      expect(result, tTvSeriesList);
    });

    test('should throw ServerException when response code is other than 200',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/top_rated?$apiKey')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = remoteDataSource.getTopRatedTvSeries();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get tv series detail', () {
    const tId = 84773;
    final tTvSeriesDetail = TvSeriesDetail.fromJson(
        json.decode(readJson('dummy_data/tv_series/tv_series_detail.json')));

    test('should return tv series detail when the response code is 200',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/$tId?$apiKey')))
          .thenAnswer((_) async => http.Response(
              readJson('dummy_data/tv_series/tv_series_detail.json'), 200));
      // act
      final result = await remoteDataSource.getTvSeriesDetail(tId);
      // assert
      expect(result, equals(tTvSeriesDetail));
    });

    test('should throw Server Exception when the response code is 404 or other',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/$tId?$apiKey')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = remoteDataSource.getTvSeriesDetail(tId);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get tv series recommendations', () {
    final tTvSeriesList = TvSeriesResponse.fromJson(json.decode(
            readJson('dummy_data/tv_series/tv_series_recommendations.json')))
        .tvSeriesList;
    const tId = 1;

    test('should return list of Tv Series Model when the response code is 200',
        () async {
      // arrange
      when(mockHttpClient
              .get(Uri.parse('$baseUrl/tv/$tId/recommendations?$apiKey')))
          .thenAnswer((_) async => http.Response(
              readJson('dummy_data/tv_series/tv_series_recommendations.json'),
              200));
      // act
      final result = await remoteDataSource.getTvSeriesRecommendations(tId);
      // assert
      expect(result, equals(tTvSeriesList));
    });

    test('should throw Server Exception when the response code is 404 or other',
        () async {
      // arrange
      when(mockHttpClient
              .get(Uri.parse('$baseUrl/tv/$tId/recommendations?$apiKey')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = remoteDataSource.getTvSeriesRecommendations(tId);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('search tv series', () {
    final tSearchResult = TvSeriesResponse.fromJson(json.decode(
            readJson('dummy_data/tv_series/search_thelordring_tv_series.json')))
        .tvSeriesList;
    const tQuery = 'The lord';

    test('should return list of tv series when response code is 200', () async {
      // arrange
      when(mockHttpClient
              .get(Uri.parse('$baseUrl/search/tv?$apiKey&query=$tQuery')))
          .thenAnswer((_) async => http.Response(
              readJson(
                  'dummy_data/tv_series/search_thelordring_tv_series.json'),
              200));
      // act
      final result = await remoteDataSource.searchTvSeries(tQuery);
      // assert
      expect(result, tSearchResult);
    });

    test('should throw ServerException when response code is other than 200',
        () async {
      // arrange
      when(mockHttpClient
              .get(Uri.parse('$baseUrl/search/tv?$apiKey&query=$tQuery')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = remoteDataSource.searchTvSeries(tQuery);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
}
