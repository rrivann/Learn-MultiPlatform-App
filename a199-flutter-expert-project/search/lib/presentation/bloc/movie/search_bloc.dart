import 'package:core/domain/entities/movie/movie.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:search/domain/usecases/search_movies.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBlocMovie extends Bloc<SearchEvent, SearchState> {
  final SearchMovies _searchMovies;

  SearchBlocMovie(this._searchMovies) : super(SearchEmpty()) {
    on<OnQueryChanged>(
      (event, emit) async {
        final query = event.query;

        emit(SearchLoading());

        final result = await _searchMovies.execute(query);

        result.fold((l) => {emit(SearchError(l.message))},
            (r) => {emit(SearchHasData(r))});
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }
}

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
