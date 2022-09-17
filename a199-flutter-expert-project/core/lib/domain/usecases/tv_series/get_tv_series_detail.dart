import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/tv_series/tv_series_detail.dart';
import 'package:core/domain/repositories/tv_series/tv_series_repository.dart';

class GetTvSeriesDetail {
  final TvSeriesRepository repository;

  GetTvSeriesDetail(this.repository);

  Future<Either<Failure, TvSeriesDetailEntities>> execute(int id) {
    return repository.getTvSerieDetail(id);
  }
}
