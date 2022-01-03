import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/modules/meal.dart';
import 'package:meal_app/screens/meals_details_Screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;


  const MealItem({

    @required this.imageUrl,
  @required this.title,
  @required this.duration,
  @required this.complexity,
  @required this.affordability,
    @required this.id,
  }) ;

  String get complexityText{
    switch(complexity){
      case Complexity.Simple: return 'simple';break;
      case Complexity.Challenging: return 'challenging';break;
      case Complexity.Hard: return 'hard';break;
      default:  return 'unknown';break;
    }
  }
  String get affordabilityText{
    switch(affordability){
      case Affordability.Affordable: return 'affordable';break;
      case Affordability.Pricey: return 'pricey';break;
      case Affordability.Luxurious: return 'Luxrious';break;
      default:  return 'unknown';break;
    }
  }





  void selectMeal(BuildContext ctx){
    Navigator.of(ctx).pushNamed(MealDetailsScreen.routeName,
      arguments: id,
    ).then((result) {
  //  if(result != null) removeItem(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(imageUrl,height: 200,width:double.infinity,fit: BoxFit.cover,),
                ),
                Container(
                  width: 300,
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                  child: Positioned(
                    bottom: 20,
                      right: 10,
                      child: Text(title,style: TextStyle(fontSize: 26,color: Colors.white),
                        softWrap: true,overflow: TextOverflow.fade,)),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 Row(children: [Icon(Icons.schedule),SizedBox(width:6),Text("$duration min",style: TextStyle(color: Colors.black),),],),
                 Row(children: [Icon(Icons.work),SizedBox(width:6),Text("$complexityText ",style: TextStyle(color: Colors.black),),],),
                 Row(children: [Icon(Icons.attach_money_rounded),SizedBox(width:6),Text("$affordabilityText",style: TextStyle(color: Colors.black),),],),


               ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
