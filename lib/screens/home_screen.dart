import 'package:flutter/material.dart';
import 'package:meals_app/models/dummy_category.dart';
import 'package:meals_app/widgets/category_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(context) {
    return GridView(
        padding: const EdgeInsets.all(4),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          ...list.map((e) => GridItem(item: e)),
        ]
      );
  }
}
