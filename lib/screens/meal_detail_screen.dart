import 'package:flutter/material.dart';
import 'package:meals_app/models/dummy_meals.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailScreen extends StatefulWidget {
  final Meal meal;
  const MealDetailScreen({required this.meal, super.key});

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  Color decideColor() {
    if (favoritesMeal.contains(widget.meal)) {
      return Colors.redAccent;
    } else {
      return Colors.white;
    }
  }

  void showSnackBar({required String message}){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color color = decideColor();
    var decor =
        BoxDecoration(borderRadius: BorderRadius.circular(5), color: color);
    int ingredientsCnt = 0;
    int stepsCnt = 0;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            decoration: decor,
            child: IconButton(
                icon: const Icon(Icons.star_purple500_outlined),
                onPressed: () {
                  setState(() {
                    if (color == Colors.white) {
                      favoritesMeal.add(widget.meal);
                      showSnackBar(message: 'Added to Favorites');
                    } else {
                      favoritesMeal.remove(widget.meal);
                      showSnackBar(message: 'Removed from Favorites');
                    }
                  });
                }),
          )
        ],
        title: Text(widget.meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.meal.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              children: [
                Expanded(
                  child: Text('Ingredients',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          )),
                ),
              ],
            ),
            for (final e in widget.meal.ingredients)
              Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 2),
                child: Row(
                  children: [
                    Text(
                      '(${++ingredientsCnt}.)  $e',
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                  ],
                ),
              ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Steps',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
            for (final step in widget.meal.steps)
              Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 6),
                child: Text(
                  '(${++stepsCnt}.)  $step',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            const SizedBox(
              height: 14,
            ),
          ],
        ),
      ),
    );
  }
}
