import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/error/exception.dart';
import 'package:rick_and_morty/core/network/dio_client.dart';
import 'package:rick_and_morty/features/recipes/data/models/person_model/person_model.dart';

abstract class PersonRemoteDataSource {
  Future<List<PersonModel>> getAllPersons(int page);
  Future<List<PersonModel>> searchPerson(String query);
}

@LazySingleton(as: PersonRemoteDataSource)
class PersonRemoteDataSourceImpl implements PersonRemoteDataSource {
  final DioClient client;
  PersonRemoteDataSourceImpl({required this.client});
  @override
  Future<List<PersonModel>> getAllPersons(int page) async {
    final response = await client.dio.get('/character/?page=$page');
    if (response.statusCode == 200) {
      final results = response.data['results'] as List;
      return results
          .map((person) => PersonModel.fromJson(person as Map<String, dynamic>))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<PersonModel>> searchPerson(String query) async {
    final response = await client.dio.get('/character/?name=$query');
    if (response.statusCode == 200) {
      final results = response.data['results'] as List;
      return results
          .map((person) => PersonModel.fromJson(person as Map<String, dynamic>))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
