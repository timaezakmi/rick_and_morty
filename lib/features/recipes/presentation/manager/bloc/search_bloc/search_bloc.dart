import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/error/failure.dart';
import 'package:rick_and_morty/features/recipes/domain/use_cases/search_person.dart';
import 'package:rick_and_morty/features/recipes/presentation/manager/bloc/search_bloc/search_event.dart';
import 'package:rick_and_morty/features/recipes/presentation/manager/bloc/search_bloc/search_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

@injectable
class PersonSearchBloc extends Bloc<PersonSearchEvent, PersonSearchState> {
  final SearchPerson searchPerson;

  PersonSearchBloc({required this.searchPerson}) : super(PersonSearchEmpty()) {
    // Регистрируем обработчик для SearchPersons

    on<SearchPersons>(_onSearchPersons);
  }

  Future<void> _onSearchPersons(
    SearchPersons event,
    Emitter<PersonSearchState> emit,
  ) async {
    emit(PersonSearchLoading());

    final failureOrPerson = await searchPerson(
      SearchPersonParams(query: event.personQuery),
    );

    emit(
      failureOrPerson.fold(
        (failure) => PersonSearchError(message: _mapFailureToMessage(failure)),
        (person) => PersonSearchLoaded(persons: person),
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure _:
        return CACHED_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
