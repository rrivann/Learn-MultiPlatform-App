class Person {
  String name = 'Guest';
  String? address;
  final String country = 'Indonesia';

  // constructor
  Person(this.name, this.address);
}

void main(List<String> args) {
  var person = Person('rivan', 'bandung');
  print(person.name);
}
