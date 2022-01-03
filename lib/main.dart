import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/modules/meal.dart';
import 'package:meal_app/screens/favoriteScreen.dart';
import './screens/category_meals_screen.dart';
import './screens/filter_screen.dart';
import './screens/meals_details_Screen.dart';
import './screens/taps.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetrian': false,
  };
  List<Meal> _avaliableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];
  bool _isMealFavorites(String id){
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  void _setFilters(Map<String, bool> _filterData) {
    setState(() {
      _filters = _filterData;
      _avaliableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenfree) {
          return false;
        }
        ;
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        ;
        if (_filters['lactose'] && !meal.isLactosefree) {
          return false;
        }
        ;
        if (_filters['vegetrian'] && !meal.isVegetrian) {
          return false;
        }
        ;
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if(existingIndex>=0){
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    }
     else{
       setState(() {
         _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
       });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.amber,
          accentColor: Color.fromARGB(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                  //  color: Color.fromARGB(20, 50, 50, 1)
                  ),
              title: TextStyle(
                  fontSize: 24,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold))),
      //home: MyHomePage(),

      routes: {
        '/': (context) => TapsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_avaliableMeals),
        MealDetailsScreen.routeName: (context) => MealDetailsScreen(_toggleFavorite,_isMealFavorites),
        Filter_screen.routName: (context) =>
            Filter_screen(_setFilters, _filters),


        



      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('meal app'),
      ),
      body: null,
    );
  }
}
