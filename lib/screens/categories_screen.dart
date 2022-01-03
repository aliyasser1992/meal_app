
import 'package:flutter/material.dart';
import 'package:meal_app/widgets/categories_item.dart';


import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: GridView(
        padding: EdgeInsets.all(25),
        children:DUMMY_CATEGORIES.map((catData) =>
        CategoryItem(catData.id, catData.title, catData.color),
        ).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 600,
            childAspectRatio: 2/1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
      ),
    );
  }
}
