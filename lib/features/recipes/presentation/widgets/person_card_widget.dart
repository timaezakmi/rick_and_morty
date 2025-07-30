import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/common/app_colors.dart';
import 'package:rick_and_morty/features/recipes/presentation/manager/bloc/person_list_cubit/person_list_cubit.dart';

import 'package:rick_and_morty/features/recipes/presentation/pages/person_detail_screen.dart';
import 'package:rick_and_morty/features/recipes/presentation/widgets/person_cache_image_widget.dart';

import '../../domain/entities/person_entities.dart';

class PersonCardWidget extends StatelessWidget {
  final PersonEntity person;

  const PersonCardWidget({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PersonDetailPage(person: person),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: PersonCacheImage(imageUrl: person.image)),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    Text(
                      person.name,
                      style: TextStyle(
                        fontSize: 20,

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
                                person.status == 'Alive'
                                    ? Colors.green
                                    : Colors.red,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            '${person.status} - ${person.species}',

                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text('Last known location:', style: TextStyle()),
                    const SizedBox(height: 4),
                    Text(
                      person.location?.name ?? "",

                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    Text('Origin:', style: TextStyle()),
                    const SizedBox(height: 4),
                    Text(
                      person.origin?.name ?? "",
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
                  context.read<PersonListCubit>().toggleFavorite(person).then((
                    _,
                  ) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          person.isFavored
                              ? 'Removed from favorites'
                              : 'Added to favorites',
                        ),
                      ),
                    );
                  });
                },
                icon: Icon(
                  Icons.favorite,
                  color:
                      person.isFavored ? Colors.deepOrangeAccent : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
