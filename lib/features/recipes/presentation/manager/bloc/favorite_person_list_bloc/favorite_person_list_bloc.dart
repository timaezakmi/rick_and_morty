import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:rick_and_morty/core/error/failure.dart';
import 'package:rick_and_morty/features/recipes/domain/entities/person_entities.dart';
import 'package:rick_and_morty/features/recipes/domain/use_cases/get_favorite_persons.dart';

import 'favorite_person_list_event.dart';
import 'favorite_person_list_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHE_FAILURE_MESSAGE = 'Cache Failure';

@injectable
class FavoritePersonListBloc
    extends Bloc<FavoritePersonListEvent, FavoritePersonListState> {
  final GetFavoritePersons getFavoritePersons;
  List<PersonEntity> _originalPersons = []; // Store the original list
  bool _isSorted = false; // Track sorting state

  FavoritePersonListBloc({required this.getFavoritePersons})
    : super(FavoritePersonListLoaded(persons: [])) {
    on<FetchFavoritePersonsEvent>(_onFetchFavoritePersons);
    on<FavoritePersonDeleteEvent>(_onDeleteFavoritePerson);
    on<SortFavoritePersonsEvent>(_onSortFavoritePersons);
  }

  Future<void> _onSortFavoritePersons(
    SortFavoritePersonsEvent event,
    Emitter<FavoritePersonListState> emit,
  ) async {
    final currentState = state;
    if (currentState is! FavoritePersonListLoaded) return;

    List<PersonEntity> persons = List.from(
      currentState.persons,
    ); // Create a copy

    if (_isSorted) {
      // If already sorted, revert to original
      emit(
        FavoritePersonListLoaded(persons: List.from(_originalPersons)),
      ); // Emit copy
      _isSorted = false;
    } else {
      // Sort the copy
      persons.sort((a, b) => a.name.compareTo(b.name));
      emit(FavoritePersonListLoaded(persons: persons));
      _isSorted = true;
    }
  }

  Future<void> _onFetchFavoritePersons(
    FetchFavoritePersonsEvent event,
    Emitter<FavoritePersonListState> emit,
  ) async {
    final failureOrPersons = await getFavoritePersons.call(null);

    failureOrPersons.fold(
      (failure) => emit(FavoritePersonListError(_mapFailureToMessage(failure))),
      (persons) {
        _originalPersons = List.from(persons); // Store original list on fetch
        emit(FavoritePersonListLoaded(persons: persons));
        _isSorted = false; // Reset sorting state on fetch
      },
    );
  }

  Future<void> _onDeleteFavoritePerson(
    FavoritePersonDeleteEvent event,
    Emitter<FavoritePersonListState> emit,
  ) async {
    final currentState = state;
    if (currentState is! FavoritePersonListLoaded) return;

    // Optimistic update: remove immediately
    final updatedPersons =
        currentState.persons.where((p) => p.id != event.id).toList();

    // Update original list too (important for toggling sort)
    _originalPersons = _originalPersons.where((p) => p.id != event.id).toList();

    emit(FavoritePersonListLoaded(persons: updatedPersons));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
