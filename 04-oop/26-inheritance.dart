import 'Animal.dart';

class Cat extends Animal {
  late String furColor;

  Cat(String name, int age, double weight, String furColor)
      : super(name, age, weight) {
    this.furColor = furColor;
  }

  void walk() {
    print("name is walking");
  }
}

void main() {
  var dicodingCat = Cat('Grayson', 2, 2.2, 'Gray');
  dicodingCat.walk();
  dicodingCat.eat();
  print(dicodingCat.weight);
}

// Cat(String name, int age, double weight, this.furColor) : super(name, age, weight);

/*
Output :
  Grayson is walking
  Grayson is eating.
  2.4000000000000004
 */
