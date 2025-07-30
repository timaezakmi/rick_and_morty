import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/features/recipes/domain/entities/person_entities.dart';

abstract class FavoritePersonListEvent extends Equatable {
  const FavoritePersonListEvent();

  @override
  List<Object> get props => [];
}

class FetchFavoritePersonsEvent extends FavoritePersonListEvent {}

class FavoritePersonDeleteEvent extends FavoritePersonListEvent {
  final int id;

  FavoritePersonDeleteEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class SortFavoritePersonsEvent extends FavoritePersonListEvent {}
