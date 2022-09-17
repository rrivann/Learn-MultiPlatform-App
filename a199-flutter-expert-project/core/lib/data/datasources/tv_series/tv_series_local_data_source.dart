import 'package:core/core.dart';
import 'package:core/data/datasources/db/tv_database_helper.dart';
import 'package:core/data/models/tv_series/tv_series_table.dart';

abstract class TvSeriesLocalDataSource {
  Future<String> insertWatchlist(TvSeriesTable tvSerie);
  Future<String> removeWatchlist(TvSeriesTable tvSerie);
  Future<TvSeriesTable?> getTvSeriesById(int id);
  Future<List<TvSeriesTable>> getWatchlistTvSeries();
  Future<void> cacheNowPlayingTvSeries(List<TvSeriesTable> tvSeries);
  Future<List<TvSeriesTable>> getCachedNowPlayingTvSeriess();
}

class TvSeriesLocalDataSourceImpl implements TvSeriesLocalDataSource {
  final TvSeriesDatabaseHelper databaseHelper;

  TvSeriesLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<String> insertWatchlist(TvSeriesTable tvSerie) async {
    try {
      await databaseHelper.insertWatchlist(tvSerie);
      return 'Added to Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeWatchlist(TvSeriesTable tvSeries) async {
    try {
      await databaseHelper.removeWatchlist(tvSeries);
      return 'Removed from Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<TvSeriesTable?> getTvSeriesById(int id) async {
    final result = await databaseHelper.getTvSeriesById(id);
    if (result != null) {
      return TvSeriesTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<TvSeriesTable>> getWatchlistTvSeries() async {
    final result = await databaseHelper.getWatchlistTvSeries();
    return result.map((data) => TvSeriesTable.fromMap(data)).toList();
  }

  @override
  Future<void> cacheNowPlayingTvSeries(List<TvSeriesTable> tvSeries) async {
    await databaseHelper.clearCache('now playing');
    await databaseHelper.insertCacheTransaction(tvSeries, 'now playing');
  }

  @override
  Future<List<TvSeriesTable>> getCachedNowPlayingTvSeriess() async {
    final result = await databaseHelper.getCacheTvSeries('now playing');
    if (result.isNotEmpty) {
      return result.map((data) => TvSeriesTable.fromMap(data)).toList();
    } else {
      throw CacheException("Can't get the data :(");
    }
  }
}
