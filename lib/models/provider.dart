import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/dummy_meals.dart';
final mealProvider=Provider((ref){
  return dummyMeals;
});