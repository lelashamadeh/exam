import 'package:meta/meta.dart';
import 'dart:convert';

class FruitSaladModel {
    final List<Meal> meals;

    FruitSaladModel({
        required this.meals,
    });

    FruitSaladModel copyWith({
        List<Meal>? meals,
    }) => 
        FruitSaladModel(
            meals: meals ?? this.meals,
        );

    factory FruitSaladModel.fromRawJson(String str) => FruitSaladModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory FruitSaladModel.fromJson(Map<String, dynamic> json) => FruitSaladModel(
        meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
    };
}

class Meal {
    final String strMeal;
    final String strMealThumb;
    final String idMeal;

    Meal({
        required this.strMeal,
        required this.strMealThumb,
        required this.idMeal,
    });

    Meal copyWith({
        String? strMeal,
        String? strMealThumb,
        String? idMeal,
    }) => 
        Meal(
            strMeal: strMeal ?? this.strMeal,
            strMealThumb: strMealThumb ?? this.strMealThumb,
            idMeal: idMeal ?? this.idMeal,
        );

    factory Meal.fromRawJson(String str) => Meal.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        strMeal: json["strMeal"],
        strMealThumb: json["strMealThumb"],
        idMeal: json["idMeal"],
    );

    Map<String, dynamic> toJson() => {
        "strMeal": strMeal,
        "strMealThumb": strMealThumb,
        "idMeal": idMeal,
    };
}