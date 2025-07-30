import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/error/failure.dart';
import 'package:rick_and_morty/core/use_cases/use_cases.dart';
import 'package:rick_and_morty/features/recipes/domain/entities/person_entities.dart';
import 'package:rick_and_morty/features/recipes/domain/repositories/person_repository.dart';

@lazySingleton
class GetAllPersons extends UseCases<List<PersonEntity>, PagePersonParams> {
  final PersonRepository personRepository;
  GetAllPersons(this.personRepository);
  @override
  Future<Either<Failure, List<PersonEntity>>> call(
    PagePersonParams page,
  ) async {
    return await personRepository.getAllPersons(page.page);
  }
}

class PagePersonParams extends Equatable {
  final int page;
  const PagePersonParams({required this.page});
  @override
  // TODO: implement props
  List<Object?> get props => [page];
}
