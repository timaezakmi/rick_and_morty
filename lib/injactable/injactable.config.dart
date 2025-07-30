// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:rick_and_morty/core/network/dio_client.dart' as _i850;
import 'package:rick_and_morty/core/platform/network_info.dart' as _i872;
import 'package:rick_and_morty/drift/app_database.dart' as _i1056;
import 'package:rick_and_morty/features/recipes/data/data_sources/favorite_person_local_data_source.dart'
    as _i891;
import 'package:rick_and_morty/features/recipes/data/data_sources/person_local_data_source.dart'
    as _i928;
import 'package:rick_and_morty/features/recipes/data/data_sources/person_remote_data_source.dart'
    as _i183;
import 'package:rick_and_morty/features/recipes/data/repositories/person_repository_inpl.dart'
    as _i618;
import 'package:rick_and_morty/features/recipes/data/shared_prefs_module.dart'
    as _i406;
import 'package:rick_and_morty/features/recipes/domain/repositories/person_repository.dart'
    as _i237;
import 'package:rick_and_morty/features/recipes/domain/use_cases/change_favorite.dart'
    as _i468;
import 'package:rick_and_morty/features/recipes/domain/use_cases/get_all_persons.dart'
    as _i86;
import 'package:rick_and_morty/features/recipes/domain/use_cases/get_favorite_persons.dart'
    as _i811;
import 'package:rick_and_morty/features/recipes/domain/use_cases/search_person.dart'
    as _i220;
import 'package:rick_and_morty/features/recipes/presentation/manager/bloc/favorite_person_list_bloc/favorite_person_list_bloc.dart'
    as _i794;
import 'package:rick_and_morty/features/recipes/presentation/manager/bloc/person_list_cubit/person_list_cubit.dart'
    as _i730;
import 'package:rick_and_morty/features/recipes/presentation/manager/bloc/search_bloc/search_bloc.dart'
    as _i372;
import 'package:rick_and_morty/features/recipes/presentation/manager/provider/bottom_nav_bar_provider.dart'
    as _i222;
import 'package:rick_and_morty/features/recipes/presentation/manager/provider/theme_provider.dart'
    as _i540;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sharedPrefsModule = _$SharedPrefsModule();
    final externalModule = _$ExternalModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPrefsModule.sharedPreferences,
      preResolve: true,
    );
    gh.singleton<_i1056.AppDatabase>(() => _i1056.AppDatabase());
    gh.singleton<_i222.BottomNavBarProvider>(
      () => _i222.BottomNavBarProvider(),
    );
    gh.singleton<_i540.ThemeProvider>(() => _i540.ThemeProvider());
    gh.lazySingleton<_i973.InternetConnectionChecker>(
      () => externalModule.connectionChecker,
    );
    gh.lazySingleton<_i850.DioClient>(() => _i850.DioClient());
    gh.lazySingleton<_i891.FavoritePersonLocalDataSource>(
      () => _i891.FavoritePersonLocalDataSource(gh<_i1056.AppDatabase>()),
    );
    gh.lazySingleton<_i183.PersonRemoteDataSource>(
      () => _i183.PersonRemoteDataSourceImpl(client: gh<_i850.DioClient>()),
    );
    gh.lazySingleton<_i872.NetworkInfo>(
      () => _i872.NetworkInfoImpl(gh<_i973.InternetConnectionChecker>()),
    );
    gh.lazySingleton<_i928.PersonLocalDataSource>(
      () => _i928.PersonLocalDataSourceImpl(
        sharedPreferences: gh<_i460.SharedPreferences>(),
      ),
    );
    gh.lazySingleton<_i237.PersonRepository>(
      () => _i618.PersonRepositoryInpl(
        remoteDataSource: gh<_i183.PersonRemoteDataSource>(),
        localDataSource: gh<_i928.PersonLocalDataSource>(),
        networkInfo: gh<_i872.NetworkInfo>(),
        favoritePersonLocalDataSource:
            gh<_i891.FavoritePersonLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i220.SearchPerson>(
      () => _i220.SearchPerson(gh<_i237.PersonRepository>()),
    );
    gh.lazySingleton<_i86.GetAllPersons>(
      () => _i86.GetAllPersons(gh<_i237.PersonRepository>()),
    );
    gh.lazySingleton<_i468.ChangeFavorite>(
      () => _i468.ChangeFavorite(gh<_i237.PersonRepository>()),
    );
    gh.lazySingleton<_i811.GetFavoritePersons>(
      () => _i811.GetFavoritePersons(gh<_i237.PersonRepository>()),
    );
    gh.factory<_i372.PersonSearchBloc>(
      () => _i372.PersonSearchBloc(searchPerson: gh<_i220.SearchPerson>()),
    );
    gh.factory<_i794.FavoritePersonListBloc>(
      () => _i794.FavoritePersonListBloc(
        getFavoritePersons: gh<_i811.GetFavoritePersons>(),
      ),
    );
    gh.factory<_i730.PersonListCubit>(
      () => _i730.PersonListCubit(
        getAllPersons: gh<_i86.GetAllPersons>(),
        changeFavorite: gh<_i468.ChangeFavorite>(),
      ),
    );
    return this;
  }
}

class _$SharedPrefsModule extends _i406.SharedPrefsModule {}

class _$ExternalModule extends _i872.ExternalModule {}
