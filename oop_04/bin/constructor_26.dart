void main(List<String> args) {
  var dicodingCat = Animal('gray', 2, 3);
  dicodingCat.name = 'Gray';
  dicodingCat.age = 2;
  dicodingCat.weight = 4.2;
}

class Animal {
  String name = '';
  int age = 0;
  double weight = 0;

  Animal(this.name, this.age, this.weight);
  // Animal.Name(this._name);
  // Animal.Age(this._age);
  // Animal.Weight(this._weight);
}
