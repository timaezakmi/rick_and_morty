import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/error/failure.dart';
import 'package:rick_and_morty/features/recipes/data/models/person_model/person_model.dart';
import 'package:rick_and_morty/features/recipes/domain/entities/person_entities.dart';
import 'package:rick_and_morty/features/recipes/domain/use_cases/change_favorite.dart';
import 'package:rick_and_morty/features/recipes/domain/use_cases/get_all_persons.dart';
import 'package:rick_and_morty/features/recipes/presentation/manager/bloc/person_list_cubit/person_list_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

@injectable
class PersonListCubit extends Cubit<PersonState> {
  final GetAllPersons getAllPersons;
  final ChangeFavorite changeFavorite;

  PersonListCubit({required this.getAllPersons, required this.changeFavorite})
    : super(PersonEmpty());

  int page = 1;

  void loadPerson() async {
    if (state is PersonLoading) return;

    final currentState = state;

    var oldPerson = <PersonEntity>[];
    if (currentState is PersonLoaded) {
      oldPerson = currentState.personsList;
    }

    emit(PersonLoading(oldPerson, isFirstFetch: page == 1));

    final failureOrPerson = await getAllPersons(PagePersonParams(page: page));

    failureOrPerson.fold(
      (error) => emit(PersonError(message: _mapFailureToMessage(error))),
      (character) {
        page++;
        final persons = (state as PersonLoading).oldPersonsList;
        persons.addAll(character);
        print('List length: ${persons.length.toString()}');
        emit(PersonLoaded(persons));
      },
    );
  }

  Future<void> toggleFavorite(PersonEntity person) async {
    if (state is! PersonLoaded) return;

    final currentState = state as PersonLoaded;
    final updatedList = List<PersonEntity>.from(currentState.personsList);
    final index = updatedList.indexWhere((p) => p.id == person.id);

    if (index == -1) return;

    // Оптимистичное обновление
    final updatedPerson = (updatedList[index] as PersonModel).copyWith(
      isFavored: !person.isFavored,
    );
    updatedList[index] = updatedPerson;
    emit(PersonLoaded(List.from(updatedList)));

    final result = await changeFavorite(person);

    result.fold(
      (failure) {
        // Откат при ошибке
        updatedList[index] = person;
        emit(PersonLoaded(List.from(updatedList)));
        emit(PersonError(message: _mapFailureToMessage(failure)));
      },
      (successPerson) {
        // Подтверждение с сервера
        if (successPerson is PersonLoaded)
          updatedList[index] = successPerson as PersonEntity;
        emit(PersonLoaded(List.from(updatedList)));
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHED_FAILURE_MESSAGE;
      default:
        return 'Drift Error';
    }
  }
}
