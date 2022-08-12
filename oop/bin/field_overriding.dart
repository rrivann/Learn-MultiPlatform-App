class Person {
  String name = 'person';

  void sayHello(String name) {
    print('Hi $name, my name is ${this.name}');
  }
}

class OtherPerson extends Person {
  @override
  String name = 'other';
}

void main(List<String> args) {
  var person = Person();
  person.sayHello('rivann');

  var person2 = OtherPerson();
  person2.sayHello('rivann');
}
