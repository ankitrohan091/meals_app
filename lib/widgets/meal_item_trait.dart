import 'package:flutter/material.dart';
class MealTrait extends StatelessWidget{
  const MealTrait({super.key,required this.icon,required this.label,required this.message});
  final IconData icon;
  final String label;
  final String message;
  @override
  Widget build(BuildContext context){
    return Row(children: [
      Tooltip(
        message: message,
        child: Icon(icon,
        color: Colors.white,
        size: 20,
        ),
      ),
      const SizedBox(width: 6,),
      Text(label,style: const TextStyle(
        color: Colors.white,
      ),),
    ],);
  }
}