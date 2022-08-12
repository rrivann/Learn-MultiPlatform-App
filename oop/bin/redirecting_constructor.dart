class Person {
  String name = 'Guest';
  String? address;
  final String country = 'Indonesia';

  // constructor
  Person(this.name, this.address);

  Person.withName(String name) : this(name, "No Address");

  Person.withAddress(String address) : this("No Name", address);

  Person.fromJakarta() : this.withAddress("Jakarta");

  Person.withNoName() : this.withName("No Name");
}

void main(List<String> args) {
  var person = Person('rivan', 'bandung');
  var person2 = Person.withName('riv');
  var person3 = Person.withAddress('pasir');
  var person4 = Person.fromJakarta();
  var person5 = Person.withNoName();

  print(person.name);
  print(person.address);

  print(person2.name);
  print(person2.address);

  print(person3.name);
  print(person3.address);

  print(person4.name);
  print(person4.address);

  print(person5.name);
  print(person5.address);
}
