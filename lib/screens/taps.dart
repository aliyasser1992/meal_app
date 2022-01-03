import 'package:flutter/material.dart';
import 'package:meal_app/modules/meal.dart';
import 'package:meal_app/widgets/mai_drawer.dart';
import 'categories_screen.dart';
import 'favoriteScreen.dart';

class TapsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TapsScreen( this.favoriteMeals);

  @override
  _TapsScreenState createState() => _TapsScreenState();
}

class _TapsScreenState extends State<TapsScreen> {

    List<Map<String,Object>>_pages ;
  int _selectPageIndex= 0;
  @override
  void initState() {
    // TODO: implement initState
    _pages= [
      {
        'page': CategoriesScreen(),
        'title' : 'Categories',
      },
      {
        'page': favoriteScreen(widget.favoriteMeals),
        'title' : 'Favorite',
      },
    ];
  }

  void _selectPage(int value){
   setState(() {
     _selectPageIndex =value;
   });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text(_pages[_selectPageIndex]['title']),
      ),
      body: _pages[_selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.amber,

        selectedItemColor:Colors.black54,
        unselectedItemColor: Colors.white,
        currentIndex: _selectPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favorites'),

          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
