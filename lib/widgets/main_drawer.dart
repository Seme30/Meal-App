import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function selectHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Raleway',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        selectHandler();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          Divider(),
          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
