import 'package:flutter/material.dart';
import 'package:meals_app/models/dummy_meals.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/meal_screen.dart';
class MainDrawer extends StatelessWidget{
  const MainDrawer({super.key});
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
                ),
            ),
            child: Row(
              children:[
                Icon(Icons.fastfood,size: 48,color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 12,),
                Text('Cooking Up!',style: Theme.of(context).textTheme.headlineLarge,),
              ]
            ),
          ),
          Tooltip(
            message: 'See all Meals',
            child: ListTile(
              leading: const Icon(Icons.restaurant,size: 26,),
              title: Text('Meals',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 24
              ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (ctx){
                  return const MealScreen(meals: dummyMeals,);
                }));
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings,size: 26,),
            title: Text('Filters',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 24
            ),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (ctx){
                return const Filter();
              }));
            },
          ),
        ],
      ),
    );
  }
}