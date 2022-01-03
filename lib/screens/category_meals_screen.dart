import 'package:flutter/material.dart';
import 'package:meal_app/modules/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'category_meal';
  final List<Meal> _avaliableMeals;

  CategoryMealsScreen(this._avaliableMeals);


  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String CategoryTitle;
  List<Meal> displayMeal;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    {
      final routeArg =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final CategoryId = routeArg['id'];
      CategoryTitle = routeArg['title'];
      displayMeal = widget._avaliableMeals.where((meal) {
        return meal.categories.contains(CategoryId);
      }).toList();
      super.didChangeDependencies();
    }

  }

  void _removeMeal(String mealId) {
    setState(() {
      displayMeal.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CategoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayMeal[index].id,
            imageUrl: displayMeal[index].imageUrl,
            title: displayMeal[index].title,
            duration: displayMeal[index].duration,
            complexity: displayMeal[index].complexity,
            affordability: displayMeal[index].affordability,

          );
        },
        itemCount: displayMeal.length,
      ),
    );
  }
}
