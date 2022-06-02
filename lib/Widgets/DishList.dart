import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:woski_garnek/Widgets/MenuCard.dart';

import '../Models/Dish.dart';

class DishList extends StatelessWidget {
  final List<Dish> dishes;

  DishList({Key? key, required this.dishes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dishes == null ? 0 : dishes.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: MenuCard(
              dish: dishes[index],
            ),
          );
        });
  }
}
