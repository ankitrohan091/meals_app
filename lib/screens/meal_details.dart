import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/tabs.dart';

class MealDetailsScreen extends StatefulWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
    required this.onToggleFavorite,
  });

  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    bool isFavorite=favoriteMeals.contains(widget.meal);
    return Scaffold(
        appBar: AppBar(title: Text(widget.meal.title), actions: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            color: isFavorite
                    ? Colors.redAccent
                    : Colors.white,
            child: IconButton(
              onPressed: () {
                widget.onToggleFavorite(widget.meal);
                setState(() {
                });
              },
              icon: const Icon(
                Icons.star),
            ),
          )
        ]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                widget.meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 14),
              Text(
                'Ingredients',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 14),
              for (final ingredient in widget.meal.ingredients)
                Text(
                  ingredient,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              const SizedBox(height: 24),
              Text(
                'Steps',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 14),
              for (final step in widget.meal.steps)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Text(
                    step,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                ),
            ],
          ),
        ));
  }
}
