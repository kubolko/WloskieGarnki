// To parse this JSON data, do
//
//     final dish = dishFromJson(jsonString);

import 'package:cloud_firestore/cloud_firestore.dart';

class Dish {
  List<String> comments;
  String description;
  String dish;
  List<String> images;
  List<String> ingredients;
  bool isRecommended;
  int weight;
  String? referenceId;

  Dish(
    this.dish, {
    required this.comments,
    required this.description,
    required this.images,
    required this.ingredients,
    required this.isRecommended,
    required this.weight,
  });

  factory Dish.fromSnapshot(DocumentSnapshot snapshot) {
    Dish newDish = Dish.fromJson(snapshot.data() as Map<String, dynamic>);
    newDish.referenceId = snapshot.reference.id;
    return newDish;
  }

  factory Dish.fromJson(Map<String, dynamic> json) => _dishFromJson(json);

  Map<String, dynamic> toJson() => _DishToJson(this);

  @override
  String toString() => "Dish<$dish>";
}

Dish _dishFromJson(Map<String, dynamic> json) {
  return Dish(
    json['dish'] as String,
    description: json['description'] as String,
    comments: json['comments'] as List<String>,
    weight: json['weight'] as int,
    images: json['images'] as List<String>,
    ingredients: json['ingredients'] as List<String>,
    isRecommended: json['isRecommended'] as bool,
  );
}

Map<String, dynamic> _DishToJson(Dish instance) => <String, dynamic>{
      'comments': instance.comments,
      'description': instance.description,
      'dish': instance.dish,
      'images': instance.images,
      'ingredients': instance.ingredients,
      'isRecommended': instance.isRecommended,
      'weight': instance.weight,
    };
