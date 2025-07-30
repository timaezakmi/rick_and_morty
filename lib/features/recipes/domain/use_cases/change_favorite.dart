import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/error/failure.dart';
import 'package:rick_and_morty/core/use_cases/use_cases.dart';

import 'package:rick_and_morty/features/recipes/domain/entities/person_entities.dart';
import 'package:rick_and_morty/features/recipes/domain/repositories/person_repository.dart';

@lazySingleton
class ChangeFavorite extends UseCases<Failure, PersonEntity> {
  final PersonRepository personRepository;

  ChangeFavorite(this.personRepository);

  @override
  Future<Either<Failure, Failure>> call(PersonEntity params) async {
    return personRepository
        .changeFavorite(params)
        .then(
          (either) => either.fold(
            (failure) => Left(failure), // Propagate failure as-is
            (personEntity) => Right(
              GenericFailure(message: 'Successfully Changed Favorite'),
            ), // Wrap PersonEntity in a GenericFailure. VERY WRONG.
          ),
        );
  }
}

class GenericFailure extends Failure {
  final String message;

  GenericFailure({required this.message});
}
