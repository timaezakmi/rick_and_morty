import 'package:dartz/dartz.dart';

import 'package:rick_and_morty/features/recipes/domain/entities/person_entities.dart';

import '../../../../core/error/failure.dart';

abstract class PersonRepository {
  Future<Either<Failure, List<PersonEntity>>> getAllPersons(int index);
  Future<Either<Failure, List<PersonEntity>>> searchPerson(String query);
  Future<Either<Failure, PersonEntity>> changeFavorite(PersonEntity query);
  Future<Either<Failure, List<PersonEntity>>> getAllFavoritePersons();
}
