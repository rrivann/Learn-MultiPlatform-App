import 'implicit_interface_30.dart';

mixin Flyable {
  void fly() {
    print("I'm flying");
  }
}

mixin Walkable {
  void walk() {
    print("I'm walking");
  }
}

mixin Swimmable {
  void swim() {
    print("I'm swimming");
  }
}

class Cat with Walkable {}

class Duck extends Bird with Walkable, Flyable, Swimmable {
  Duck(super.name, super.age, super.weight, super.featherColor);
}

void main() {
  var donald = Duck('a', 21, 23, 'a');
  var garfield = Cat();
  garfield.walk();
  donald.walk();
  donald.swim();

  var arielNoah = Musician();
  arielNoah.perform();
}

abstract class Performer {
  void perform();
}

mixin Dancer implements Performer {
  @override
  void perform() {
    print('Dancing');
  }
}

class Singer implements Performer {
  @override
  void perform() {
    print('Singing');
  }
}

class Musician extends Performer with Dancer, Singer {
  void showTime() {
    perform();
  }
}
