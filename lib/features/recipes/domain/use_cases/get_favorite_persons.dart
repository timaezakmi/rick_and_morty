import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:rick_and_morty/core/error/failure.dart';
import 'package:rick_and_morty/core/use_cases/use_cases.dart';

import 'package:rick_and_morty/features/recipes/domain/entities/person_entities.dart';
import 'package:rick_and_morty/features/recipes/domain/repositories/person_repository.dart';

@lazySingleton
class GetFavoritePersons extends UseCases<List<PersonEntity>, void> {
  final PersonRepository personRepository;

  GetFavoritePersons(this.personRepository);

  @override
  Future<Either<Failure, List<PersonEntity>>> call(void _) async {
    return await personRepository.getAllFavoritePersons();
  }
}
