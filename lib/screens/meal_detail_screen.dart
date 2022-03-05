import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'Meal_Detail';

  final Function toggleFavorite;
  final Function isMealFavorite;

  MealDetailScreen(this.toggleFavorite, this.isMealFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 250,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as String;
    String mealId = routeArgs.toString();
    final selectedMeals = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeals.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Image.network(
                selectedMeals.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingridients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(selectedMeals.ingredients[index])),
                  );
                },
                itemCount: selectedMeals.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('#${index + 1}'),
                        ),
                        title: Text(
                          selectedMeals.steps[index],
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                },
                itemCount: selectedMeals.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: toggleFavorite(mealId),
        child: Icon(
          isMealFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }
}
