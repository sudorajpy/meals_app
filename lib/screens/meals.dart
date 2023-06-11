import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content= ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) => Text(meals[index].title),
      );

      if(meals.isEmpty) {
        content = const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Text('Uh oh... No meals found',style: TextStyle(color: Color.fromARGB(255, 253, 252, 252),fontSize: 24, fontWeight: FontWeight.bold),),
              SizedBox(height: 16,),
              Text('Try Selecting a different category', style: TextStyle(color: Color.fromARGB(255, 251, 249, 249), fontSize: 16))
            ],
          )
        );
      }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        elevation: 2,
      ),
      body: content,
    );
  }
}
