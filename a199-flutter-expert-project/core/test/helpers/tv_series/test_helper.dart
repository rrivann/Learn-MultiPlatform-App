import 'package:core/common/network_info.dart';
import 'package:core/data/datasources/db/tv_database_helper.dart';
import 'package:core/data/datasources/tv_series/tv_series_local_data_source.dart';
import 'package:core/data/datasources/tv_series/tv_series_remote_data_source.dart';
import 'package:core/domain/repositories/tv_series/tv_series_repository.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks([
  TvSeriesRepository,
  TvSeriesRemoteDataSource,
  TvSeriesLocalDataSource,
  TvSeriesDatabaseHelper,
  NetworkInfo,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
