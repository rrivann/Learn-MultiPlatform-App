class Person {
  String name = 'Guest';
  String? address;
  final String country = 'Indonesia';

  // constructor
  Person(String name, String address) {
    this.name = name;
    this.address = address;
  }
}

void main(List<String> args) {
  var person = Person('rivan', 'bandung');
  print(person.name);
}
