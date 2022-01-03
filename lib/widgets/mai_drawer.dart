import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: [
      Container(
        height: 90,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        alignment: Alignment.bottomLeft,
        color: Colors.amber,
        child: Text(
          'Maqlobh resturant',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      ListTile(
        leading: Icon(
          Icons.restaurant,
          size: 26,
          color: Colors.orange,
        ),
        title: Text(
          'Meal',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          Navigator.of(context).pushReplacementNamed('/');
        },
      ),
      ListTile(
        leading: Icon(
          Icons.settings,
          size: 26,
          color: Colors.orange,
        ),
        title: Text(
          'filters',
          style: TextStyle(
              fontSize: 24,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold),
        ),
        onTap: () {
          Navigator.of(context).pushReplacementNamed('/filters');
        },
      ),
      ListTile(
        leading: Icon(
          Icons.star,
          size: 26,
          color: Colors.orange,
        ),
        title: Text(
          'Favorites',
          style: TextStyle(
              fontSize: 24,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold),
        ),
        onTap: () {
          Navigator.of(context).pushReplacementNamed('/favorites');
        },
      ),
    ]));
  }
}
