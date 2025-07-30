import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/person_entities.dart';
import '../pages/person_detail_screen.dart';
import 'person_cache_image_widget.dart';

class SearchResult extends StatelessWidget {
  final PersonEntity personResult;

  const SearchResult({super.key, required this.personResult});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PersonDetailPage(person: personResult),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 2.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Container(
                child: PersonCacheImage(imageUrl: personResult.image),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                personResult.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                personResult.location?.name ?? "",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
