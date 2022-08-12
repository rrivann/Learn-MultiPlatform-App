class Person {
  String name = 'rivan';
  String? address;
  final String country = 'indonesia';

  void sayHello(String paramName) {
    print('hello $paramName, my name is $name');
  }

  String getName() {
    return 'my name is $name';
  }
}

// cara untuk menggunakan class orang lain tidak ingin di ubah
extension SayGoodByeOnPerson on Person {
  void sayGoodBye(String paramName) {
    print('good bye $paramName, from $name');
  }
}

void main(List<String> args) {
  var person = Person();
  person.name = 'albani';
  person.address = 'bandung';
  person.sayGoodBye('');
  // Person person2 = Person();

  print(person.name);
  print(person.address);
  print(person.country);

  person.sayHello('rivan');
  print(person.getName());
}
