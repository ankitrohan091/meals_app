import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/dummy_data.dart';
enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FilterNotifer extends StateNotifier<Map<Filter,bool>>{
  FilterNotifer(): super({
    Filter.glutenFree:false,
    Filter.lactoseFree:false,
    Filter.vegetarian:false,
    Filter.vegan:false,
  });
  void setFilters(Map<Filter,bool> chosenFilter){
    state=chosenFilter;
  }
  void setFilter(Filter filter,bool status){
    state={...state,filter:status};
  }
}

final filterProvider=StateNotifierProvider<FilterNotifer,Map<Filter,bool>>((ref) {
  return FilterNotifer();
});

final filteredMealProvider=Provider((ref){
  final filter=ref.watch(filterProvider);
  return dummyMeals.where((meal) {
      if (filter[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (filter[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (filter[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (filter[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
});