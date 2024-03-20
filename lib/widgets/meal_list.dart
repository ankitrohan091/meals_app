import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealList extends StatelessWidget{
  final Meal meal;
  const MealList({required this.meal,super.key});
  String upperCaseComplexity(){
    String complex=meal.complexity.name;
    complex=complex[0].toUpperCase()+complex.substring(1);
    return complex;
  }
  String upperCaseAffordability(){
    String afford=meal.affordability.name;
    afford=afford[0].toUpperCase()+afford.substring(1);
    return afford;
  }
  @override
  Widget build(BuildContext context){
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 6,vertical: 3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: (){
          Navigator.push(context, 
          MaterialPageRoute(builder: (ctx)=> MealDetailScreen(
            meal: meal,
          ))
          );
        },
        child: Stack(
          children: [
            FadeInImage(placeholder: MemoryImage(kTransparentImage), 
            image: NetworkImage(meal.imageUrl),
            fit: BoxFit.cover,
            height: 220,
            width: double.infinity,
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: const Color.fromARGB(165, 0, 0, 0),
                padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 44),
                child: Column(children: [
                  Text(meal.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                ),
                const SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  MealTrait(icon: Icons.schedule, label: '${meal.duration} min',message: 'Time taken to Serve You',),
                  const SizedBox(width: 12,),
                  MealTrait(icon: Icons.work, label: upperCaseComplexity(),message: 'Preparing process',),
                  const SizedBox(width: 12,),
                  MealTrait(icon: Icons.currency_rupee, label: upperCaseAffordability(),message: 'Price',)
                ],)
              ],),
            ))
          ],
        ),
      ),
    );
  }
}