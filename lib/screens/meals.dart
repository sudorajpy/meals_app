import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screens/meals_details.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key,  this.title, required this.meals, required this.onToggleMeal});

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleMeal;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context)
    .push(MaterialPageRoute(
      builder: (ctx) => MealsDetailsScreen(
        meal: meal,
        onToggleMeal: onToggleMeal,)
    )
    
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content= ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
        onSelectMeal: selectMeal
        ),
      );

      if(meals.isEmpty) {
        content = const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Text('Uh oh... No meals found here',style: TextStyle(color: Color.fromARGB(255, 253, 252, 252),fontSize: 24, fontWeight: FontWeight.bold),),
              SizedBox(height: 16,),
              Text('Try Selecting a different category', style: TextStyle(color: Color.fromARGB(255, 251, 249, 249), fontSize: 16))
            ],
          )
        );
      }



      if(title == null) {
        return content;
      }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
        centerTitle: true,
        elevation: 2,
      ),
      body: content,
    );
  }
}
