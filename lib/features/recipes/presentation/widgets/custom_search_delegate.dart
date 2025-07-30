import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/recipes/domain/entities/person_entities.dart';
import 'package:rick_and_morty/features/recipes/presentation/widgets/search_result.dart';

import '../manager/bloc/search_bloc/search_bloc.dart';
import '../manager/bloc/search_bloc/search_event.dart';
import '../manager/bloc/search_bloc/search_state.dart';

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate() : super(searchFieldLabel: 'Search for characters...');

  final _suggestions = ['Rick', 'Morty', 'Summer', 'Beth', 'Jerry'];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_outlined),
      tooltip: 'Back',
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    print('Inside custom search delegate and search query is $query');

    context.read<PersonSearchBloc>().add(SearchPersons(query));

    return BlocBuilder<PersonSearchBloc, PersonSearchState>(
      builder: (context, state) {
        if (state is PersonSearchLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is PersonSearchLoaded) {
          final person = state.persons;
          if (person.isEmpty) {
            return _showErrorText('No Characters with that name found');
          }
          return Container(
            child: ListView.builder(
              itemCount: person.isNotEmpty ? person.length : 0,
              itemBuilder: (context, int index) {
                PersonEntity result = person[index];
                return SearchResult(personResult: result);
              },
            ),
          );
        } else if (state is PersonSearchError) {
          return _showErrorText(state.message);
        } else {
          return Center(child: Icon(Icons.now_wallpaper));
        }
      },
    );
  }

  Widget _showErrorText(String errorMessage) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Text(
          errorMessage,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.length > 0) {
      return Container();
    }

    return ListView.separated(
      padding: EdgeInsets.all(10),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            // 1. Устанавливаем query при нажатии
            query = _suggestions[index];
            // 2. Закрываем suggestions
            showResults(context);
            // 3. Запускаем поиск
            BlocProvider.of<PersonSearchBloc>(
              context,
              listen: false,
            ).add(SearchPersons(query));
          },
          child: Text(
            _suggestions[index],
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemCount: _suggestions.length,
    );
  }
}
