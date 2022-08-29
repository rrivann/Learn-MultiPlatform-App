import 'package:restaurant_app/models/foods_drinks.dart';

class Menus {
  List<FoodsAndDrinks> foods;
  List<FoodsAndDrinks> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });

  factory Menus.fromJson(Map<String, dynamic> menus) => Menus(
        foods: List<FoodsAndDrinks>.from(
            menus["foods"].map((x) => FoodsAndDrinks.fromJson(x))),
        drinks: List<FoodsAndDrinks>.from(
            menus["drinks"].map((x) => FoodsAndDrinks.fromJson(x))),
      );
}
