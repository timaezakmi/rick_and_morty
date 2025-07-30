import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/common/app_colors.dart';
import 'package:rick_and_morty/features/recipes/presentation/manager/bloc/favorite_person_list_bloc/favorite_person_list_bloc.dart';
import 'package:rick_and_morty/features/recipes/presentation/manager/bloc/search_bloc/search_bloc.dart';
import 'package:rick_and_morty/features/recipes/presentation/manager/bloc/person_list_cubit/person_list_cubit.dart';
import 'package:rick_and_morty/features/recipes/presentation/manager/provider/bottom_nav_bar_provider.dart';
import 'package:rick_and_morty/features/recipes/presentation/manager/provider/theme_provider.dart';
import 'package:rick_and_morty/features/recipes/presentation/pages/person_screen.dart';
import 'package:rick_and_morty/injactable/injactable.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PersonListCubit>(
          create: (context) => getIt<PersonListCubit>()..loadPerson(),
        ),
        BlocProvider<PersonSearchBloc>(
          create: (context) => getIt<PersonSearchBloc>(),
        ),
        BlocProvider<FavoritePersonListBloc>(
          create: (context) => getIt<FavoritePersonListBloc>(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<BottomNavBarProvider>(),
        ),
        ChangeNotifierProvider(create: (context) => getIt<ThemeProvider>()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            theme: themeProvider.currentTheme,
            home: HomePage(),
          );
        },
      ),
    );
  }
}
