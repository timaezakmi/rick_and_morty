import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/features/recipes/presentation/manager/bloc/favorite_person_list_bloc/favorite_person_list_bloc.dart';
import 'package:rick_and_morty/features/recipes/presentation/manager/bloc/favorite_person_list_bloc/favorite_person_list_event.dart';
import 'package:rick_and_morty/features/recipes/presentation/manager/provider/bottom_nav_bar_provider.dart';
import 'package:rick_and_morty/features/recipes/presentation/manager/provider/theme_provider.dart';
import 'package:rick_and_morty/features/recipes/presentation/widgets/custom_search_delegate.dart';
import 'package:rick_and_morty/features/recipes/presentation/widgets/favorite_persons_list_widget.dart';
import 'package:rick_and_morty/features/recipes/presentation/widgets/persons_list_widget.dart';
import 'package:rick_and_morty/injactable/injactable.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenindexprovider = getIt<BottomNavBarProvider>();

    return ValueListenableBuilder<int>(
      valueListenable: _screenindexprovider,
      builder: (context, screenIndex, child) {
        return Scaffold(
          appBar: _bodyAppBar(screenIndex, context),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
            ],
            currentIndex: screenIndex,
            onTap: (value) => _screenindexprovider.updateScreenIndex(value),
          ),
          body: _bodyBottomNavigationBar(screenIndex),
        );
      },
    );
  }
}

_bodyBottomNavigationBar(int index) {
  switch (index) {
    case 0:
      return PersonsListWidget();
    default:
      return FavoritePersonsListWidget();
  }
}

_bodyAppBar(int index, BuildContext context) {
  final themeProvider = Provider.of<ThemeProvider>(context);
  switch (index) {
    case 0:
      return AppBar(
        leading: IconButton(
          onPressed: () {
            themeProvider.toggleTheme();
          },
          icon:
              themeProvider.isDark
                  ? Icon(Icons.dark_mode)
                  : Icon(Icons.light_mode),
        ),
        title: Text('Characters'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),

            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          ),
        ],
      );
    default:
      return AppBar(
        leading: IconButton(
          onPressed: () {
            themeProvider.toggleTheme();
          },
          icon:
              themeProvider.isDark
                  ? Icon(Icons.dark_mode)
                  : Icon(Icons.light_mode),
        ),
        title: Text('Favorite Persons'),
        actions: [
          IconButton(
            icon: Icon(Icons.sort_by_alpha),
            onPressed: () {
              context.read<FavoritePersonListBloc>().add(
                SortFavoritePersonsEvent(),
              );
            },
          ),
        ],
      );
  }
}
