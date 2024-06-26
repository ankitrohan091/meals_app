import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorite_meals_provider.dart';

class MealDetailsScreen extends ConsumerStatefulWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  ConsumerState<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends ConsumerState<MealDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    ScaffoldMessengerState messengerState=ScaffoldMessenger.of(context);
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    bool isFavorite = favoriteMeals.contains(widget.meal);
    return Scaffold(
        appBar: AppBar(title: Text(widget.meal.title),actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 16),
            onPressed: () {
              bool isAdd=ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleMealFavoriteStatus(widget.meal);
              messengerState.clearSnackBars();
              messengerState.showSnackBar(
                SnackBar(
                  content: Text(isAdd?'Meal added as a favorite.':'Meal removed from favorite.'),
                  duration: const Duration(seconds: 3),
                  action: SnackBarAction(label: 'Undo',onPressed: () {
          
                    ref.read(favoriteMealsProvider.notifier).toggleMealFavoriteStatus(widget.meal);
                  },),
                ),
              );
            },
            icon: Icon(isFavorite?Icons.star:Icons.star_border_outlined),
          )
        ]),
        body: SingleChildScrollView(
          child: PopScope(
            canPop: false,
            onPopInvoked: ((bool didPop) {
              if(!didPop){
                Navigator.of(context).pop({
                  ScaffoldMessenger.of(context).clearSnackBars(),
                });
            }
            }),
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
          ),
        ));
  }
}
