import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/common/app_colors.dart';
import 'package:rick_and_morty/features/recipes/domain/entities/person_entities.dart';
import 'package:rick_and_morty/features/recipes/presentation/manager/bloc/favorite_person_list_bloc/favorite_person_list_bloc.dart';
import 'package:rick_and_morty/features/recipes/presentation/manager/bloc/favorite_person_list_bloc/favorite_person_list_event.dart';
import 'package:rick_and_morty/features/recipes/presentation/manager/bloc/favorite_person_list_bloc/favorite_person_list_state.dart';
import 'package:rick_and_morty/features/recipes/presentation/manager/bloc/person_list_cubit/person_list_cubit.dart';
import 'package:rick_and_morty/features/recipes/presentation/pages/person_detail_screen.dart';
import 'package:rick_and_morty/features/recipes/presentation/widgets/person_cache_image_widget.dart';

class FavoritePersonCardWidget extends StatelessWidget {
  final PersonEntity person;

  const FavoritePersonCardWidget({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritePersonListBloc, FavoritePersonListState>(
      builder: (context, state) {
        // Find the up-to-date person from the favorites list by ID or fallback to passed person
        final currentPerson =
            state is FavoritePersonListLoaded
                ? state.persons.firstWhere(
                  (p) => p.id == person.id,
                  orElse: () => person,
                )
                : person;

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PersonDetailPage(person: currentPerson),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: PersonCacheImage(imageUrl: currentPerson.image),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12),
                        Text(
                          currentPerson.name,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                color:
                                    currentPerson.status == 'Alive'
                                        ? Colors.green
                                        : Colors.red,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                '${currentPerson.status} - ${currentPerson.species}',
                                style: const TextStyle(color: Colors.white),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Text('Last known location:', style: TextStyle()),
                        const SizedBox(height: 4),
                        Text(
                          currentPerson.location?.name ?? "",
                          style: const TextStyle(color: Colors.white),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 12),
                        const Text('Origin:', style: TextStyle()),
                        const SizedBox(height: 4),
                        Text(
                          currentPerson.origin?.name ?? "",
                          style: const TextStyle(color: Colors.white),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    onPressed: () {
                      context.read<FavoritePersonListBloc>().add(
                        FavoritePersonDeleteEvent(id: currentPerson.id),
                      );
                      context.read<PersonListCubit>().toggleFavorite(
                        currentPerson,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '${currentPerson.name} removed from favorites',
                          ),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.favorite,
                      color:
                          currentPerson.isFavored
                              ? Colors.deepOrangeAccent
                              : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
