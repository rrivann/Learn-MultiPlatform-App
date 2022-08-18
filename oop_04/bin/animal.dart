abstract class Animal {
  String _name = '';
  int _age = 0;
  double _weight = 0;

  Animal(this._name, this._age, this._weight);

  String get name => _name;
  int get age => _age;
  double get weight => _weight;

  set setName(String value) {
    _name = value;
  }

  set setAge(int value) {
    _age = value;
  }

  void eat() {
    print('$_name is eating.');
    _weight = _weight + 0.2;
  }

  void sleep() {
    print('$_name is sleeping.');
  }
}
