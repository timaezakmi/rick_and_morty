import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/features/recipes/domain/entities/person_entities.dart';

abstract class FavoritePersonListState extends Equatable {
  const FavoritePersonListState();

  @override
  List<Object?> get props => [];
}

class FavoritePersonListLoaded extends FavoritePersonListState {
  final List<PersonEntity> persons;

  const FavoritePersonListLoaded({required this.persons});

  @override
  List<Object> get props => [persons];
}

class FavoritePersonListError extends FavoritePersonListState {
  final String message;

  const FavoritePersonListError(this.message);

  @override
  List<Object> get props => [message];
}
