import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: const Text("Recipes Screen")));
  }
}
