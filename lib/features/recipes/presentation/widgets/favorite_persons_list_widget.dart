import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/recipes/domain/entities/person_entities.dart';
import 'package:rick_and_morty/features/recipes/presentation/manager/bloc/favorite_person_list_bloc/favorite_person_list_bloc.dart';
import 'package:rick_and_morty/features/recipes/presentation/manager/bloc/favorite_person_list_bloc/favorite_person_list_event.dart';
import 'package:rick_and_morty/features/recipes/presentation/manager/bloc/favorite_person_list_bloc/favorite_person_list_state.dart';
import 'package:rick_and_morty/features/recipes/presentation/widgets/favorite_person_card_widget.dart';

class FavoritePersonsListWidget extends StatefulWidget {
  const FavoritePersonsListWidget({super.key});

  @override
  _FavoritePersonsListWidgetState createState() =>
      _FavoritePersonsListWidgetState();
}

class _FavoritePersonsListWidgetState extends State<FavoritePersonsListWidget> {
  @override
  void initState() {
    super.initState();
    // Dispatch event after widget is inserted into the widget tree
    context.read<FavoritePersonListBloc>().add(FetchFavoritePersonsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritePersonListBloc, FavoritePersonListState>(
      builder: (context, state) {
        if (state is FavoritePersonListError) {
          return Center(child: Text(state.message));
        } else if (state is FavoritePersonListLoaded) {
          final List<PersonEntity> persons = state.persons;

          if (persons.isEmpty) {
            return const Center(child: Text("No favorite persons found"));
          }

          return ListView.separated(
            itemCount: persons.length,
            separatorBuilder:
                (context, index) => Divider(color: Colors.grey[400]),
            itemBuilder: (context, index) {
              return FavoritePersonCardWidget(person: persons[index]);
            },
          );
        }
        // Show loading indicator for initial/loading states
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
