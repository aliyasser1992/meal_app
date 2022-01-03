

import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';


class MealDetailsScreen extends StatelessWidget {

  static const routeName ='meal_detail';
  final Function togleFavorites;
  final Function isFavorites;
  MealDetailsScreen(this.togleFavorites,this.isFavorites);
  Widget buildSectionTitle(BuildContext context ,String text){
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child:
        Text(text,style: Theme.of(context).textTheme.headline6,)
    );

  }
  @override
  Widget build(BuildContext context) {
    final mailId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mailId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl,fit: BoxFit.fill,  ),
            ),
           buildSectionTitle(context,'Ingredient'),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)
              ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(12),
            height: 250,
            width: 350,
            child:  ListView.builder(
              itemBuilder: (ctx, index)=> Card(
                color: Theme.of(context).accentColor,
                child:Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  child: Text(selectedMeal.ingredients[index]),
                )


              ),
              itemCount: selectedMeal.ingredients.length,),),
            buildSectionTitle(context,'Steps'),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)
              ),
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(10),
              height: 250,
              width: 350,
              child:  ListView.builder(
                itemBuilder: (ctx, index)=> Card(
                    color: Theme.of(context).accentColor,
                    child:Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                      child: Text(selectedMeal.steps[index]),
                    )


                ),
                itemCount: selectedMeal.steps.length,),),

          ],
        ),
      ),
        floatingActionButton:FloatingActionButton(
        onPressed: ()=> togleFavorites(mailId),
          child: Icon(
            isFavorites(mailId) ? Icons.star : Icons.star_border,
          ),
      )
    );
  }
}
