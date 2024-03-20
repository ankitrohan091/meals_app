import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_list.dart';

class MealScreen extends StatelessWidget {
  final String? title;
  final List<Meal> meals;
  const MealScreen({super.key, this.title, required this.meals});
  @override
  Widget build(context) {
     Widget content= meals.isNotEmpty
          ? ListView.builder(
              itemCount: meals.length,
              itemBuilder: ((context, index) {
                return MealList(meal: meals[index]);
              }))
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('No Meals is Available!',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          )),
                  const SizedBox(height: 16),
                  Text('Please Try Different Category!',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          ))
                ],
              ),
    );

    if(title==null){
      return content;
    }
    return Scaffold(
      appBar: AppBar(title: Text(title!),),
      body: content,
    );
  }
}
