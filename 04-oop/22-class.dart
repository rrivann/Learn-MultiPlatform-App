class Animal {
  late String name;
  late int age;
  late double weight;

  Animal(this.name, this.age, this.weight);

  void eat() {
    print('$name is eating.');
    weight = weight + 0.2;
  }

  void sleep() {
    print('$name is sleeping.');
  }

  void poop() {
    print('$name is pooping.');
    weight = weight - 0.1;
  }
}

void main() {
  var dicodingCat = Animal('Gray', 2, 4.2);
  dicodingCat.eat();
  dicodingCat.poop();
  print(dicodingCat.weight);
}
