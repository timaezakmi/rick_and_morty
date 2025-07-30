import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/recipes/presentation/widgets/custom_search_delegate.dart';

import '../../domain/entities/person_entities.dart';
import '../manager/bloc/person_list_cubit/person_list_cubit.dart';
import '../manager/bloc/person_list_cubit/person_list_state.dart';
import 'person_card_widget.dart';

class PersonsListWidget extends StatelessWidget {
  final scrollController = ScrollController();
  int page = -1;

  PersonsListWidget({super.key});
  void setupScrollController(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          context.read<PersonListCubit>().loadPerson();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);

    return BlocBuilder<PersonListCubit, PersonState>(
      builder: (context, state) {
        List<PersonEntity> persons = [];
        bool isLoading = false;

        if (state is PersonLoading && state.isFirstFetch) {
          return _loadingIndicator();
        } else if (state is PersonLoading) {
          persons = state.oldPersonsList;
          isLoading = true;
        } else if (state is PersonLoaded) {
          persons = state.personsList;
        } else if (state is PersonError) {
          return Center(
            child: Text(
              state.message,
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          );
        }
        return ListView.separated(
          controller: scrollController,
          itemBuilder: (context, index) {
            if (index < persons.length) {
              return PersonCardWidget(person: persons[index]);
            } else {
              Timer(Duration(milliseconds: 30), () {
                scrollController.jumpTo(
                  scrollController.position.maxScrollExtent,
                );
              });
              return _loadingIndicator();
            }
          },
          separatorBuilder: (context, index) {
            return Divider(color: Colors.grey[400]);
          },
          itemCount: persons.length + (isLoading ? 1 : 0),
        );
      },
    );
  }

  Widget _loadingIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
