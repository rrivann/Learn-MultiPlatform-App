class FoodsAndDrinks {
  String name;

  FoodsAndDrinks({required this.name});

  factory FoodsAndDrinks.fromJson(Map<String, dynamic> foodsanddrink) =>
      FoodsAndDrinks(name: foodsanddrink['name']);
}
