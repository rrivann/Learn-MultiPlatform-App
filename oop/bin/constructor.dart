class Person {
  String name = 'Guest';
  String? address;
  final String country = 'Indonesia';

  // constructor
  Person(String paramName, String paramAddress) {
    name = paramName;
    address = paramAddress;
  }
}

void main(List<String> args) {
  var person = Person('rivan', 'bandung');
  print(person.name);
}
