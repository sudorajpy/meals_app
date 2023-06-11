import 'package:flutter/material.dart';
import 'package:meals_app/main.dart';
import 'package:meals_app/model/category.dart';


class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: theme.colorScheme.onBackground.withOpacity(0.3),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding:const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.7),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child:Text(category.title, style: Theme.of(context).textTheme.titleLarge!.copyWith(
          // color: theme.of(context).colorScheme.onBackground,
        )
        ),
      ),
    );
  }
}