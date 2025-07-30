import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/error/failure.dart';
import 'package:rick_and_morty/core/use_cases/use_cases.dart';
import 'package:rick_and_morty/features/recipes/domain/entities/person_entities.dart';
import 'package:rick_and_morty/features/recipes/domain/repositories/person_repository.dart';

@lazySingleton
class SearchPerson extends UseCases<List<PersonEntity>, SearchPersonParams> {
  PersonRepository personRepository;
  SearchPerson(this.personRepository);
  @override
  Future<Either<Failure, List<PersonEntity>>> call(
    SearchPersonParams params,
  ) async {
    return await personRepository.searchPerson(params.query);
  }
}

// ignore: must_be_immutable
class SearchPersonParams extends Equatable {
  String query;
  SearchPersonParams({required this.query});

  @override
  // TODO: implement props
  List<Object?> get props => [query];
}
