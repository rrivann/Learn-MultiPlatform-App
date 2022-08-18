import 'dart:io';

void main(List<String> args) {
  // int myAge = 21;
  // double phi = 3.14;
  // num one = 1;
  // bool isWhat = true;
  // String hello = 'Hello';
  // List colors = ['red', 'blue', 'white'];
  // Map group = {'t': 1, 'x': 5};
  // dynamic free = 1;

  stdout.write('Your Name : ');
  String? name = stdin.readLineSync();
  stdout.write('Your Age : ');
  int age = int.parse(stdin.readLineSync()!);
  print('Halo $name, your age is $age years');
}
