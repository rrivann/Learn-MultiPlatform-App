import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:core/common/network_info.dart';
import 'package:core/data/datasources/db/database_helper.dart';
import 'package:core/data/datasources/db/tv_database_helper.dart';
import 'package:core/data/datasources/movie/movie_local_data_source.dart';
import 'package:core/data/datasources/movie/movie_remote_data_source.dart';
import 'package:core/data/datasources/tv_series/tv_series_local_data_source.dart';
import 'package:core/data/datasources/tv_series/tv_series_remote_data_source.dart';
import 'package:core/data/repositories/movie/movie_repository_impl.dart';
import 'package:core/data/repositories/tv_series/tv_series_repository_impl.dart';
import 'package:core/domain/repositories/movie/movie_repository.dart';
import 'package:core/domain/repositories/tv_series/tv_series_repository.dart';
import 'package:core/domain/usecases/movie/get_movie_detail.dart';
import 'package:core/domain/usecases/movie/get_movie_recommendations.dart';
import 'package:core/domain/usecases/movie/get_now_playing_movies.dart';
import 'package:core/domain/usecases/movie/get_popular_movies.dart';
import 'package:core/domain/usecases/movie/get_top_rated_movies.dart';
import 'package:core/domain/usecases/movie/get_watchlist_movies.dart';
import 'package:core/domain/usecases/movie/get_watchlist_status.dart';
import 'package:core/domain/usecases/movie/remove_watchlist.dart';
import 'package:core/domain/usecases/movie/save_watchlist.dart';
import 'package:core/domain/usecases/movie/search_movies.dart';
import 'package:core/domain/usecases/tv_series/get_now_playing_tv_series.dart';
import 'package:core/domain/usecases/tv_series/get_popular_tv_series.dart';
import 'package:core/domain/usecases/tv_series/get_top_rated_tv_series.dart';
import 'package:core/domain/usecases/tv_series/get_tv_series_detail.dart';
import 'package:core/domain/usecases/tv_series/get_tv_series_recommendations.dart';
import 'package:core/domain/usecases/tv_series/get_watchlist_status_tv_series.dart';
import 'package:core/domain/usecases/tv_series/get_watchlist_tv_series.dart';
import 'package:core/domain/usecases/tv_series/remove_watchlist_tv_series.dart';
import 'package:core/domain/usecases/tv_series/save_watchlist_tv_series.dart';
import 'package:core/domain/usecases/tv_series/search_tv_series.dart';
import 'package:core/presentation/provider/movie/movie_detail_notifier.dart';
import 'package:core/presentation/provider/movie/movie_list_notifier.dart';
import 'package:core/presentation/provider/movie/movie_search_notifier.dart';
import 'package:core/presentation/provider/movie/popular_movies_notifier.dart';
import 'package:core/presentation/provider/movie/top_rated_movies_notifier.dart';
import 'package:core/presentation/provider/movie/watchlist_movie_notifier.dart';
import 'package:core/presentation/provider/tv_series/popular_tv_series_notifier.dart';
import 'package:core/presentation/provider/tv_series/top_rated_tv_series_notifier.dart';
import 'package:core/presentation/provider/tv_series/tv_series_detail_notifier.dart';
import 'package:core/presentation/provider/tv_series/tv_series_list_notifier.dart';
import 'package:core/presentation/provider/tv_series/tv_series_search_notifier.dart';
import 'package:core/presentation/provider/tv_series/watchlist_tv_series_notifier.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  // provider
  locator.registerFactory(
    () => MovieListNotifier(
      getNowPlayingMovies: locator(),
      getPopularMovies: locator(),
      getTopRatedMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieDetailNotifier(
      getMovieDetail: locator(),
      getMovieRecommendations: locator(),
      getWatchListStatus: locator(),
      saveWatchlist: locator(),
      removeWatchlist: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieSearchNotifier(
      searchMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => PopularMoviesNotifier(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedMoviesNotifier(
      getTopRatedMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistMovieNotifier(
      getWatchlistMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => TvSeriesListNotifier(
      getNowPlayingTvSeries: locator(),
      getPopularTvSeries: locator(),
      getTopRatedTvSeries: locator(),
    ),
  );

  locator.registerFactory(
    () => TvSeriesDetailNotifier(
      getTvSeriesDetail: locator(),
      getTvSeriesRecommendations: locator(),
      getWatchListStatusTvSeries: locator(),
      removeWatchlistTvSeries: locator(),
      saveWatchlistTvSeries: locator(),
    ),
  );

  locator.registerFactory(
    () => TvSeriesSearchNotifier(
      searchTvSeries: locator(),
    ),
  );

  locator.registerFactory(
    () => WatchlistTvSeriesNotifier(
      getWatchlistTvSeries: locator(),
    ),
  );

  locator.registerFactory(() => PopularTvSeriesNotifier(locator()));

  locator.registerFactory(
      () => TopRatedTvSeriesNotifier(getTopRatedTvSeries: locator()));

  // use case
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));

  locator.registerLazySingleton(() => GetNowPlayingTvSeries(locator()));
  locator.registerLazySingleton(() => GetPopularTvSeries(locator()));
  locator.registerLazySingleton(() => GetTopRatedTvSeries(locator()));
  locator.registerLazySingleton(() => GetTvSeriesDetail(locator()));
  locator.registerLazySingleton(() => GetTvSeriesRecommendations(locator()));
  locator.registerLazySingleton(() => SearchTvSeries(locator()));
  locator.registerLazySingleton(() => GetWatchListStatusTvSeries(locator()));
  locator.registerLazySingleton(() => SaveWatchlistTvSeries(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistTvSeries(locator()));
  locator.registerLazySingleton(() => GetWatchlistTvSeries(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
      networkInfo: locator(),
    ),
  );
  locator.registerLazySingleton<TvSeriesRepository>(
    () => TvSeriesRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
      networkInfo: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));

  locator.registerLazySingleton<TvSeriesRemoteDataSource>(
      () => TvSeriesRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TvSeriesLocalDataSource>(
      () => TvSeriesLocalDataSourceImpl(databaseHelper: locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
  locator.registerLazySingleton<TvSeriesDatabaseHelper>(
      () => TvSeriesDatabaseHelper());

  // network info
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));

  // external
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => DataConnectionChecker());
}
