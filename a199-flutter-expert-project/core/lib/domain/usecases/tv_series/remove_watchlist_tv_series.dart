import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/tv_series/tv_series_detail.dart';
import 'package:core/domain/repositories/tv_series/tv_series_repository.dart';

class RemoveWatchlistTvSeries {
  final TvSeriesRepository repository;

  RemoveWatchlistTvSeries(this.repository);

  Future<Either<Failure, String>> execute(TvSeriesDetailEntities tvSerie) {
    return repository.removeWatchlistTvSeries(tvSerie);
  }
}
