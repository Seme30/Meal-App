import 'package:flutter/material.dart';

import '../dummy_data.dart';

import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 100,
          mainAxisExtent: 150,
        ),
        children: DUMMY_CATEGORIES
            .map((e) => CategoryItem(e.id, e.title, e.color))
            .toList());
  }
}
