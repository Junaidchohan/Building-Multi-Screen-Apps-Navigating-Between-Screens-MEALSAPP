
import 'package:flutter/material.dart';
import 'package:recipe_navigator/data/dummy_data.dart';
import 'package:recipe_navigator/models/category.dart';
import 'package:recipe_navigator/screens/meal.dart';
import 'package:recipe_navigator/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

   void _selecteCategory(BuildContext context, Category category) {
    final filteredMeal = dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen( // Make sure MealsScreen is correctly set up
          title: category.title,
          meals: filteredMeal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: GridView( 
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          // availableCategories.map((category) => CategoryGridItem(category: category)).toList()
          for (final category in availableCategories)
            CategoryGridItem(category: category, selecteCategory: (){
              _selecteCategory(context,category); 
            },)
        ],
      ),
    );
  }
}
