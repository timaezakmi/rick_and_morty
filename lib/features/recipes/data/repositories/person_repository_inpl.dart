import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/error/exception.dart';
import 'package:rick_and_morty/core/error/failure.dart';
import 'package:rick_and_morty/core/platform/network_info.dart';
import 'package:rick_and_morty/features/recipes/data/data_sources/favorite_person_local_data_source.dart';
import 'package:rick_and_morty/features/recipes/data/data_sources/person_local_data_source.dart';

import 'package:rick_and_morty/features/recipes/data/data_sources/person_remote_data_source.dart';
import 'package:rick_and_morty/features/recipes/data/models/person_model/person_model.dart';
import 'package:rick_and_morty/features/recipes/domain/entities/person_entities.dart';
import 'package:rick_and_morty/features/recipes/domain/repositories/person_repository.dart';

@LazySingleton(as: PersonRepository)
class PersonRepositoryInpl implements PersonRepository {
  final PersonRemoteDataSource remoteDataSource;
  final PersonLocalDataSource localDataSource;
  final FavoritePersonLocalDataSource favoritePersonLocalDataSource;
  final NetworkInfo networkInfo;
  int maxCachedPage = 1;
  PersonRepositoryInpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
    required this.favoritePersonLocalDataSource,
  });
  @override
  Future<Either<Failure, List<PersonEntity>>> getAllPersons(int page) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePersons = await remoteDataSource.getAllPersons(page);
        final updatedPersons = await Future.wait(
          remotePersons.map((person) async {
            final isFavored = await favoritePersonLocalDataSource.isFavorite(
              person.id,
            );
            return person.copyWith(isFavored: isFavored);
          }),
        );
        localDataSource.personToCache(remotePersons);
        return Right(updatedPersons);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final locationPerson = await localDataSource.getLastPersonsFromCache();
        final updatedPersons = await Future.wait(
          locationPerson.map((person) async {
            final isFavored = await favoritePersonLocalDataSource.isFavorite(
              person.id,
            );
            return person.copyWith(isFavored: isFavored);
          }),
        );
        return Right(updatedPersons);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<PersonEntity>>> searchPerson(String query) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePerson = await remoteDataSource.searchPerson(query);
        localDataSource.personToCache(remotePerson);
        return Right(remotePerson);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final locationPerson = await localDataSource.getLastPersonsFromCache();
        return Right(locationPerson);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, PersonEntity>> changeFavorite(
    PersonEntity query,
  ) async {
    try {
      if (query.isFavored) {
        await favoritePersonLocalDataSource.removeFavorite(query.id);
      } else {
        await favoritePersonLocalDataSource.addFavorite(
          PersonModel.fromEntity(query).copyWith(isFavored: true),
        );
      }
      return Right(query);
    } catch (e) {
      // ignore: void_checks
      return Left(CacheFailure());
    }
  }

  @override
  @override
  Future<Either<Failure, List<PersonEntity>>> getAllFavoritePersons() async {
    try {
      final favoritePersonList =
          await favoritePersonLocalDataSource.getAllFavorites();
      // Convert PersonModel to PersonEntity explicitly (PersonModel already is PersonEntity but for clarity)
      final entities =
          favoritePersonList.map<PersonEntity>((person) => person).toList();
      return Right(entities);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
