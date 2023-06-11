import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/widgets/meal_item_trat.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectMeal});


  final Meal meal;
  final Function(BuildContext context,Meal meal) onSelectMeal;

  String get complexityText{
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
  }

  String get affordabilityText{
    return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.hardEdge,
      elevation: 4,
      child: InkWell(
        onTap: (){
          onSelectMeal(context, meal);
        },
        child: Stack(
          children: [
            FadeInImage(placeholder: MemoryImage(kTransparentImage), image: NetworkImage(meal.imageUrl), fit: BoxFit.cover, width: double.infinity, height: 250,),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child:Container(
                padding:const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(meal.title,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(icon: Icons.schedule_outlined, label: '${meal.duration} min'),
                        const SizedBox(width: 12,),
                        MealItemTrait(icon: Icons.work, label: complexityText),
                        const SizedBox(width: 12,),
                        MealItemTrait(icon: Icons.attach_money, label: affordabilityText),
                      ],
                    
                    )
                  ],
                ),
              ),
              ),
              
          ],
        ),
      ),
    );
  }
}