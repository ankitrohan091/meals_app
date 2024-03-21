import 'package:flutter/material.dart';

// import 'package:meals/screens/tabs.dart';
// import 'package:meals/widgets/main_drawer.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool isGlutenFreeFilterSet=false;
  bool isLactoseFreeFilterSet=false;
  bool isVegetarianFilterSet=false;
  bool isVeganFilterSet=false;
  SwitchListTile options({required bool value,required String title,required String subtitle}){
    return SwitchListTile(
            value: value,
           onChanged: (isChecked){
            setState((){
              if(title=='Gluten-free'){
                isGlutenFreeFilterSet=isChecked;
              }else if(title=='Lactose-free'){
                isLactoseFreeFilterSet=isChecked;
              }else if(title=='Vegetarian'){
                isVegetarianFilterSet=isChecked;
              }else if(title=='Vegan'){
                isVeganFilterSet=isChecked;
              }
            });
           },
            title: Text(title,style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground
            ),),
            subtitle: Text(subtitle,style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),),
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          );
  }
   @override
  void initState() {
    super.initState();
    isGlutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    isLactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    isVegetarianFilterSet = widget.currentFilters[Filter.vegetarian]!;
    isVeganFilterSet = widget.currentFilters[Filter.vegan]!;
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          Navigator.of(context).pop({
            Filter.glutenFree:isGlutenFreeFilterSet,
            Filter.lactoseFree:isLactoseFreeFilterSet,
            Filter.vegetarian:isVegetarianFilterSet,
            Filter.vegan:isVeganFilterSet,
          });
        },
        child: Column(
          children: [
            options(value:isGlutenFreeFilterSet, title:'Gluten-free', subtitle: 'Only include gluten-free meals.'),
            options(value: isLactoseFreeFilterSet, title: 'Lactose-free', subtitle: 'Only include lactose-free meals.'),
            options(value: isVegetarianFilterSet, title: 'Vegetarian', subtitle: 'Only include vegetarian meals.'),
            options(value: isVeganFilterSet, title: 'Vegan', subtitle: 'Only include vegan meals.'),
          ],
        ),
      ),
    );
  }
}