import 'package:meals_app/models/category.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/dummy_meals.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_screen.dart';

class GridItem extends StatelessWidget {
  final Category item;
  final List<Meal> list = dummyMeals;
  const GridItem({super.key, required this.item});
  List<Meal> filterList() {
    List<Meal> meal = list.where((e) => 
    e.categories.contains(item.id)
    ).toList();
    return meal;
  }
  @override
  Widget build(context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MealScreen(
                  title: item.title,
                  meals: filterList(),
                )));
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              item.color.withOpacity(0.40),
              item.color.withOpacity(0.80)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Text(
              item.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ],
        ),
      ),
    );
  }
}
