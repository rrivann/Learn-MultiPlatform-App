class Person {
  String name = 'Guest';
  String? address;
  final String country = 'Indonesia';

  // constructor
  Person(this.name, this.address);
  Person.withName(this.name);
  Person.withAddress(this.address);
}

void main(List<String> args) {
  var person = Person('rivan', 'bandung');
  var person2 = Person.withName('riv');
  var person3 = Person.withAddress('pasir');
  print(person.name);
  print(person2.name);
  print(person3.address);
}
