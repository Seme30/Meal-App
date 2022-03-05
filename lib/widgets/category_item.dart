import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem(this.id, this.title, this.color);

  void _tapListener(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _tapListener(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        height: 300,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  // height: 300,
                  padding: const EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [color.withOpacity(0.7), color],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 20,
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Raleway',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
