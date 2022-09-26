import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/tv_series/tv_series.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:search/domain/usecases/search_tv_series.dart';
import 'package:search/presentation/bloc/tv/search_bloc.dart';

import 'search_bloc_tv_test.mocks.dart';

@GenerateMocks([SearchTvSeries])
void main() {
  late SearchBlocTv searchBlocTv;
  late MockSearchTvSeries mockSearchTv;

  setUp(() {
    mockSearchTv = MockSearchTvSeries();
    searchBlocTv = SearchBlocTv(mockSearchTv);
  });

  group('Tv test', () {
    final tTvModel = TvSeries(
      backdropPath: '/pdfCr8W0wBCpdjbZXSxnKhZtosP.jpg',
      firstAirDate: "2022-09-01",
      genreIds: const [10765, 10759, 18],
      id: 84773,
      name: "The Lord of the Rings: The Rings of Power",
      originCountry: const ["US"],
      originalLanguage: "en",
      originalName: "The Lord of the Rings: The Rings of Power",
      overview:
          "Beginning in a time of relative peace, we follow an ensemble cast of characters as they confront the re-emergence of evil to Middle-earth. From the darkest depths of the Misty Mountains, to the majestic forests of Lindon, to the breathtaking island kingdom of Númenor, to the furthest reaches of the map, these kingdoms and characters will carve out legacies that live on long after they are gone.",
      popularity: 4981.572,
      posterPath: "/suyNxglk17Cpk8rCM2kZgqKdftk.jpg",
      voteAverage: 7.6,
      voteCount: 569,
    );

    final tTvList = <TvSeries>[tTvModel];
    const tQuery = 'The lord';

    test('initial state should be empty', () {
      expect(searchBlocTv.state, SearchEmpty());
    });

    blocTest(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockSearchTv.execute(tQuery))
            .thenAnswer((_) async => Right(tTvList));
        return searchBlocTv;
      },
      act: (bloc) => bloc.add(const OnQueryChanged(tQuery)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        SearchLoading(),
        SearchHasData(tTvList),
      ],
      verify: (bloc) => verify(mockSearchTv.execute(tQuery)),
    );

    blocTest(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockSearchTv.execute(tQuery)).thenAnswer((realInvocation) async =>
            const Left(ServerFailure('Server Failure')));
        return searchBlocTv;
      },
      act: (bloc) => bloc.add(const OnQueryChanged(tQuery)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        SearchLoading(),
        const SearchError('Server Failure'),
      ],
      verify: (bloc) => verify(mockSearchTv.execute(tQuery)),
    );
  });
}
